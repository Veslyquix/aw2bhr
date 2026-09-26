#!/usr/bin/env python3
"""Port a draft across a header rename or struct reshape, by OFFSET, and prove it.

When the headers rename a global, rename a struct tag, rename a field or MOVE
fields, every draft written against the old headers breaks -- or, worse, keeps
compiling and reads the wrong member. Wave 90 met both at once: PR #3 renamed
gUnknown_03003FC0 -> gPlaySt, struct Unk08499598 -> PlayerStruct and dozens of
fields, and RESHAPED struct KeySt so that the old names `held`, `repeated`,
`pressed` and `previous` all still exist at DIFFERENT offsets. A port by name
builds silently and reads the wrong halfword. This tool ports by offset:

  1. It parses the draft against the OLD headers (git revision --old-rev) with
     pycparser, types every `.field` / `->field` access, and asks agbcc itself
     for every field's offset and size (a probe compile, so layout rules and
     padding are the compiler's, not a guess). Positions are in BITS: a
     bitfield (struct Unit's unk04_0 flags) is probed as a constant with only
     that field set, and maps like any other field.
  2. It maps each old struct tag to a new one: the same tag if it still exists;
     otherwise by pairing the old and new declared types of the same global
     (or of the global now at the same ADDRESS, from aw2bhr.sym / aw2bhr.lds)
     and of same-named function prototypes.
  3. Each accessed field maps to the new field at the SAME OFFSET. An old name
     that still exists in the new struct at a DIFFERENT offset is flagged
     `RESHAPE` -- the access is rewritten, and the flag tells you why a
     name-based port would have compiled and been wrong.
  4. A global the new headers no longer declare is renamed to the declared name
     at the same address. A struct the draft defined LOCALLY whose tag the new
     headers now define is removed, and its accesses remapped onto the header's
     layout.
  5. It writes the proposal to build/port/<fn>/<fn>.c (never to work/),
     compiles it under the current headers, and compares its .text, .rodata
     and relocations with the OLD draft compiled under the OLD headers
     (tools/drafts.py's oracle; a pure symbol rename compares equal). A port is
     done when that says `bytes: SAME`.

Anything it cannot decide is listed under NEEDS HAND WORK with its line --
including a global that kept its name but changed TYPE (wave 90:
`u32 gUnknown_0200CC88[]` became `struct SaveSlotGenerations`), which no
renaming can port. It never edits work/.

The second-porter workflow (wave 90: old headers are 803d1bd):

    cp work/F/F.c work/F/F.prepr3.c                            # keep the old source
    python tools/port_rename.py F --old-rev 803d1bd            # propose + compile + byte check
    #   fix any NEEDS HAND WORK lines in build/port/F/F.c, then re-check it:
    python tools/port_rename.py F --old-rev 803d1bd --old-src work/F/F.prepr3.c --verify build/port/F/F.c
    cp build/port/F/F.c work/F/F.c                             # only after `bytes: SAME`
    python tools/trymatch.py F                                 # canonical: same score as before

`--verify FILE` skips the proposal and only runs step 5 on FILE: use it on a
hand port too. `--diff` prints the proposal as a unified diff.
`--self-test` re-ports four of wave 90's hand-verified drafts from their
*.prepr3.c sources (including two KeySt reshape cases) and requires `SAME`.

Exit status: 0 = proposal compiles, bytes SAME, nothing left for a human;
1 = something needs hand work or the bytes differ; 2 = setup/parse error.
"""

import argparse
import difflib
import os
import re
import shlex
import sys

import agbenv
import awlib
import drafts

try:
    from pycparser import c_ast, c_parser
except ImportError:                                   # pragma: no cover
    c_ast = c_parser = None

REPO = awlib.REPO
OUT = "build/port"

# pycparser speaks C99 without GNU extensions. These spellings are defined
# away for the PARSE only; the probe compile and the byte check use the real
# preprocessor output.
PARSE_DEFINES = ('-D"__attribute__(x)=" -D__inline__=inline -D__inline=inline '
                 '-D__volatile__=volatile -D__const=const -D__extension__= '
                 '-D__signed__=signed')

EXPR_NODES = ()        # filled once pycparser is known to be importable


def rel(p):
    return drafts.rel(p)


# ------------------------------------------------------------ source text --

def mask_c(text, keep_comments=False):
    """Comments and string/char literals replaced by spaces, newlines kept,
    so offsets and line numbers still index the original text."""
    out = list(text)
    i, n = 0, len(text)

    def blank(a, b):
        for k in range(a, b):
            if out[k] != "\n":
                out[k] = " "
    while i < n:
        if text.startswith("/*", i):
            j = text.find("*/", i + 2)
            j = n if j < 0 else j + 2
            if not keep_comments:
                blank(i, j)
            i = j
        elif text.startswith("//", i):
            j = text.find("\n", i)
            j = n if j < 0 else j
            if not keep_comments:
                blank(i, j)
            i = j
        elif text[i] in "\"'":
            q, j = text[i], i + 1
            while j < n and text[j] != q and text[j] != "\n":
                j += 2 if text[j] == "\\" else 1
            blank(i, min(j + 1, n))
            i = j + 1
        else:
            i += 1
    return "".join(out)


def mask_asm(text):
    """Blank `asm(...)` / `__asm__ volatile (...)`: register pins and asm
    statements. pycparser has no asm; the parse only needs types."""
    out = list(text)
    for m in re.finditer(r'\b(?:__asm__|asm)\b(\s*(?:volatile|__volatile__))?\s*\(', text):
        depth, j = 0, m.end() - 1
        while j < len(text):
            if text[j] == "(":
                depth += 1
            elif text[j] == ")":
                depth -= 1
                if depth == 0:
                    break
            j += 1
        for k in range(m.start(), min(j + 1, len(text))):
            if out[k] != "\n":
                out[k] = " "
    return "".join(out)


def line_starts(text):
    starts = [0]
    for m in re.finditer("\n", text):
        starts.append(m.end())
    return starts


# ------------------------------------------------------------------ worlds --

class World:
    """Types, struct layouts and declarations of one translation unit."""

    def __init__(self, ast, src):
        self.src = src
        self.structs = {}       # key -> {"kind", "fields": [(name, typenode, bitsize)], "file", "line", "local", "infunc"}
        self.typedefs = {}      # name -> type node
        self.globals = {}       # name -> (type node, file)
        self.anon = {}          # id(Struct node) -> key
        self.offsets = {}       # key -> {field: (off, size)}
        self._rt = {}
        self._collect(ast, infunc=False)
        for ext in ast.ext:
            if isinstance(ext, c_ast.Decl) and ext.name:
                self.globals[ext.name] = (ext.type, ext.coord.file if ext.coord else None)
            elif isinstance(ext, c_ast.FuncDef):
                d = ext.decl
                self.globals[d.name] = (d.type, d.coord.file if d.coord else None)

    def _collect(self, node, infunc):
        if isinstance(node, c_ast.Typedef):
            t = node.type
            if (isinstance(t, c_ast.TypeDecl) and isinstance(t.type, (c_ast.Struct, c_ast.Union))
                    and t.type.name is None and t.type.decls is not None):
                self.anon[id(t.type)] = "typedef " + node.name
            self.typedefs[node.name] = node.type
        if isinstance(node, (c_ast.Struct, c_ast.Union)) and node.decls is not None:
            key = self.key_of(node)
            fields = []
            for d in node.decls:
                if isinstance(d, c_ast.Decl) and d.name:
                    fields.append((d.name, d.type,
                                   d.bitsize if d.bitsize is not None else None))
            f = node.coord.file if node.coord else None
            self.structs[key] = {"kind": "union" if isinstance(node, c_ast.Union) else "struct",
                                 "fields": fields, "file": f,
                                 "line": node.coord.line if node.coord else None,
                                 "local": f == self.src, "infunc": infunc}
        infunc = infunc or isinstance(node, c_ast.FuncDef)
        for _, child in node.children():
            self._collect(child, infunc)

    def key_of(self, node):
        if id(node) in self.anon:
            return self.anon[id(node)]
        kind = "union" if isinstance(node, c_ast.Union) else "struct"
        if node.name:
            return "%s %s" % (kind, node.name)
        key = "anon %s:%s" % (kind, node.coord.line if node.coord else id(node))
        self.anon[id(node)] = key
        return key

    def resolve(self, n, depth=0):
        """A type node as nested tuples: ('S', key) ('P', t) ('A', t) ('F', ret) ('B', name)."""
        if n is None or depth > 40:
            return None
        k = id(n)
        if k in self._rt:
            return self._rt[k]
        if isinstance(n, (c_ast.TypeDecl, c_ast.Typename, c_ast.Decl)):
            r = self.resolve(n.type, depth + 1)
        elif isinstance(n, c_ast.PtrDecl):
            r = ("P", self.resolve(n.type, depth + 1))
        elif isinstance(n, c_ast.ArrayDecl):
            r = ("A", self.resolve(n.type, depth + 1))
        elif isinstance(n, c_ast.FuncDecl):
            r = ("F", self.resolve(n.type, depth + 1))
        elif isinstance(n, (c_ast.Struct, c_ast.Union)):
            r = ("S", self.key_of(n))
        elif isinstance(n, c_ast.Enum):
            r = ("B", "int")
        elif isinstance(n, c_ast.IdentifierType):
            if len(n.names) == 1 and n.names[0] in self.typedefs:
                r = self.resolve(self.typedefs[n.names[0]], depth + 1)
            else:
                r = ("B", " ".join(n.names))
        else:
            r = None
        self._rt[k] = r
        return r

    def field_type(self, key, name):
        s = self.structs.get(key)
        if s is None:
            return None
        for fname, t, _ in s["fields"]:
            if fname == name:
                return self.resolve(t)
        return None

    def spell(self, key):
        """C spelling of a pointer to `key`'s type, or None (anonymous)."""
        if key.startswith(("struct ", "union ")):
            return key
        if key.startswith("typedef "):
            return key.split(" ", 1)[1]
        return None


def ptrish(t):
    return t is not None and t[0] in ("P", "A")


def elem(t):
    return t[1] if ptrish(t) else None


class Typer:
    """Walks function bodies with scopes, typing expressions and recording
    every member access and every global referenced."""

    def __init__(self, world):
        self.w = world
        self.scopes = []
        self.accesses = []      # (line, col, field, key or None, arrow)
        self.global_refs = {}   # name -> set of lines
        self.seen = set()

    def lookup(self, name):
        for sc in reversed(self.scopes):
            if name in sc:
                return self.w.resolve(sc[name])
        g = self.w.globals.get(name)
        if g is None:
            return None
        return self.w.resolve(g[0])

    def is_global(self, name):
        return not any(name in sc for sc in self.scopes) and name in self.w.globals

    def run(self, ast):
        for ext in ast.ext:
            if isinstance(ext, c_ast.FuncDef) and ext.coord and ext.coord.file == self.w.src:
                self.walk(ext)
            elif (isinstance(ext, c_ast.Decl) and ext.init is not None
                  and ext.coord and ext.coord.file == self.w.src):
                self.texpr(ext.init)

    def walk(self, n):
        if n is None:
            return
        if isinstance(n, EXPR_NODES):
            self.texpr(n)
            return
        if isinstance(n, c_ast.FuncDef):
            sc = {}
            fd = n.decl.type
            if isinstance(fd, c_ast.FuncDecl) and fd.args is not None:
                for p in fd.args.params:
                    if isinstance(p, c_ast.Decl) and p.name:
                        sc[p.name] = p.type
            for p in n.param_decls or []:
                if isinstance(p, c_ast.Decl) and p.name:
                    sc[p.name] = p.type
            self.scopes.append(sc)
            self.walk(n.body)
            self.scopes.pop()
            return
        if isinstance(n, (c_ast.Compound, c_ast.For)):
            self.scopes.append({})
            for _, c in n.children():
                self.walk(c)
            self.scopes.pop()
            return
        if isinstance(n, c_ast.Decl):
            if n.init is not None:
                self.walk(n.init)
            if n.name and self.scopes:
                self.scopes[-1][n.name] = n.type
            return
        for _, c in n.children():
            self.walk(c)

    def texpr(self, n):
        if n is None:
            return None
        if isinstance(n, c_ast.ID):
            if self.is_global(n.name) and n.coord and n.coord.file == self.w.src:
                self.global_refs.setdefault(n.name, set()).add(n.coord.line)
            return self.lookup(n.name)
        if isinstance(n, c_ast.Constant):
            return ("P", ("B", "char")) if n.type == "string" else ("B", "int")
        if isinstance(n, c_ast.Cast):
            self.texpr(n.expr)
            return self.w.resolve(n.to_type)
        if isinstance(n, c_ast.UnaryOp):
            if n.op == "sizeof":
                if not isinstance(n.expr, c_ast.Typename):
                    self.texpr(n.expr)
                return ("B", "int")
            t = self.texpr(n.expr)
            if n.op == "&":
                return ("P", t)
            if n.op == "*":
                return elem(t) if ptrish(t) else (t[1] if t and t[0] == "F" else None)
            if n.op in ("p++", "p--", "++", "--", "-", "+", "~"):
                return t
            return ("B", "int")
        if isinstance(n, c_ast.BinaryOp):
            a, b = self.texpr(n.left), self.texpr(n.right)
            if n.op in ("+", "-"):
                if ptrish(a):
                    return ("B", "int") if (n.op == "-" and ptrish(b)) else ("P", elem(a))
                if ptrish(b) and n.op == "+":
                    return ("P", elem(b))
                return a or b
            if n.op in ("<", ">", "<=", ">=", "==", "!=", "&&", "||"):
                return ("B", "int")
            return a or b
        if isinstance(n, c_ast.TernaryOp):
            self.texpr(n.cond)
            a, b = self.texpr(n.iftrue), self.texpr(n.iffalse)
            for t in (a, b):
                if t is not None and t[0] in ("P", "A", "S"):
                    return t
            return a or b
        if isinstance(n, c_ast.ArrayRef):
            a, i = self.texpr(n.name), self.texpr(n.subscript)
            if ptrish(a):
                return elem(a)
            if ptrish(i):
                return elem(i)
            return None
        if isinstance(n, c_ast.StructRef):
            b = self.texpr(n.name)
            if n.type == "->":
                b = elem(b) if ptrish(b) else None
            key = b[1] if (b is not None and b[0] == "S") else None
            if id(n) not in self.seen and n.field.coord and n.field.coord.file == self.w.src:
                self.seen.add(id(n))
                self.accesses.append((n.field.coord.line, n.field.coord.column or 0,
                                      n.field.name, key, n.type))
            return self.w.field_type(key, n.field.name) if key else None
        if isinstance(n, c_ast.FuncCall):
            f = self.texpr(n.name)
            if n.args is not None:
                for e in n.args.exprs:
                    self.texpr(e)
            if f is not None and f[0] == "P":
                f = f[1]
            return f[1] if (f is not None and f[0] == "F") else None
        if isinstance(n, c_ast.Assignment):
            a = self.texpr(n.lvalue)
            self.texpr(n.rvalue)
            return a
        if isinstance(n, c_ast.ExprList):
            t = None
            for e in n.exprs:
                t = self.texpr(e)
            return t
        if isinstance(n, c_ast.CompoundLiteral):
            self.texpr(n.init)
            return self.w.resolve(n.type)
        if isinstance(n, c_ast.InitList):
            for e in n.exprs:
                self.texpr(e)
            return None
        if isinstance(n, c_ast.NamedInitializer):
            self.texpr(n.expr)
            return None
        if isinstance(n, c_ast.Typename):
            return self.w.resolve(n.type)
        return None


# ------------------------------------------------------------ preprocessing --

def parse(fn, src_rel, include, text_override=None):
    """(ast, error) for src preprocessed against `include` (None = current)."""
    f, flags = drafts.cppflags(fn, include)
    rc, so, se = agbenv.run('%s %s %s %s' % (f["CPP"], flags, PARSE_DEFINES,
                                             shlex.quote(src_rel)))
    if rc != 0:
        return None, "preprocessor failed: " + drafts.first_error(se)
    try:
        return c_parser.CParser().parse(mask_asm(so), filename=src_rel), None
    except Exception as e:                     # pycparser raises ParseError / others
        return None, "pycparser: %s" % e


def _bitfield_value(world, t, width):
    """The all-ones value a bitfield of this type accepts without a warning
    (-Werror is on): -1 for a signed field, 2**width - 1 otherwise."""
    rt = world.resolve(t)
    name = rt[1] if (rt is not None and rt[0] == "B") else "int"
    signed = ("unsigned" not in name) and (name != "char")
    return "-1" if signed else str((1 << width) - 1)


def _data_bytes(lines):
    """Bytes of one object from agbcc's data directives, in order."""
    out = bytearray()
    for s in lines:
        m = re.match(r'\.(space|zero|skip)\s+(\d+)', s)
        if m:
            out += bytes(int(m.group(2)))
            continue
        m = re.match(r'\.(byte|short|hword|2byte|word|4byte|long)\s+(.*)$', s)
        if not m:
            continue
        width = {"byte": 1, "short": 2, "hword": 2, "2byte": 2}.get(m.group(1), 4)
        for v in m.group(2).split(","):
            out += (int(v.strip(), 0) & ((1 << (8 * width)) - 1)).to_bytes(width, "little")
    return bytes(out)


def probe_offsets(fn, world, keys, include, base_src, tag):
    """Fill world.offsets[key][field] = (bit offset, bit width) by compiling a
    probe with agbcc.

    base_src is the file whose preprocessed text precedes the probe (the old
    draft, or an include-only stub). Layout comes from the compiler, so it
    carries agbcc's real rules (its structure-size boundary is 32 bits, which a
    re-derivation would get wrong). An ordinary field is `&((T *)0)->f` and
    `sizeof`. A BITFIELD has no address, so it is probed as a constant object
    with only that field set to all ones -- `{ .f = -1 }` -- and read back from
    the assembler output: the set bits are its position and width. struct Unit's
    unk04_0-style flags are bitfields, and three of wave 90's broken drafts
    access them.
    """
    entries, bitf = [], []
    for key in sorted(keys):
        s = world.structs.get(key)
        sp = world.spell(key)
        if s is None or sp is None or s["infunc"]:
            continue
        for name, t, bits in s["fields"]:
            if bits is not None:
                try:
                    width = int(bits.value, 0)
                except (AttributeError, ValueError):
                    continue
                if width and s["kind"] == "struct":
                    bitf.append((key, name, "const %s __aw2_bf_%%d = { .%s = %s };"
                                 % (sp, name, _bitfield_value(world, t, width))))
                continue
            rt = world.resolve(t)
            size = ("0" if (rt is not None and rt[0] == "A" and isinstance(t, c_ast.ArrayDecl)
                            and t.dim is None)
                    else "sizeof(((%s *)0)->%s)" % (sp, name))
            entries.append((key, name, "(unsigned int)&((%s *)0)->%s, %s," % (sp, name, size)))
    if not entries and not bitf:
        return
    f, flags = drafts.cppflags(fn, include)
    rc, pre, se = agbenv.run('%s %s %s' % (f["CPP"], flags, shlex.quote(base_src)))
    if rc != 0:
        return
    d = "%s/%s" % (OUT, fn)
    os.makedirs(drafts.absp(d), exist_ok=True)
    i_rel, s_rel = "%s/probe-%s.i" % (d, tag), "%s/probe-%s.s" % (d, tag)
    for _ in range(8):
        # Line 1 of the probe block is the array's opening line, so array entry
        # k sits on line k + 2 and bitfield probe j on line len(entries) + 3 + j.
        lines = (["const unsigned int __aw2_probe[] = {"] + [e[2] for e in entries]
                 + ["0 };"] + [b[2] % j for j, b in enumerate(bitf)])
        awlib.write_text(drafts.absp(i_rel),
                         pre + '\n# 1 "__aw2_probe__"\n' + "\n".join(lines) + "\n")
        rc, so, se = agbenv.run('rm -f %s\niconv -f UTF-8 -t CP932 < %s | %s %s -o %s'
                                % (shlex.quote(s_rel), shlex.quote(i_rel), f["CC1"],
                                   f["CFLAGS"], shlex.quote(s_rel)))
        if rc == 0:
            break
        bad = {int(m.group(1)) for m in re.finditer(r'__aw2_probe__:(\d+):', se or so)}
        bad_e = {ln - 2 for ln in bad if 0 <= ln - 2 < len(entries)}
        bad_b = {ln - len(entries) - 3 for ln in bad
                 if 0 <= ln - len(entries) - 3 < len(bitf)}
        if not bad_e and not bad_b:
            return
        entries = [e for k, e in enumerate(entries) if k not in bad_e]
        bitf = [b for k, b in enumerate(bitf) if k not in bad_b]
    else:
        return
    words, blobs, cur = [], {}, None
    for ln in open(drafts.absp(s_rel), encoding="utf-8", errors="replace"):
        s = ln.strip()
        m = re.match(r'^(__aw2_probe|__aw2_bf_(\d+)):', s)
        if m:
            cur = "probe" if m.group(2) is None else int(m.group(2))
            if cur != "probe":
                blobs[cur] = []
            continue
        if cur is None:
            continue
        if not re.match(r'\.(space|zero|skip|byte|short|hword|2byte|word|4byte|long)\b', s):
            cur = None
            continue
        if cur == "probe":
            m = re.match(r'\.(?:word|4byte|long)\s+(-?(?:0x[0-9a-fA-F]+|\d+))', s)
            if m:
                words.append(int(m.group(1), 0))
        else:
            blobs[cur].append(s)
    for k, (key, name, _) in enumerate(entries):
        if 2 * k + 1 < len(words):
            world.offsets.setdefault(key, {})[name] = (8 * words[2 * k], 8 * words[2 * k + 1])
    for j, (key, name, _) in enumerate(bitf):
        data = _data_bytes(blobs.get(j, []))
        v = int.from_bytes(data, "little")
        if v:
            lo = (v & -v).bit_length() - 1
            world.offsets.setdefault(key, {})[name] = (lo, bin(v).count("1"))


def fmt_off(bits):
    """+0x04 for a byte-aligned field, +0x04.3 for bit 3 of byte 4."""
    return "+0x%02X%s" % (bits // 8, ".%d" % (bits % 8) if bits % 8 else "")


def fmt_width(bits):
    return "%d bytes" % (bits // 8) if bits % 8 == 0 else "%d bits" % bits


def tstr(t):
    """A resolved type, readably: `struct PlaySt`, `u8 *`, `unsigned int[]`."""
    if t is None:
        return "?"
    if t[0] in ("S", "B"):
        return t[1]
    return tstr(t[1]) + {"P": " *", "A": "[]", "F": "()"}[t[0]]


def norm_type(t, tag_map):
    """Old-world type with its struct keys translated through the tag map."""
    if t is None:
        return None
    if t[0] == "S":
        nk = tag_map.get(t[1], (t[1],))[0]
        return ("S", nk or t[1])
    if t[0] == "B":
        return t
    return (t[0], norm_type(t[1], tag_map))


# ---------------------------------------------------------------- symbols --

def symbol_table():
    """(name -> address, address -> [names]) from aw2bhr.sym plus aw2bhr.lds aliases."""
    n2a = {}
    try:
        for ln in open(os.path.join(REPO, "aw2bhr.sym"), encoding="utf-8", errors="replace"):
            p = ln.split()
            if len(p) >= 4:
                try:
                    n2a.setdefault(p[3], int(p[0], 16))
                except ValueError:
                    pass
    except OSError:
        pass
    try:
        for ln in open(os.path.join(REPO, "aw2bhr.lds"), encoding="utf-8", errors="replace"):
            m = re.match(r'^\s*([A-Za-z_]\w*)\s*=\s*([A-Za-z_]\w*|0[xX][0-9A-Fa-f]+)\s*;', ln)
            if m:
                v = m.group(2)
                a = int(v, 16) if v[:2].lower() == "0x" else n2a.get(v, addr_from_name(v))
                if a is not None:
                    n2a.setdefault(m.group(1), a)
    except OSError:
        pass
    a2n = {}
    for n, a in n2a.items():
        a2n.setdefault(a, []).append(n)
    return n2a, a2n


def addr_from_name(name):
    m = re.fullmatch(r'(?:gUnknown|sub|func|unk)_(0[0-9A-Fa-f]{7})', name)
    return int(m.group(1), 16) if m else None


# ------------------------------------------------------------------ mapping --

def pair_types(a, b, votes, via):
    """Walk two resolved types in parallel, voting old struct key -> new key."""
    for _ in range(8):
        if a is None or b is None:
            return
        if a[0] == "S" and b[0] == "S":
            votes.setdefault(a[1], {}).setdefault(b[1], []).append(via)
            return
        if a[0] in ("P", "A") and b[0] in ("P", "A"):
            a, b = a[1], b[1]
            continue
        if a[0] == "F" and b[0] == "F":
            a, b = a[1], b[1]
            continue
        return


def func_params(world, name):
    g = world.globals.get(name)
    if g is None or not isinstance(g[0], c_ast.FuncDecl) or g[0].args is None:
        return []
    return [world.resolve(p.type) for p in g[0].args.params if isinstance(p, c_ast.Decl)]


class Plan:
    def __init__(self):
        self.global_renames = {}    # old -> (new, addr)
        self.tag_map = {}           # old key -> (new key, via)
        self.field_edits = []       # (line, occurrence index, field, newname, note)
        self.hand = []              # (line, text)
        self.remaps = []            # (line, "Key.field (+0xNN) -> new", flag)
        self.local_deletes = []     # (key, line)


def make_plan(fn, src, old_inc, report):
    """Everything the port needs, decided from the two worlds."""
    old_ast, err = parse(fn, src, old_inc)
    if old_ast is None:
        report.append("error: could not parse %s against the old headers: %s" % (src, err))
        return None, None
    old = World(old_ast, src)
    typer = Typer(old)
    typer.run(old_ast)

    # The new world is the draft's own #include lines under today's headers.
    # newline="" keeps CRLF drafts CRLF, so the proposal diffs only where it edits.
    with open(drafts.absp(src), encoding="utf-8", errors="surrogateescape", newline="") as fh:
        text = fh.read()
    incs = [m.group(0) for m in re.finditer(r'(?m)^[ \t]*#[ \t]*include[ \t]*["<][^">\n]+[">]',
                                            text)]
    d = "%s/%s" % (OUT, fn)
    stub = "%s/includes-only.c" % d
    awlib.write_text(drafts.absp(stub), "\n".join(incs) + "\n")
    new_ast, err = parse(fn, stub, None)
    if new_ast is None:
        report.append("error: could not parse today's headers: %s" % err)
        return None, None
    new = World(new_ast, stub)

    plan = Plan()
    n2a, a2n = symbol_table()

    # Globals the draft uses that today's headers no longer declare.
    draft_decls = {n for n, (_, f) in old.globals.items() if f == src}
    for name in sorted(typer.global_refs):
        if name in new.globals or name in draft_decls:
            continue
        addr = n2a.get(name, addr_from_name(name))
        cands = [n for n in a2n.get(addr, []) if n in new.globals] if addr is not None else []
        if len(cands) == 1:
            plan.global_renames[name] = (cands[0], addr)
        elif cands:
            plan.hand.append((min(typer.global_refs[name]),
                              "`%s` is gone; several declared names sit at 0x%08X: %s"
                              % (name, addr, ", ".join(sorted(cands)))))
        else:
            plan.hand.append((min(typer.global_refs[name]),
                              "`%s` is no longer declared and no declared name shares "
                              "its address%s" % (name, " 0x%08X" % addr if addr is not None else "")))

    # Old struct key -> new key. Same tag first; otherwise vote through the
    # declared types of paired globals and same-named prototypes.
    votes = {}
    for name, (t, f) in old.globals.items():
        if f == src:
            continue
        other = plan.global_renames.get(name, (name,))[0]
        if other not in new.globals:
            a = n2a.get(name, addr_from_name(name))
            c = [n for n in a2n.get(a, []) if n in new.globals] if a is not None else []
            if len(c) != 1:
                continue
            other = c[0]
        ta, tb = old.resolve(t), new.resolve(new.globals[other][0])
        pair_types(ta, tb, votes, "%s -> %s" % (name, other) if other != name else name)
        if isinstance(t, c_ast.FuncDecl):
            for pa, pb in zip(func_params(old, name), func_params(new, other)):
                pair_types(pa, pb, votes, name + "()")

    needed = {k for (_, _, _, k, _) in typer.accesses if k}
    # Tags the draft spells without accessing a member still need renaming.
    spelled = {"%s %s" % (m.group(1), m.group(2))
               for m in re.finditer(r'\b(struct|union)\s+([A-Za-z_]\w*)', mask_c(text))}
    needed |= {k for k in spelled if k in old.structs}
    for key in sorted(needed | {k for k in old.structs if old.structs[k]["local"]}):
        s = old.structs.get(key, {})
        if key in new.structs:
            plan.tag_map[key] = (key, "same tag")
            if s.get("local"):
                plan.local_deletes.append((key, s.get("line")))
            continue
        if s.get("local"):
            continue                     # a draft-local tag the headers never define: unchanged
        v = votes.get(key, {})
        v = {k: w for k, w in v.items() if k in new.structs}
        if len(v) == 1:
            nk, via = next(iter(v.items()))
            plan.tag_map[key] = (nk, "via " + via[0])
        elif v:
            best = max(v.items(), key=lambda kv: len(kv[1]))
            plan.tag_map[key] = (best[0], "via %s (AMBIGUOUS: also %s)"
                                 % (best[1][0], ", ".join(k for k in v if k != best[0])))
            plan.hand.append((s.get("line") or 0, "%s maps ambiguously: %s"
                              % (key, ", ".join(sorted(v)))))
        elif key in needed:
            plan.tag_map[key] = (None, "no longer defined, and no global or prototype pairs it")

    # A global that keeps its name (or is renamed) but whose TYPE changed:
    # `u32 gUnknown_0200CC88[]` became `struct SaveSlotGenerations`, so every
    # `gUnknown_0200CC88[k]` stops compiling and no renaming can fix it. Say so
    # with every line that uses it, rather than leaving a bare compile error.
    # A pure tag rename is not a type change: compare through every pairing
    # the globals vote for, not only the tags this draft happens to spell
    # (sub_080283E4 only casts gPlayers, so Unk08499598 is never "needed").
    full_map = {}
    for k, v in votes.items():
        v = {nk: w for nk, w in v.items() if nk in new.structs}
        if v:
            full_map[k] = (max(v.items(), key=lambda kv: len(kv[1]))[0], "vote")
    full_map.update(plan.tag_map)
    for name in sorted(typer.global_refs):
        if name in draft_decls:
            continue
        other = plan.global_renames.get(name, (name,))[0]
        if other not in new.globals or name not in old.globals:
            continue
        told = norm_type(old.resolve(old.globals[name][0]), full_map)
        tnew = new.resolve(new.globals[other][0])
        if told != tnew:
            lines = sorted(typer.global_refs[name])
            plan.hand.append((lines[0], "`%s` changed type: %s -> %s; port its uses by "
                              "hand (lines %s)" % (other, tstr(told), tstr(tnew),
                                                   ", ".join(map(str, lines)))))

    # Offsets, from the compiler, for both sides.
    probe_offsets(fn, old, {k for k in plan.tag_map if plan.tag_map[k][0]}, old_inc, src, "old")
    probe_offsets(fn, new, {v[0] for v in plan.tag_map.values() if v[0]}, None, stub, "new")

    # Field accesses: group per line, in column order, so each can be matched
    # to its textual occurrence.
    per_line = {}
    for (line, col, field, key, arrow) in typer.accesses:
        per_line.setdefault((line, field), []).append((col, key))
    for (line, field), lst in sorted(per_line.items()):
        lst.sort()
        for idx, (_, key) in enumerate(lst):
            if key is None:
                plan.hand.append((line, "cannot type the base of `.%s`; check it by hand" % field))
                plan.field_edits.append((line, idx, field, None, "untyped"))
                continue
            if key in old.structs and old.structs[key]["local"] and key not in plan.tag_map:
                plan.field_edits.append((line, idx, field, field, "local"))
                continue
            nk, via = plan.tag_map.get(key, (key, "unchanged"))
            if nk is None:
                plan.hand.append((line, "`%s.%s`: %s" % (key, field, via)))
                plan.field_edits.append((line, idx, field, None, "unmapped"))
                continue
            oo = old.offsets.get(key, {}).get(field)
            if oo is None:
                plan.hand.append((line, "no offset for old `%s.%s` (probe failed)" % (key, field)))
                plan.field_edits.append((line, idx, field, None, "noprobe"))
                continue
            # Offsets and widths are in BITS, so a bitfield maps like any field.
            newf = new.offsets.get(nk, {})
            at = [(n, w) for n, (o, w) in newf.items() if o == oo[0]]
            same_size = [n for n, w in at if w == oo[1]]
            pick = (field if field in same_size else
                    same_size[0] if len(same_size) == 1 else
                    at[0][0] if len(at) == 1 else None)
            flag = ""
            if field in newf and newf[field][0] != oo[0]:
                flag = ("RESHAPE: `%s` still exists at %s; the old name would compile "
                        "and read the wrong member" % (field, fmt_off(newf[field][0])))
            if pick is None:
                inside = [(n, fmt_off(o), fmt_off(o + w)) for n, (o, w) in newf.items()
                          if o < oo[0] < o + w]
                hint = ("; it falls inside `%s` (%s..%s)" % inside[0] if inside else "")
                plan.hand.append((line, "`%s.%s` (%s, %s): %s field at that offset in %s%s%s"
                                  % (key, field, fmt_off(oo[0]), fmt_width(oo[1]),
                                     "several" if at else "no", nk, hint,
                                     ("  -- " + flag) if flag else "")))
                plan.field_edits.append((line, idx, field, None, "nooffset"))
                continue
            note = ""
            if pick != field or flag:
                size_note = ("" if newf[pick][1] == oo[1] else
                             "  (width %s -> %s)" % (fmt_width(oo[1]), fmt_width(newf[pick][1])))
                plan.remaps.append((line, "%s.%s (%s) -> %s%s" % (
                    key.split(" ", 1)[-1], field, fmt_off(oo[0]), pick, size_note), flag))
                note = "remap"
            plan.field_edits.append((line, idx, field, pick, note))
    return plan, (old, new, text)


# ------------------------------------------------------------------- edits --

def apply_plan(plan, text, old, report):
    edits = []                    # (start, end, replacement)
    masked = mask_c(text)                        # code only
    renames_view = mask_c(text, keep_comments=True)   # strings masked, comments kept
    starts = line_starts(text)

    # Local struct definitions the headers now own: delete the whole block.
    for key, line in plan.local_deletes:
        tag = key.split(" ", 1)[1]
        a = starts[line - 1] if line and line - 1 < len(starts) else None
        m = re.compile(r'\b%s\s+%s\s*\{' % (key.split(" ")[0], re.escape(tag))).search(masked, a or 0)
        if a is None or m is None or masked[:m.start()].count("\n") != line - 1:
            plan.hand.append((line or 0, "remove the local definition of `%s` by hand" % key))
            continue
        depth, j = 0, m.end() - 1
        while j < len(masked):
            if masked[j] == "{":
                depth += 1
            elif masked[j] == "}":
                depth -= 1
                if depth == 0:
                    break
            j += 1
        semi = masked.find(";", j)
        if semi < 0 or masked[j + 1:semi].strip():
            plan.hand.append((line, "the local `%s` is also a declarator or typedef; "
                              "remove it by hand" % key))
            continue
        end = masked.find("\n", semi)
        end = len(text) if end < 0 else end + 1
        if text[end:end + 1] == "\n":
            end += 1
        edits.append((a, end, ""))
        report.append("  local definition removed: %s (lines %d-%d); today's headers define it"
                      % (key, line, text[:end].count("\n")))

    # Field accesses, matched to their textual occurrence on the line.
    by_line = {}
    for (line, idx, field, new, note) in plan.field_edits:
        by_line.setdefault((line, field), []).append((idx, new, note))
    for (line, field), lst in sorted(by_line.items()):
        if line - 1 >= len(starts):
            continue
        a = starts[line - 1]
        b = starts[line] if line < len(starts) else len(text)
        occ = [m for m in re.finditer(r'(?:->|\.)\s*(%s)\b' % re.escape(field), masked[a:b])]
        if len(occ) != len(lst):
            if any(new not in (None, field) for _, new, _ in lst):
                plan.hand.append((line, "`%s` appears %d time(s) on this line but %d access(es) "
                                  "were typed (a macro?); edit by hand" % (field, len(occ), len(lst))))
            continue
        for (idx, new, note), m in zip(sorted(lst), occ):
            if new and new != field:
                edits.append((a + m.start(1), a + m.end(1), new))

    # Global renames (code and comments; never inside string literals).
    for old_name, (new_name, addr) in sorted(plan.global_renames.items()):
        n = 0
        for m in re.finditer(r'\b%s\b' % re.escape(old_name), renames_view):
            edits.append((m.start(), m.end(), new_name))
            n += 1
        report.append("  global renamed: %s -> %s (0x%08X), %d occurrence(s)"
                      % (old_name, new_name, addr, n))

    # Struct tag renames.
    for key, (nk, via) in sorted(plan.tag_map.items()):
        if nk is None or nk == key:
            continue
        ok, nkind = key.split(" ", 1), nk.split(" ", 1)
        if ok[0] not in ("struct", "union") or nkind[0] not in ("struct", "union"):
            plan.hand.append((0, "rename %s -> %s by hand" % (key, nk)))
            continue
        n = 0
        for m in re.finditer(r'\b%s\s+%s\b' % (ok[0], re.escape(ok[1])), renames_view):
            edits.append((m.start(), m.end(), "%s %s" % (nkind[0], nkind[1])))
            n += 1
        report.append("  struct tag renamed: %s -> %s (%s), %d occurrence(s)"
                      % (key, nk, via, n))

    edits.sort()
    out, pos, dropped = [], 0, 0
    for s, e, r in edits:
        if s < pos:
            dropped += 1           # inside a deleted block
            continue
        out.append(text[pos:s])
        out.append(r)
        pos = e
    out.append(text[pos:])
    return "".join(out)


# ------------------------------------------------------------------ verify --

def verify(fn, old_src, old_inc, new_src, report):
    """Build old_src under the old headers and new_src under today's; compare."""
    ob = drafts.build(fn, old_src, "port-old", include=old_inc)
    nb = drafts.build(fn, new_src, "port-new")
    if not ob.ok:
        report.append("  old source does not compile under the old headers: %s"
                      % drafts.first_error(ob.err))
        report.append("  (is --old-rev right? is --old-src the pre-change draft?)")
        return "NO-BASELINE"
    if not nb.ok:
        report.append("  compile under today's headers: FAILED")
        for ln in [ln for ln in nb.err.splitlines() if re.search(r':\d+: ', ln)][:12]:
            report.append("    " + ln.strip())
        return "COMPILE-FAIL"
    report.append("  compile under today's headers: OK")
    verdict, detail = drafts.compare_builds(ob, nb)
    report.append("  bytes vs the old draft under the old headers: %s%s"
                  % (verdict, ("  (" + detail + ")") if detail else ""))
    if verdict == "SAME":
        r = drafts.score(fn, nb)
        report.append("  ROM score (unchanged by construction): %s" % drafts.fmt(r))
    return verdict


# -------------------------------------------------------------------- main --

def port(fn, old_rev, old_src, out, want_diff, quiet=False):
    report = []
    old_inc = drafts.headers_at(old_rev)
    if old_inc is None:
        return 2, report
    report.append("port_rename %s: old headers %s, source %s" % (fn, old_rev, old_src))
    plan, ctx = make_plan(fn, old_src, old_inc, report)
    if plan is None:
        return 2, report
    old, new, text = ctx
    proposal = apply_plan(plan, text, old, report)
    if plan.remaps:
        report.append("  fields remapped by offset:")
        for line, what, flag in sorted(plan.remaps):
            report.append("    line %-4d %s%s" % (line, what, ("   !! " + flag) if flag else ""))
    out = out or "%s/%s/%s.c" % (OUT, fn, fn)
    awlib.write_text(drafts.absp(out), proposal)
    n_changed = sum(1 for ln in difflib.ndiff(text.splitlines(), proposal.splitlines())
                    if ln[:1] in "+-")
    report.append("  proposal: %s (%s)" % (out, "identical to the source" if proposal == text
                                            else "%d line(s) added or removed" % n_changed))
    if want_diff:
        for ln in difflib.unified_diff(text.splitlines(), proposal.splitlines(),
                                       old_src, out, lineterm="", n=1):
            report.append("    " + ln)
    verdict = verify(fn, old_src, old_inc, out, report)
    hand = sorted(set(plan.hand))
    if hand:
        report.append("  NEEDS HAND WORK (%d):" % len(hand))
        for line, what in hand:
            report.append("    line %-4d %s" % (line, what))
    ok = verdict == "SAME" and not hand
    report.append("RESULT %s: %s" % (fn, "PORTED -- bytes SAME, nothing left by hand"
                                      if ok else "%s, %d hand item(s)" % (verdict, len(hand))))
    return (0 if ok else 1), report


def self_test():
    """Re-port verified drafts from their pre-rename sources; require SAME.

    The four are from W90-P1's hand-verified corpus (each has <fn>.prepr3.c
    and a ported <fn>.c proven byte-identical). sub_08066874 and sub_080283E4
    are KeySt RESHAPE cases: `held` must become `pressed`, never stay `held`.
    Reads work/ only; writes build/port/ only.
    """
    cases = ["sub_08066874", "sub_080283E4", "sub_0803D558", "sub_08084C14"]
    ok = True
    for fn in cases:
        src = "work/%s/%s.prepr3.c" % (fn, fn)
        if not os.path.exists(drafts.absp(src)):
            print("[self-test] %s: no %s -- skipped" % (fn, src))
            continue
        rc, report = port(fn, "803d1bd", src, "%s/selftest/%s.c" % (OUT, fn), False)
        print("\n".join(report))
        good = rc == 0
        if fn in ("sub_08066874", "sub_080283E4"):
            txt = open(drafts.absp("%s/selftest/%s.c" % (OUT, fn)), encoding="utf-8").read()
            code = mask_c(txt)
            good &= re.search(r'\.\s*held\b|->\s*held\b', code) is None
        print("[self-test] %s: %s\n" % (fn, "PASS" if good else "FAIL"))
        ok &= good
    print("[self-test] %s" % ("PASS" if ok else "FAIL"))
    return 0 if ok else 1


def main():
    global EXPR_NODES
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("fn", nargs="?")
    ap.add_argument("--old-rev", help="git revision whose include/ the old source was written against")
    ap.add_argument("--old-src", help="the pre-change source (default work/<fn>/<fn>.c)")
    ap.add_argument("--out", help="where to write the proposal (default build/port/<fn>/<fn>.c)")
    ap.add_argument("--verify", metavar="FILE",
                    help="skip the proposal; byte-check FILE (today's headers) against --old-src (old headers)")
    ap.add_argument("--diff", action="store_true", help="print the proposal as a unified diff")
    ap.add_argument("--self-test", action="store_true")
    args = ap.parse_args()
    if c_parser is None:
        print("error: pycparser is not importable -- `python -m pip install --user pycparser`")
        return 2
    EXPR_NODES = (c_ast.ID, c_ast.Constant, c_ast.Cast, c_ast.UnaryOp, c_ast.BinaryOp,
                  c_ast.TernaryOp, c_ast.ArrayRef, c_ast.StructRef, c_ast.FuncCall,
                  c_ast.Assignment, c_ast.ExprList, c_ast.CompoundLiteral, c_ast.InitList,
                  c_ast.NamedInitializer)
    if args.self_test:
        return self_test()
    if not args.fn or not args.old_rev:
        ap.error("give a function and --old-rev")
    fn = args.fn
    old_src = (args.old_src or "work/%s/%s.c" % (fn, fn)).replace("\\", "/")
    if not os.path.exists(drafts.absp(old_src)):
        print("error: no %s" % old_src)
        return 2
    if args.verify:
        report = ["port_rename %s --verify %s against %s at %s"
                  % (fn, args.verify, old_src, args.old_rev)]
        inc = drafts.headers_at(args.old_rev)
        if inc is None:
            return 2
        v = verify(fn, old_src, inc, args.verify.replace("\\", "/"), report)
        report.append("RESULT %s: %s" % (fn, v))
        print("\n".join(report))
        return 0 if v == "SAME" else 1
    rc, report = port(fn, args.old_rev, old_src, args.out, args.diff)
    print("\n".join(report))
    return rc


if __name__ == "__main__":
    sys.exit(main())
