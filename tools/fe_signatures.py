#!/usr/bin/env python3
"""Name AW2 functions by shape-matching them against the Fire Emblem decomps.

Advance Wars and Fire Emblem are both Intelligent Systems GBA titles on a shared
engine -- this repo's proc.c already carries FE decomp naming (Proc_Start,
gDispIo, PutSpriteExt), and the README cites the four FE decomps directly. Where
the two games link the same library routine, the compiled code has the same
shape, so a normalised instruction signature should collide.

The reference corpus is the *assembly* still present in those repos, not their C.
Turning their C into comparable code would mean building them, which needs the
same agbcc toolchain we do not have yet. That caps the reference side at the
semantically-named asm functions across the four repos -- a few thousand, not the
tens of thousands their C holds. This is the honest ceiling on the spike.

Signatures keep shape and drop everything game-specific:

    registers -> R,  immediates -> #,  symbols -> S,  local branch -> its delta
    in instruction indices

Struct offsets and register allocation differ between the two games even for
identical source, so leaving those in would match nothing. Two strengths are
computed: `full` (mnemonic + operand shape + branch deltas) and `ops` (mnemonic
sequence alone), the second tolerating different register allocation for the
same source.

A signature is only trustworthy if it is long enough to be unlikely by chance
and unambiguous on the reference side; both are enforced and reported.

Usage:
    python tools/fe_signatures.py [--refs DIR] [--min-insns N] [--report]
"""

import argparse
import json
import os
import re
import sys
from collections import defaultdict

import awlib

OUT = os.path.join(awlib.DATA_DIR, "fe_matches.json")
DEFAULT_REFS = os.path.join(os.path.dirname(awlib.REPO), "refs")

# Names that carry no information. Beyond the plain sub_0801D390 form the FE
# repos also use func_08011FC4 and repo-tagged func_fe6_0803FC1C, plus glue
# stubs named after their own instructions (ldrb_r3_r2) -- all of which would
# "identify" an AW2 function as nothing at all.
ANON_RE = re.compile(
    r'^(sub|func)_'
    r'|^(nullsub|unk|loc|off|byte|word|dword|j|jump)_[0-9A-Fa-f]+$'
    r'|^[a-z]{2,7}_r\d', re.I)

# A signature shorter than this collides by chance -- there are only so many ways
# to write six instructions, and `push/adds/bl/pop/bx` is every wrapper in the ROM.
MIN_INSNS = 12

REG_RE = re.compile(
    r'^(r\d{1,2}|a[1-4]|v[1-8]|sp|lr|pc|ip|fp|sb|sl)$', re.I)
IMM_RE = re.compile(r'^#')
TOKEN_RE = re.compile(r'[A-Za-z_.$][\w.$]*|#-?(?:0x[0-9A-Fa-f]+|\d+)|'
                      r'-?(?:0x[0-9A-Fa-f]+|\d+)|[\[\]{}!^,]')
LABEL_LINE_RE = re.compile(r'^([.\w$]+):')
BRANCH_MNEM = frozenset(
    "b bl blx bx beq bne bcs bcc bmi bpl bvs bvc bhi bls bge blt bgt ble "
    "bhs blo".split())


def split_insn(text):
    """`adds r0, r1, #4` -> ('adds', 'r0, r1, #4')."""
    parts = text.split(None, 1)
    return parts[0].lower(), (parts[1] if len(parts) > 1 else "")


def label_positions(fn):
    """Local label -> index of the instruction it precedes.

    Lets a branch be encoded as a delta in instruction indices, which is the
    part of control flow that survives across two different games: the loop is
    the same shape even though every address in it differs.
    """
    pos = {}
    idx = 0
    for ln in fn.lines:
        s = ln.split("@")[0].strip()
        if not s:
            continue
        m = LABEL_LINE_RE.match(s)
        if m:
            pos[m.group(1)] = idx
            s = s.split(":", 1)[1].strip()
            if not s:
                continue
        if s.startswith(".") or awlib.MACRO_RE.match(s):
            continue
        idx += 1
    return pos


def signature(fn):
    """(full, ops) signature tuples, or (None, None) if too short to trust."""
    insns = awlib.instructions(fn)
    if len(insns) < 2:
        return None, None
    labels = label_positions(fn)

    full, ops = [], []
    for i, text in enumerate(insns):
        mnem, operands = split_insn(text)
        ops.append(mnem)

        if mnem in BRANCH_MNEM:
            target = operands.strip()
            if target in labels:
                full.append(f"{mnem} L{labels[target] - i:+d}")
                continue
            if REG_RE.match(target):
                full.append(f"{mnem} R")
                continue
            full.append(f"{mnem} S")
            continue

        shape = []
        for tok in TOKEN_RE.findall(operands):
            if REG_RE.match(tok):
                shape.append("R")
            elif IMM_RE.match(tok) or tok.lstrip("-").replace("0x", "").isalnum() \
                    and not tok[0].isalpha():
                shape.append("#")
            elif tok in labels:
                shape.append("L")
            elif tok[0].isalpha() or tok[0] in "_.$":
                shape.append("S")
            else:
                shape.append(tok)
        full.append(mnem + " " + "".join(shape))

    return tuple(full), tuple(ops)


def is_named(name):
    return not ANON_RE.match(name)


def load_reference(refs_dir):
    """Every semantically-named function in the FE decomps' assembly."""
    if not os.path.isdir(refs_dir):
        print(f"error: reference dir {refs_dir} not found -- clone the FE "
              f"decomps there (see the module docstring)")
        return None

    corpus = []
    for repo in sorted(os.listdir(refs_dir)):
        root = os.path.join(refs_dir, repo)
        if not os.path.isdir(root):
            continue
        n_named = 0
        for dirpath, dirnames, filenames in os.walk(root):
            dirnames[:] = [d for d in dirnames if d != ".git"]
            for entry in sorted(filenames):
                if not entry.endswith(".s"):
                    continue
                try:
                    af = awlib.AsmFile(os.path.join(dirpath, entry))
                except Exception:
                    continue
                for fn in af.funcs:
                    if not is_named(fn.name):
                        continue
                    corpus.append((repo, fn))
                    n_named += 1
        if n_named:
            print(f"  {repo:20} {n_named:5,} named asm functions")
    return corpus


def index_reference(corpus, min_insns):
    """signature -> set of names. A signature claimed by two different names is
    ambiguous and cannot identify anything, so it is dropped rather than guessed."""
    by_full, by_ops = defaultdict(set), defaultdict(set)
    for repo, fn in corpus:
        full, ops = signature(fn)
        if not full or len(full) < min_insns:
            continue
        by_full[full].add(fn.name)
        by_ops[ops].add(fn.name)
    return by_full, by_ops


def match(refs_dir, min_insns, verbose=False):
    print(f"reference corpus from {os.path.relpath(refs_dir, os.path.dirname(awlib.REPO))}/")
    corpus = load_reference(refs_dir)
    if corpus is None:
        return None
    print(f"  {'total':20} {len(corpus):5,}")

    by_full, by_ops = index_reference(corpus, min_insns)
    uniq_full = {k: next(iter(v)) for k, v in by_full.items() if len(v) == 1}
    uniq_ops = {k: next(iter(v)) for k, v in by_ops.items() if len(v) == 1}
    print(f"\nusable signatures (>= {min_insns} insns, unambiguous)")
    print(f"  full (opcodes + operand shape + branch deltas)  {len(uniq_full):5,}")
    print(f"  ops  (opcode sequence only)                     {len(uniq_ops):5,}")
    dropped = len(by_full) - len(uniq_full)
    print(f"  dropped as ambiguous                            {dropped:5,}")

    ours = [fn for af in awlib.load_all() for fn in af.funcs]
    hits, eligible = [], 0
    for fn in ours:
        if not ANON_RE.match(fn.name):
            continue                      # already identified
        full, ops = signature(fn)
        if not full or len(full) < min_insns:
            continue
        eligible += 1
        if full in uniq_full:
            hits.append({"name": fn.name, "addr": f"0x{fn.addr:08X}",
                         "size": fn.size, "src": fn.src,
                         "fe_name": uniq_full[full], "strength": "full",
                         "insns": len(full)})
        elif ops in uniq_ops:
            hits.append({"name": fn.name, "addr": f"0x{fn.addr:08X}",
                         "size": fn.size, "src": fn.src,
                         "fe_name": uniq_ops[ops], "strength": "ops",
                         "insns": len(full)})

    print(f"\nAW2 functions long enough to test: {eligible:,} of {len(ours):,}")
    rate = len(hits) / eligible * 100 if eligible else 0
    print(f"identified: {len(hits):,}  ({rate:.2f}% of eligible)")
    for s in ("full", "ops"):
        n = sum(1 for h in hits if h["strength"] == s)
        print(f"  {s:5} {n:4}")

    if hits and verbose:
        print("\nmatches")
        for h in sorted(hits, key=lambda h: -h["insns"]):
            print(f"  {h['name']:20} {h['addr']}  {h['size']:>5,} B  "
                  f"{h['insns']:4} insns  {h['strength']:5}  ->  {h['fe_name']}")

    payload = {
        "min_insns": min_insns,
        "reference_functions": len(corpus),
        "reference_signatures": {"full": len(uniq_full), "ops": len(uniq_ops)},
        "eligible": eligible,
        "matches": sorted(hits, key=lambda h: h["addr"]),
    }
    awlib.write_text(OUT, json.dumps(payload, indent=1) + "\n")
    print(f"\nwrote {os.path.relpath(OUT, awlib.REPO)}")
    return payload


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--refs", default=DEFAULT_REFS)
    ap.add_argument("--min-insns", type=int, default=MIN_INSNS)
    ap.add_argument("--report", action="store_true",
                    help="list every match")
    args = ap.parse_args()
    result = match(args.refs, args.min_insns, verbose=args.report)
    return 0 if result is not None else 1


if __name__ == "__main__":
    sys.exit(main())
