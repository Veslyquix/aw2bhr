#!/usr/bin/env python3
"""Compile a candidate C function and decide whether it matches the original.

The verdict is byte equality of the function's encoded range, plus equality of
its relocations. Bytes alone are not enough: two objects can hold identical
instruction encodings while one calls the wrong function, because an unresolved
`bl` is the same placeholder bytes whatever symbol it points at.

The target comes from the assembled original -- build/functions/<unit>.o -- not
from the ROM, so both sides are relocatable objects and are directly comparable.
A unit may hold several functions, so the target range is sliced out using the
function's address and size from the index.

    python tools/trymatch.py sub_08013AEC [--diff]

Exit status is 0 only on a match, so this can gate a loop.
"""

import argparse
import json
import os
import subprocess
import sys

import agbenv
import awlib

WORK = os.path.join(awlib.REPO, "work")
FUNC_DIR = os.path.join(awlib.REPO, "build", "functions")


def load(path, what):
    if not os.path.exists(path):
        print("error: %s missing -- %s" % (os.path.relpath(path, awlib.REPO), what))
        return None
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


def resolve(name):
    recs = load(os.path.join(awlib.DATA_DIR, "functions.json"),
                "run tools/index_functions.py")
    if recs is None:
        return None, None
    key = name.strip().lower()
    rec = next((r for r in recs if r["name"].lower() == key), None)
    if rec is None:
        rec = next((r for r in recs if r["addr_hex"].lower() == key
                    or ("0x%08x" % r["addr"]) == key), None)
    if rec is None:
        print("error: no function %r in the index" % name)
        return None, None

    units = load(os.path.join(FUNC_DIR, "units.json"), "run tools/split_asm.py")
    if units is None:
        return rec, None
    unit = next((u for u in units if rec["name"] in u["functions"]), None)
    if unit is None:
        print("error: %s is in no split unit" % rec["name"])
    return rec, unit


def section_bytes(obj_rel, out_bin_rel):
    """Raw contents of .text, via objcopy."""
    prefix = agbenv.makefile_var("PREFIX") or "arm-none-eabi-"
    rc, _, se = agbenv.run(
        '%sobjcopy -O binary --only-section=.text "%s" "%s"'
        % (prefix, obj_rel, out_bin_rel))
    if rc != 0:
        return None, se
    path = os.path.join(awlib.REPO, out_bin_rel.replace("/", os.sep))
    if not os.path.exists(path):
        return None, "objcopy produced nothing"
    return open(path, "rb").read(), None


def relocations(obj_rel, lo, hi):
    """(offset, type, symbol) for relocations landing inside [lo, hi)."""
    prefix = agbenv.makefile_var("PREFIX") or "arm-none-eabi-"
    rc, so, se = agbenv.run('%sobjdump -r "%s"' % (prefix, obj_rel))
    if rc != 0:
        return None
    out, in_text = [], False
    for ln in so.splitlines():
        s = ln.strip()
        if s.startswith("RELOCATION RECORDS FOR"):
            in_text = "[.text]" in s
            continue
        if not in_text or not s or s.startswith("OFFSET"):
            continue
        parts = s.split()
        if len(parts) < 3:
            continue
        try:
            off = int(parts[0], 16)
        except ValueError:
            continue
        if lo <= off < hi:
            out.append((off - lo, parts[1], parts[2]))
    return out


def disassemble(obj_rel, lo, hi):
    prefix = agbenv.makefile_var("PREFIX") or "arm-none-eabi-"
    rc, so, _ = agbenv.run(
        '%sobjdump -d -r -z --start-address=0x%x --stop-address=0x%x "%s"'
        % (prefix, lo, hi, obj_rel))
    if rc != 0:
        return []
    keep = []
    for ln in so.splitlines():
        parts = ln.split("\t")
        if len(parts) < 3:
            continue
        # objdump columns are: address, encoding, mnemonic, operands, comment.
        # Drop the first two -- they are position-dependent and would diff on
        # every line for a function sitting at a different offset -- and drop
        # the trailing `@ (...)` comment, which is just a resolved address.
        text = " ".join(p.strip() for p in parts[2:] if p.strip())
        text = text.split("@")[0].strip()
        if text:
            keep.append(text)
    return keep


def check(name, want_diff=False, keep_going=False):
    rec, unit = resolve(name)
    if rec is None or unit is None:
        return 2

    fn = rec["name"]
    workdir = os.path.join(WORK, fn)
    csrc = os.path.join(workdir, fn + ".c")
    if not os.path.exists(csrc):
        print("error: %s missing -- run `python tools/newfunc.py %s` first"
              % (os.path.relpath(csrc, awlib.REPO), fn))
        return 2

    # Target: assemble the original unit if that has not been done already.
    # Promoted units live outside build/functions, so take the directory from
    # the manifest -- otherwise a function stops being re-verifiable the moment
    # it is promoted, which is precisely when regression checking matters.
    unit_dir = unit.get("dir", "build/functions")
    unit_s = "%s/%s" % (unit_dir, unit["file"])
    unit_o = "%s/%s.o" % (unit_dir, unit["unit"])
    if not os.path.exists(os.path.join(awlib.REPO, unit_o.replace("/", os.sep))):
        rc, _, se = agbenv.assemble(unit_s, unit_o)
        if rc != 0:
            print("error: could not assemble the original unit\n%s" % se[-1500:])
            return 2

    offset = rec["addr"] - int(unit["addr_hex"], 16)
    size = rec["size"]
    if offset < 0:
        print("error: %s sits before its unit start" % fn)
        return 2

    # Candidate.
    cand_o = "work/%s/%s.o" % (fn, fn)
    rc, so, se = agbenv.compile_c("work/%s/%s.c" % (fn, fn), cand_o)
    if rc != 0:
        print("COMPILE FAILED")
        msg = (se or so).strip().splitlines()
        for ln in msg[-25:]:
            print("  " + ln)
        return 1

    tgt, err = section_bytes(unit_o, "work/%s/_target.bin" % fn)
    if tgt is None:
        print("error: could not read target .text: %s" % err)
        return 2
    cand, err = section_bytes(cand_o, "work/%s/_cand.bin" % fn)
    if cand is None:
        print("error: could not read candidate .text: %s" % err)
        return 2

    tgt_fn = tgt[offset:offset + size]
    cand_fn = cand[:size]

    print("%s   %d bytes expected" % (fn, size))
    if len(cand) != size:
        print("  size:  candidate is %d bytes, original is %d  (%+d)"
              % (len(cand), size, len(cand) - size))
    else:
        print("  size:  match (%d bytes)" % size)

    same = tgt_fn == cand_fn and len(cand) == size
    if same:
        t_rel = relocations(unit_o, offset, offset + size)
        c_rel = relocations(cand_o, 0, size)
        if t_rel is not None and c_rel is not None and t_rel != c_rel:
            same = False
            print("  bytes: match, but relocations differ")
            for side, rels in (("original ", t_rel), ("candidate", c_rel)):
                for r in rels[:8]:
                    print("    %s +0x%03x %-18s %s" % (side, r[0], r[1], r[2]))
        else:
            print("  relocs: match")

    if same:
        print("\nMATCH -- byte-for-byte identical to the original")
        return 0

    n_diff = sum(1 for a, b in zip(tgt_fn, cand_fn) if a != b)
    common = min(len(tgt_fn), len(cand_fn))
    pct = (common - n_diff) / size * 100 if size else 0
    print("  bytes: %d of %d differ  (%.1f%% identical)" % (n_diff, common, pct))
    first = next((i for i, (a, b) in enumerate(zip(tgt_fn, cand_fn)) if a != b), common)
    print("  first difference at +0x%x" % first)

    if want_diff:
        import difflib
        a = disassemble(unit_o, offset, offset + size)
        b = disassemble(cand_o, 0, max(size, len(cand)))
        print("\n--- original / +++ candidate")
        for ln in list(difflib.unified_diff(a, b, lineterm="", n=3))[2:]:
            print("  " + ln)
    else:
        print("\n  re-run with --diff for an instruction-level comparison")
    return 1


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", help="function name or address")
    ap.add_argument("--diff", action="store_true",
                    help="show an instruction-level diff on mismatch")
    args = ap.parse_args()
    return check(args.name, want_diff=args.diff)


if __name__ == "__main__":
    sys.exit(main())
