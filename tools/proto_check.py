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

THE RULE IT ENFORCES: when a promoted file has already named a type, the header
must agree with it. Weakest-model applies only to types nobody has named.

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

PROTO_RE = r'\b(sub_[0-9A-Fa-f]{8})\s*\(([^)]*)\)\s*;'
DEF_RE = r'^[A-Za-z_][^;()\n]*?\b(sub_[0-9A-Fa-f]{8})\s*\(([^)]*)\)\s*\{'

KEYWORDS = {
    'void', 'int', 'char', 'short', 'long', 'signed', 'unsigned',
    'const', 'volatile', 'struct', 'union', 'enum',
    'u8', 'u16', 'u32', 'u64', 's8', 's16', 's32', 's64',
    'bool', 'ProcPtr', 'float', 'double', 'size_t',
}


def collect_prototypes(scan_all):
    """{fn: 'raw param list'} for the prototypes to check."""
    out = {}
    if scan_all:
        for hf in glob.glob('include/*.h'):
            with open(hf, encoding='utf-8', errors='ignore') as fh:
                for ln in fh:
                    if ln.lstrip().startswith(('*', '/')):
                        continue
                    m = re.search(PROTO_RE, ln)
                    if m:
                        out[m.group(1)] = ' '.join(m.group(2).split())
        return out

    diff = subprocess.run(['git', 'diff', 'include/'],
                          capture_output=True, text=True).stdout
    for ln in diff.splitlines():
        if not ln.startswith('+') or ln.startswith('+++'):
            continue
        body = ln[1:]
        if body.lstrip().startswith(('*', '/')):
            continue
        m = re.search(PROTO_RE, body)
        if m:
            out[m.group(1)] = ' '.join(m.group(2).split())
    return out


def collect_definitions():
    """{fn: (file, 'raw param list')} for every definition we compile."""
    out = {}
    for f in glob.glob('src/decomp/*.c') + glob.glob('src/*.c'):
        if not os.path.isfile(f):
            continue
        with open(f, encoding='utf-8', errors='ignore') as fh:
            text = fh.read()
        for m in re.finditer(DEF_RE, text, re.M):
            out[m.group(1)] = (f, ' '.join(m.group(2).split()))
    return out


# include/gba/types.h. Resolved so `(int, ProcPtr)` and `(s32, ProcPtr)` are
# not reported as a conflict -- they are the same type and the compiler agrees.
TYPEDEFS = {
    's8': 'signed char', 'u8': 'unsigned char',
    's16': 'short', 'u16': 'unsigned short',
    's32': 'int', 'u32': 'unsigned int',
    'int32_t': 'int', 'uint32_t': 'unsigned int',
    'int16_t': 'short', 'uint16_t': 'unsigned short',
    'int8_t': 'signed char', 'uint8_t': 'unsigned char',
    'signed': 'int', 'unsigned': 'unsigned int',
    'signed int': 'int',
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


def main(argv):
    scan_all = '--all' in argv
    protos = collect_prototypes(scan_all)
    defs = collect_definitions()

    bad = 0
    for fn, decl in sorted(protos.items()):
        if fn not in defs:
            continue
        src, defined = defs[fn]
        nd, ndef = norm(decl), norm(defined)
        if nd is None or ndef is None:
            continue          # C89 unspecified parameter list -- compatible
        if nd != ndef:
            bad += 1
            print('MISMATCH %s' % fn)
            print('   header:  (%s)   -> [%s]' % (decl, norm(decl)))
            print('   %s:  (%s)   -> [%s]' % (src, defined, norm(defined)))
            print('   the DEFINITION wins -- change the header to agree.')

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

    return 1 if (bad or dups) else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
