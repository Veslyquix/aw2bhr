#!/usr/bin/env python3
"""Integration checks -- the failures that ONLY appear when everything links.

`trymatch` is a per-function oracle and the split build is a whole-program one.
Everything in this file lives in the gap between them: a wave can verify every
function individually, promote all of them, and still fail to build. Wave 24
verified 109 functions and then spent FOUR build cycles here.

Two checks, both static, both seconds against a ten-minute build:

  prototypes  a header declaration that disagrees with an already-promoted
              definition. Passes every trymatch; fails the split build with
              `conflicting types`.
  types       the same struct/union defined twice in one promoted file.
              promote.py concatenates per-function drafts without deduplicating
              their type definitions, and the copies need not even be identical
              -- c_08078250.c had two `struct Unk807831C`, one naming the field
              at 0x54 and one leaving it in filler. Same layout, so every
              per-function check passed.

Run it BEFORE `make SPLIT=1 compare`; promote.py now runs it for you.

`trymatch` compiles ONE unit, so a header declaration that disagrees with an
already-promoted definition passes every per-function check in a wave and then
fails the SPLIT build with `conflicting types`. Wave 24 hit it on
sub_08070620/sub_08070640, declared `void(void *, u16)` while
src/decomp/c_08070620.c already defined them
`void(struct MusicPlayerInfo *, u16)` -- 109 functions verified, promoted, and
then ten minutes of build spent to learn it.

Run this BEFORE `make SPLIT=1 compare`. It is seconds against ten minutes.

    python tools/proto_check.py          # prototypes ADDED in the working tree
    python tools/proto_check.py --all    # every prototype in include/

Exits non-zero on any mismatch, so it can gate the promote pipeline.

THE RULE IT ENFORCES: a header declaration and a promoted definition must
AGREE. Which one moves is a judgement this script cannot make, and its old
"the DEFINITION wins -- change the header" was too strong. The default still
holds -- weakest-model applies only to types nobody has named -- but wave 26
found the default wrong five times out of six in one wave: that wave promoted
the FIRST C callers those functions ever had, and caller evidence is the only
evidence there is for a return width or an unused trailing parameter (four
`u8`/`u16` returns were really `int`, consumed with no re-narrowing; one 2-arg
definition was really 3-arg). A definition promoted years of waves ago from
body-side reasoning alone is a guess, not a fact. So: read which side is new,
prefer whichever side has caller evidence, and where both are guesses keep the
definition. Then re-verify the whole affected unit and sync its work drafts --
a retyped promoted function leaves a stale work/<fn>/<fn>.c behind.

Note on the comparison: parameter NAMES are stripped before comparing, but a
lone type token is not a name -- `(u8)` and `(u8 a)` are the same signature.
Getting that backwards makes every single-parameter prototype look broken,
which is how the first draft of this script reported 10 false mismatches.
"""

import glob
import os
import re
import subprocess
import sys

# Group 1 is the RETURN TYPE, 2 the name, 3 the parameter list. Capturing the
# return type is not optional: wave 25 shipped `u8 sub_0804415C(int);` against a
# promoted `int sub_0804415C(int a1)` and this tool reported clean, because the
# parameter lists agree and only the return differs. The same wave's
# sub_080152C0 fix was also a return type (`void` -> `s8`). A checker that reads
# half the signature is worse than none -- it is the permanently-green twin of
# the permanently-red self-test.
PROTO_RE = r'^\s*([A-Za-z_][\w\s*]*?)\b(sub_[0-9A-Fa-f]{8})\s*\(([^)]*)\)\s*;'
DEF_RE = r'^([A-Za-z_][\w\s*]*?)\b(sub_[0-9A-Fa-f]{8})\s*\(([^)]*)\)\s*\{'

KEYWORDS = {
    'void', 'int', 'char', 'short', 'long', 'signed', 'unsigned',
    'const', 'volatile', 'struct', 'union', 'enum',
    'u8', 'u16', 'u32', 'u64', 's8', 's16', 's32', 's64',
    'bool', 'ProcPtr', 'float', 'double', 'size_t',
}


def collect_prototypes(scan_all):
    """{fn: (return type, raw param list)} for the prototypes to check."""
    out = {}
    if scan_all:
        for hf in glob.glob('include/*.h'):
            with open(hf, encoding='utf-8', errors='ignore') as fh:
                for ln in fh:
                    if ln.lstrip().startswith(('*', '/')):
                        continue
                    m = re.match(PROTO_RE, ln)
                    if m:
                        out[m.group(2)] = (' '.join(m.group(1).split()),
                                           ' '.join(m.group(3).split()))
        return out

    diff = subprocess.run(['git', 'diff', 'include/'],
                          capture_output=True, text=True).stdout
    for ln in diff.splitlines():
        if not ln.startswith('+') or ln.startswith('+++'):
            continue
        body = ln[1:]
        if body.lstrip().startswith(('*', '/')):
            continue
        m = re.match(PROTO_RE, body)
        if m:
            out[m.group(2)] = (' '.join(m.group(1).split()),
                               ' '.join(m.group(3).split()))
    return out


def collect_definitions():
    """{fn: (file, return type, raw param list)} for every definition."""
    out = {}
    for f in glob.glob('src/decomp/*.c') + glob.glob('src/*.c'):
        if not os.path.isfile(f):
            continue
        with open(f, encoding='utf-8', errors='ignore') as fh:
            text = fh.read()
        for m in re.finditer(DEF_RE, text, re.M):
            out[m.group(2)] = (f, ' '.join(m.group(1).split()),
                               ' '.join(m.group(3).split()))
    return out


def norm_type(t):
    """A single type, typedefs resolved. `s32` == `int`, `u8` == unsigned char."""
    t = re.sub(r'\bstatic\b|\binline\b', '', t)
    t = re.sub(r'\s*\*\s*', ' *', ' '.join(t.split())).strip()
    # A TOP-LEVEL qualifier on a parameter is ignored when C compares function
    # types: `f(volatile int)` and `f(int)` are the same type and both compilers
    # agree, so reporting them as a mismatch is noise. Only strip it when the
    # type has no `*` -- in `volatile int *` the qualifier is on the POINTEE and
    # is significant, and stripping it there would hide a real conflict.
    # Wave 56: sub_0801E338's `volatile int a6` was the single mismatch standing
    # between `--all` and a usable gate, and a permanently-red acceptance test
    # hides the regression it exists to catch (see wave 21, overlap_screen).
    if '*' not in t:
        t = re.sub(r'^(?:volatile|const)\s+', '', t)
    return ' '.join(TYPEDEFS.get(x, x) for x in t.split())


# include/gba/types.h. Resolved so `(int, ProcPtr)` and `(s32, ProcPtr)` are
# not reported as a conflict -- they are the same type and the compiler agrees.
# The bool8/16/32 aliases were missing until wave 30, when
# `u8 sub_080266DC(u8)` against a `bool8` definition was reported as one of
# four mismatches and cost a real investigation at exactly the moment the wave
# was separating real conflicts from noise. bool8 IS u8 (types.h:27); nothing
# to settle, and no caller can ever be affected by the spelling.
TYPEDEFS = {
    's8': 'signed char', 'u8': 'unsigned char',
    's16': 'short', 'u16': 'unsigned short',
    's32': 'int', 'u32': 'unsigned int',
    's64': 'long long', 'u64': 'unsigned long long',
    'int32_t': 'int', 'uint32_t': 'unsigned int',
    'int16_t': 'short', 'uint16_t': 'unsigned short',
    'int8_t': 'signed char', 'uint8_t': 'unsigned char',
    'int64_t': 'long long', 'uint64_t': 'unsigned long long',
    'signed': 'int', 'unsigned': 'unsigned int',
    'signed int': 'int',
    'bool8': 'unsigned char', 'bool16': 'unsigned short',
    'bool32': 'unsigned int',
    'f32': 'float', 'f64': 'double',
}


def norm(sig):
    """Types only, parameter names dropped. `u8` == `u8 a`."""
    s = sig.strip()
    # C89: an EMPTY parameter list means "unspecified", which is compatible
    # with every definition. include/unknown-functions.h uses it deliberately
    # where the real parameter is a struct local to the promoted file (see
    # sub_0801C240). Not a conflict, and reporting it trains people to ignore
    # this tool.
    if s == '':
        return None
    if s == 'void':
        return ''
    parts = []
    for p in (x.strip() for x in s.split(',')):
        toks = re.findall(r'[A-Za-z_][A-Za-z0-9_]*|\*', p)
        drop = (len(toks) > 1
                and toks[-1] not in KEYWORDS
                and toks[-1] != '*'
                and not (len(toks) == 2 and toks[0] in ('struct', 'union', 'enum')))
        if drop:
            p = re.sub(r'\b%s\s*$' % re.escape(toks[-1]), '', p)
        p = re.sub(r'\s*\*\s*', ' *', ' '.join(p.split())).strip()
        # A TOP-LEVEL qualifier on a parameter is ignored when C compares
        # function types -- `f(volatile int)` and `f(int)` ARE the same type and
        # both compilers agree -- so reporting it is noise. Only strip it when
        # the parameter has no `*`: in `volatile int *` the qualifier is on the
        # POINTEE and IS significant, and stripping it there would hide a real
        # conflict. See norm_type(), which applies the same rule to returns.
        if '*' not in p:
            p = re.sub(r'^(?:volatile|const)\s+', '', p)
        p = ' '.join(TYPEDEFS.get(t, t) for t in p.split())
        parts.append(p)
    return ','.join(parts)


def duplicate_types():
    """[(file, {name: count})] for promoted files defining a type twice.

    Comments are stripped first, and a SINGLE regex does the matching: `\\s*`
    spans newlines, so one pattern covers both `struct Foo {` and `struct Foo`
    with the brace on the next line. Using two patterns double-counts every
    struct written in the second style -- the first draft of this check did
    exactly that and reported 218 files, all false.
    """
    out = []
    for f in sorted(glob.glob('src/decomp/*.c')):
        with open(f, encoding='utf-8', errors='ignore') as fh:
            text = fh.read()
        text = re.sub(r'/\*.*?\*/', '', text, flags=re.S)
        names = re.findall(
            r'^\s*(?:typedef\s+)?(?:struct|union)\s+([A-Za-z_]\w*)\s*\{',
            text, re.M)
        seen = {}
        for n in names:
            seen[n] = seen.get(n, 0) + 1
        dup = {n: k for n, k in seen.items() if k > 1}
        if dup:
            out.append((f, dup))
    return out


UPSTREAM_SRC = ('src/proc.c', 'src/title-screen.c')


def global_checks():
    """[(kind, symbol, detail)] for declarations that only fail at LINK time.

    Two failure modes, both found in wave 32, both invisible to every
    per-function `trymatch` because a per-function check never links.

    unlinkable  a RAM global declared at an address aw2bhr.lds does not name.
                gen_lds passes the RAM symbol table through from the UNTOUCHED
                upstream script, so a symbol invented at an unnamed address has
                nowhere to live and the split build dies with `undefined
                reference`. Wave 32 lost two functions to this: 0x03000600 and
                0x03000602 fall INSIDE gUnknown_030005FC, 0x03000614/0x03000616
                inside gUnknown_03000610.

    upstream    a global DEFINED in src/proc.c or src/title-screen.c and also
                declared here. Far worse, because it corrupts the ROM instead of
                failing to link. `s32 IWRAM_DATA gUnknown_03001FDC;` in proc.c is
                a TENTATIVE definition carrying a section attribute; proc.c
                includes our headers, so a plain `extern int gUnknown_03001FDC;`
                is seen first, agbcc drops the section attribute, and the symbol
                becomes COMMON at 0x08800000 instead of being placed at
                0x03001FDC by `src/proc.o(.bss)`. Wave 32's split ROM differed in
                three 4-byte pool words, TWO OF THEM INSIDE proc.o, with the SHA
                as the only symptom.

    We already knew not to EDIT those two files. Declaring one of their globals
    is the same hazard, because this header reaches them.
    """
    out = []
    try:
        with open(os.path.join('aw2bhr.lds'), encoding='utf-8',
                  errors='replace') as fh:
            lds = set(re.findall(r'\b(gUnknown_[0-9A-Fa-f]{8})\s*=\s*\.',
                                 fh.read()))
    except OSError:
        return out                      # no linker script, nothing to check

    upstream = set()
    for f in UPSTREAM_SRC:
        try:
            with open(f, encoding='utf-8', errors='replace') as fh:
                text = fh.read()
        except OSError:
            continue
        # A DEFINITION, not an `extern` -- the tentative-definition form is what
        # carries the section attribute we must not disturb.
        for m in re.finditer(r'^\s*(?!extern)[A-Za-z_][\w\s*]*?'
                             r'\b(gUnknown_[0-9A-Fa-f]{8})\s*(?:=|;|\[)',
                             text, re.M):
            upstream.add(m.group(1))

    for hf in sorted(glob.glob('include/*.h')):
        with open(hf, encoding='utf-8', errors='replace') as fh:
            for n, ln in enumerate(fh, 1):
                if ln.lstrip().startswith(('*', '/')):
                    continue
                m = re.match(r'\s*extern\s+.*?\b(gUnknown_[0-9A-Fa-f]{8})\b', ln)
                if not m:
                    continue
                sym = m.group(1)
                if sym in upstream:
                    out.append(('upstream', sym, '%s:%d' % (hf, n)))
                elif sym[9:11] in ('02', '03') and sym not in lds:
                    out.append(('unlinkable', sym, '%s:%d' % (hf, n)))
    return out


def header_checks():
    """[(kind, symbol, detail)] for the three wave-33 header failure classes.

    dup-extern  one symbol declared `extern` twice with CONFLICTING types.
                gUnknown_08499590 was declared `u8 *` (63 promoted files do
                byte arithmetic on it) and `struct Unk08499590 *` in the same
                wave; EVERY compile in the repo failed, including promoted
                functions unrelated to the wave. Identical duplicates are
                legal C and are not reported.

    dup-tag     one struct/union tag given a BODY twice. `struct Unk0848B780`
                was defined twice because the second agent's grep hit was cut
                by head_limit -- a truncated grep reads exactly like an absent
                symbol. Forward declarations are fine; two bodies fail every
                TU.

    rom-undef   a ROM-range (0x08...) gUnknown_ referenced by promoted C with
                no definition anywhere: no `.global`/label in data/*.s or
                asm/*.s, no lds binding, no C definition. The RAM check in
                global_checks() cannot see these -- it only tests 02/03
                addresses against aw2bhr.lds. gUnknown_08499C7C was declared
                with evidence, referenced from two promoted units' -fforce-addr
                .rodata words, and defined nowhere; the SPLIT link failed while
                the assembly build printed `aw2bhr.gba: OK`.
    """
    out = []

    # -- dup-extern and dup-tag, over the shared headers ---------------------
    ext = {}                    # symbol -> {(normalized type, file:line)}
    tag = {}                    # tag -> [file:line of each BODY]
    for hf in sorted(glob.glob('include/*.h')):
        with open(hf, encoding='utf-8', errors='replace') as fh:
            lines = fh.readlines()
        for n, ln in enumerate(lines, 1):
            s = ln.strip()
            if s.startswith(('*', '/', '@')):
                continue
            m = re.match(r'extern\s+(.*?)\s*\b([A-Za-z_]\w*)\s*'
                         r'((?:\[[^\]]*\])*)\s*;', s)
            if m:
                ty = ' '.join(m.group(1).split())
                if m.group(3):
                    ty += ' ' + re.sub(r'\s+', '', m.group(3))
                ext.setdefault(m.group(2), set()).add(
                    (ty, '%s:%d' % (hf, n)))
            # The trailing `/* 0xNN */` size comment is this project's OWN
            # convention for a tag declaration, and the version of this regex
            # without the comment clause required end-of-line after the tag --
            # so it saw 65 of 180 tag declarations and was blind to the other
            # 115. Wave 48: three tags were each given two divergent bodies
            # (Unk0200C078Rec, Unk0200C420, Unk0200B0B0), every compile in the
            # repo failed, and THIS CHECK REPORTED CLEAN THROUGHOUT -- all
            # three carry a size comment. A checker that cannot see two thirds
            # of its own corpus reads exactly like an all-clear.
            m = re.match(r'(?:struct|union)\s+([A-Za-z_]\w*)\s*'
                         r'(?:/\*.*?\*/)?\s*(\{)?\s*$', s)
            if m:
                body = bool(m.group(2))
                if not body:
                    for nxt in lines[n:n + 3]:
                        t = nxt.strip()
                        if not t or t.startswith(('*', '/')):
                            continue
                        body = t.startswith('{')
                        break
                if body:
                    tag.setdefault(m.group(1), []).append('%s:%d' % (hf, n))
    for sym, tys in sorted(ext.items()):
        if len({t for t, _ in tys}) > 1:
            out.append(('dup-extern', sym,
                        '; '.join('%s (%s)' % t for t in sorted(tys))))
    for t, sites in sorted(tag.items()):
        if len(sites) > 1:
            out.append(('dup-tag', t, ', '.join(sites)))

    # -- rom-undef, over everything the split build actually links -----------
    defined = set()
    for sf in glob.glob('data/*.s') + glob.glob('asm/*.s'):
        with open(sf, encoding='utf-8', errors='replace') as fh:
            for ln in fh:
                m = re.match(r'\s*\.global\s+(gUnknown_08\w+)', ln) or \
                    re.match(r'(gUnknown_08\w+):', ln)
                if m:
                    defined.add(m.group(1))
    try:
        with open('aw2bhr.lds', encoding='utf-8', errors='replace') as fh:
            defined |= set(re.findall(r'\b(gUnknown_08\w+)\s*=', fh.read()))
    except OSError:
        pass
    referenced = {}             # symbol -> first referencing file
    for cf in sorted(glob.glob('src/decomp/*.c') + glob.glob('src/*.c')):
        with open(cf, encoding='utf-8', errors='replace') as fh:
            text = re.sub(r'/\*.*?\*/', '', fh.read(), flags=re.S)
        for m in re.finditer(r'\b(gUnknown_08[0-9A-Fa-f]{6})\b', text):
            referenced.setdefault(m.group(1), cf)
        # a C-side DEFINITION (const table carved into a unit) also satisfies
        for m in re.finditer(r'^[^;{}\n]*?[^n]\s(gUnknown_08[0-9A-Fa-f]{6})'
                             r'\s*(?:\[[^\]]*\])*\s*=', text, re.M):
            if 'extern' not in m.group(0):
                defined.add(m.group(1))
    for sym in sorted(set(referenced) - defined):
        out.append(('rom-undef', sym, 'first ref %s' % referenced[sym]))
    return out


def main(argv):
    scan_all = '--all' in argv
    protos = collect_prototypes(scan_all)
    defs = collect_definitions()

    bad = 0
    for fn, (dret, decl) in sorted(protos.items()):
        if fn not in defs:
            continue
        src, fret, defined = defs[fn]
        nd, ndef = norm(decl), norm(defined)
        params_differ = (nd is not None and ndef is not None and nd != ndef)
        ret_differ = norm_type(dret) != norm_type(fret)
        if params_differ or ret_differ:
            bad += 1
            print('MISMATCH %s (%s)' % (fn, 'return type' if ret_differ
                                        and not params_differ else
                                        'parameters' if not ret_differ else
                                        'return type AND parameters'))
            print('   header:  %s %s(%s)' % (dret, fn, decl))
            print('   %s:  %s %s(%s)' % (src, fret, fn, defined))
            print('   the DEFINITION wins BY DEFAULT -- but check which side is '
                  'NEW first.')
            print('   A declaration added THIS wave from caller-side evidence '
                  'beats a body-side')
            print('   guess promoted long ago: wave 26 had six of these and '
                  'FIVE settled toward')
            print('   the callers. `git diff include/` to see. Whichever side '
                  'loses, re-verify')
            print('   every function in the affected unit AND sync its '
                  'work/<fn>/<fn>.c draft.')

    print('checked %d prototype(s) against %d definition(s) -- %d mismatch(es)'
          % (len(protos), len(defs), bad))

    dups = duplicate_types()
    for f, d in dups:
        print('DUPLICATE TYPE %s: %s' % (f, d))
        print('   promote.py merged two drafts that each defined it. Keep the '
              'MORE REFINED copy (the one that names more fields) and delete '
              'the other, then re-verify every function in the unit.')
    print('scanned %d promoted file(s) for duplicate types -- %d file(s) affected'
          % (len(glob.glob('src/decomp/*.c')), len(dups)))

    globs = global_checks()
    for kind, sym, where in globs:
        if kind == 'upstream':
            print('UPSTREAM GLOBAL %s (%s)' % (sym, where))
            print('   DEFINED in src/proc.c or src/title-screen.c, which include '
                  'this header.')
            print('   A plain `extern` here is seen BEFORE the definition and '
                  'strips its section')
            print('   attribute, moving the symbol to COMMON at 0x08800000. The '
                  'split ROM then')
            print('   differs in pool words INSIDE proc.o and the only symptom '
                  'is the SHA.')
            print('   Delete the declaration. A function needing that global '
                  'cannot be promoted.')
        else:
            print('UNLINKABLE GLOBAL %s (%s)' % (sym, where))
            print('   aw2bhr.lds does not name this address, and gen_lds passes '
                  'the RAM symbol')
            print('   table through from that UNTOUCHED script -- so the split '
                  'build will fail with')
            print('   `undefined reference`. The address usually falls INSIDE an '
                  'existing symbol;')
            print('   find the covering one and spell it as an offset, or leave '
                  'the function unpromoted.')
    print('checked %d global declaration(s) -- %d unlinkable, %d upstream-owned'
          % (len(glob.glob('include/*.h')),
             sum(1 for g in globs if g[0] == 'unlinkable'),
             sum(1 for g in globs if g[0] == 'upstream')))

    hdr = header_checks()
    for kind, sym, where in hdr:
        if kind == 'dup-extern':
            print('CONFLICTING DUPLICATE EXTERN %s' % sym)
            print('   %s' % where)
            print('   Two agents declared the same symbol with different '
                  'types; EVERY compile in')
            print('   the repo fails, promoted functions included. Settle it '
                  'on the evidence --')
            print('   promoted byte arithmetic beats a new struct model '
                  '(wave 33: 63 files used')
            print('   `u8 *`; the struct pointer would have silently rescaled '
                  'them all).')
        elif kind == 'dup-tag':
            print('DUPLICATE STRUCT/UNION BODY %s (%s)' % (sym, where))
            print('   Two BODIES for one tag fails every TU. The wave-33 '
                  'cause: the second')
            print('   agent\'s grep for the tag was truncated by head_limit, '
                  'and a truncated')
            print('   grep reads exactly like an absent symbol. Keep the more '
                  'refined body.')
        else:
            print('UNDEFINED ROM GLOBAL %s (%s)' % (sym, where))
            print('   Referenced by compiled C but defined nowhere -- no '
                  '.global in data/*.s or')
            print('   asm/*.s, no lds binding, no C definition. Only the '
                  'SPLIT link sees this,')
            print('   and the assembly build will still print `aw2bhr.gba: '
                  'OK` beside the failure.')
            print('   Fix: carve the symbol out of the covering .incbin block '
                  'in data/*.s')
            print('   (wave 33 split gUnknown_08499C68\'s 0x54-byte block '
                  'into 0x14 + 0x40).')
    print('header integrity -- %d conflicting extern(s), %d duplicate tag '
          'body(ies), %d undefined ROM reference(s)'
          % (sum(1 for h in hdr if h[0] == 'dup-extern'),
             sum(1 for h in hdr if h[0] == 'dup-tag'),
             sum(1 for h in hdr if h[0] == 'rom-undef')))

    return 1 if (bad or dups or globs or hdr) else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
