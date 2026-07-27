#!/usr/bin/env python3
"""Scaffold a work directory for one matching attempt.

Creates work/<name>/ holding the target assembly, a stub .c, and a note of what
the function touches, so an agent can start writing C immediately instead of
rediscovering the same context every time.

The stub's signature is a guess, inferred from which argument registers are read
before they are written and whether r0 is set before returning. It is a starting
point and frequently wrong -- the ABI is not recoverable from one function in
isolation -- but wrong-and-concrete beats blank, and trymatch.py settles it.

    python tools/newfunc.py sub_08013AEC
    python tools/trymatch.py sub_08013AEC --diff
"""

import argparse
import json
import os
import re
import sys

import awlib

WORK = os.path.join(awlib.REPO, "work")
ARG_REGS = ["r0", "r1", "r2", "r3"]

# Instructions whose first operand is read, not written -- everything else is
# assumed to write its first operand, which is right for the ARM/THUMB subset
# agbcc emits.
READS_FIRST = re.compile(r'^(str|strb|strh|stm|push|cmp|cmn|tst|teq|b|bl|blx|bx|'
                         r'swi|svc)\b')


def infer_signature(fn):
    """(n_args, returns_value) from register use before definition."""
    written = set()
    n_args = 0
    returns = False
    for text in awlib.instructions(fn):
        mnem = text.split()[0].lower()
        ops = text.split(None, 1)[1] if " " in text else ""
        regs = re.findall(r'\br(?:[0-9]|1[0-5])\b', ops)
        if not regs:
            continue
        if READS_FIRST.match(mnem):
            reads, writes = regs, []
        else:
            reads, writes = regs[1:], regs[:1]
        for r in reads:
            if r in ARG_REGS and r not in written:
                n_args = max(n_args, ARG_REGS.index(r) + 1)
                written.add(r)          # counted once
        for r in writes:
            if r == "r0":
                returns = True
            written.add(r)
    return n_args, returns


def declared_prototype(name):
    """An existing declaration for this function, if the headers have one.

    include/unknown-functions.h carries ~39 hand-written prototypes for
    functions still in assembly. They are ground truth and beat anything
    inferred from register use -- and because the compiler sees them too, a
    definition that disagrees fails with `conflicting types` rather than merely
    failing to match. Surfacing them is worth an attempt or two per function.
    """
    inc = os.path.join(awlib.REPO, "include")
    if not os.path.isdir(inc):
        return None, None
    pat = re.compile(r'^\s*[A-Za-z_].*\b%s\s*\(' % re.escape(name))
    for dirpath, _, filenames in os.walk(inc):
        for entry in sorted(filenames):
            if not entry.endswith(".h"):
                continue
            path = os.path.join(dirpath, entry)
            for ln in awlib.read_lines(path):
                if pat.match(ln) and ln.split("//")[0].rstrip().endswith(";"):
                    rel = os.path.relpath(path, awlib.REPO).replace("\\", "/")
                    return ln.split("//")[0].strip().rstrip(";"), rel
    return None, None


def name_params(proto, name):
    """Turn `void PutSprite(u32, u32, u16 *)` into a definable signature.

    A declaration may leave parameters unnamed, which is legal to declare and
    illegal to define, so unnamed ones get a1, a2, ... Parameters that already
    carry names are left exactly as written.
    """
    head, _, rest = proto.partition("(")
    params = rest.rsplit(")", 1)[0].strip()
    if params in ("", "void"):
        return "%s(void)" % head.strip()
    out = []
    for i, raw in enumerate(params.split(",")):
        p = raw.strip()
        tail = p.rstrip("*& ").split()
        # already named if the last token is an identifier beyond the type
        if len(tail) > 1 and not p.endswith("*"):
            out.append(p)
        else:
            out.append("%s a%d" % (p, i + 1))
    return "%s(%s)" % (head.strip(), ", ".join(out))


def stub(fn, rec, n_args, returns):
    proto, proto_src = declared_prototype(fn)
    if proto:
        sig = name_params(proto, fn)
        ret = "void" if proto.strip().startswith("void") else "int"
        body = "    " if ret == "void" else "    return 0;"
        return (
            '#include "global.h"\n\n'
            '/* %s @ %s, %d bytes, %s.\n'
            ' * Signature below is DECLARED in %s -- it is authoritative.\n'
            ' * The compiler sees that header too, so a definition that\n'
            ' * disagrees will not compile.\n'
            ' */\n'
            '%s\n{\n%s\n}\n'
            % (fn, rec["addr_hex"], rec["size"], rec["mode"], proto_src,
               sig, body))

    args = ", ".join("int a%d" % (i + 1) for i in range(n_args)) or "void"
    ret = "int" if returns else "void"
    body = "    return 0;" if returns else "    "
    how = (
        " * No prototype exists for this one. %d argument register(s) are read\n"
        " * before being written, so it takes at least that many -- but the\n"
        " * count is a floor, not the answer: a struct passed by value occupies\n"
        " * two consecutive registers and looks like two arguments here, and\n"
        " * anything past r3 arrives on the stack as ldr rN, [sp, #...].\n"
        % n_args)
    notes = []
    # Listed in full, not clipped. A silently truncated list reads as complete,
    # and a global left off it is one the reader never goes looking for.
    if rec["calls"]:
        notes.append(" * calls: " + ", ".join(rec["calls"]))
    if rec["data_refs"]:
        notes.append(" * touches: " + ", ".join(rec["data_refs"]))
    note_block = ("/*\n" + "\n".join(notes) + "\n */\n") if notes else ""

    return (
        '#include "global.h"\n\n'
        '%s'
        '/* %s @ %s, %d bytes, %s.\n'
        '%s'
        ' */\n'
        '%s %s(%s)\n{\n%s\n}\n'
        % (note_block, fn, rec["addr_hex"], rec["size"], rec["mode"], how,
           ret, fn, args, body))


def create(name, force=False):
    with open(os.path.join(awlib.DATA_DIR, "functions.json"), encoding="utf-8") as fh:
        recs = json.load(fh)
    key = name.strip().lower()
    rec = next((r for r in recs if r["name"].lower() == key
                or r["addr_hex"].lower() == key), None)
    if rec is None:
        print("error: no function %r in the index" % name)
        return 1

    fn = rec["name"]
    index = {}
    for af in awlib.load_all():
        for f in af.funcs:
            index[f.name] = f
    parsed = index.get(fn)
    if parsed is None:
        print("error: %s not found in asm/*.s" % fn)
        return 1

    d = os.path.join(WORK, fn)
    os.makedirs(d, exist_ok=True)

    awlib.write_text(os.path.join(d, "target.s"), parsed.text)

    csrc = os.path.join(d, fn + ".c")
    if os.path.exists(csrc) and not force:
        print("kept existing %s (use --force to overwrite)"
              % os.path.relpath(csrc, awlib.REPO))
    else:
        n_args, returns = infer_signature(parsed)
        awlib.write_text(csrc, stub(fn, rec, n_args, returns))

    fe = None
    fe_path = os.path.join(awlib.DATA_DIR, "fe_matches.json")
    if os.path.exists(fe_path):
        with open(fe_path, encoding="utf-8") as fh:
            fe = next((h["fe_name"] for h in json.load(fh)["matches"]
                       if h["name"] == fn), None)

    rel = os.path.relpath(d, awlib.REPO)
    print("%s  %s  %d bytes  %s  difficulty %s"
          % (fn, rec["addr_hex"], rec["size"], rec["mode"], rec["difficulty"]))
    print("  %s/target.s   the original assembly" % rel)
    print("  %s/%s.c   stub to fill in" % (rel, fn))
    if fe:
        print("  identified as %s in the Fire Emblem decomps -- start from their C"
              % fe)
    print("\n  python tools/trymatch.py %s --diff" % fn)
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", help="function name or address")
    ap.add_argument("--force", action="store_true",
                    help="overwrite an existing stub")
    args = ap.parse_args()
    return create(args.name, force=args.force)


if __name__ == "__main__":
    sys.exit(main())
