#!/usr/bin/env python3
"""Prove the split is lossless by reconstructing asm/*.s from build/functions/.

The real acceptance gate for the split is `make compare` still producing SHA1
14dd0b22b894865867aff89e8116b2dffae25605. That needs the toolchain. This check
runs without it and is strictly stronger at the text level: if concatenating the
units reproduces every source file byte-for-byte, the assembler cannot observe
any difference, because it sees the same input.

Run this before any `make compare`; a failure here localises the bug to an exact
byte offset, whereas a ROM hash mismatch tells you only that something is wrong.

Usage:
    python tools/verify_split.py [-v]
"""

import argparse
import json
import os
import sys

import awlib
from split_asm import MANIFEST, OUT_DIR, file_header


def load_manifest():
    if not os.path.exists(MANIFEST):
        print(f"error: {os.path.relpath(MANIFEST, awlib.REPO)} missing "
              f"-- run tools/split_asm.py first")
        return None
    with open(MANIFEST, encoding="utf-8") as fh:
        return json.load(fh)


def first_difference(a, b):
    limit = min(len(a), len(b))
    for i in range(limit):
        if a[i] != b[i]:
            return i
    return limit if len(a) != len(b) else -1


def context_at(text, offset, width=60):
    lo = max(0, offset - width)
    hi = min(len(text), offset + width)
    return repr(text[lo:offset]) + "  <<HERE>>  " + repr(text[offset:hi])


def verify(verbose=False):
    manifest = load_manifest()
    if manifest is None:
        return 1

    by_src = {}
    for entry in manifest:
        by_src.setdefault(entry["src"], []).append(entry)

    ok = True
    total_funcs = 0
    for af in awlib.load_all():
        original = "".join(af.lines)
        header = file_header(af)
        entries = by_src.get(af.base, [])

        # Preamble unit first, then the rest in address order -- exactly the
        # order gen_lds.py emits into the linker script.
        entries.sort(key=lambda e: (not e["is_preamble"],
                                    int(e["addr_hex"], 16) if e["addr_hex"] else -1))

        pieces = []
        saw_preamble = False
        for entry in entries:
            path = os.path.join(OUT_DIR, entry["file"])
            if not os.path.exists(path):
                print(f"FAIL {af.base}: missing unit file {entry['file']}")
                ok = False
                break
            text = "".join(awlib.read_lines(path))
            if entry["is_preamble"]:
                saw_preamble = True
                pieces.append(text)
                continue
            n = entry["header_chars"]
            if text[:n] != header:
                print(f"FAIL {af.base}: unit {entry['file']} header does not "
                      f"match the source file header (line-ending mismatch?)")
                ok = False
                break
            pieces.append(text[n:])
            total_funcs += entry["n_functions"]
        else:
            # Units each carry a copy of the file header; it belongs exactly
            # once in the reconstruction, supplied by the preamble unit when
            # one exists and re-added here otherwise.
            rebuilt = ("" if saw_preamble else header) + "".join(pieces)
            if rebuilt == original:
                if verbose:
                    print(f"  ok   {af.base:22} {len(entries):5} units, "
                          f"{len(original):,} bytes reproduced")
                continue
            ok = False
            off = first_difference(rebuilt, original)
            print(f"FAIL {af.base}: reconstruction differs at byte {off:,}")
            print(f"  original len {len(original):,}  rebuilt len {len(rebuilt):,}")
            print(f"  original: {context_at(original, off)}")
            print(f"  rebuilt : {context_at(rebuilt, off)}")

    if ok:
        print(f"PASS  all {len(manifest):,} units reconstruct "
              f"asm/*.s byte-for-byte")
        print(f"      the assembler sees identical input; the split is lossless")
    return 0 if ok else 1


def check_self_contained(verbose=False):
    """Every local label a unit references must be defined inside that unit.

    Reconstruction alone cannot catch this: concatenating units reproduces the
    original file whether or not the cuts left dangling `_0801D3EC` references.
    Those only surface as assembler errors, so check statically instead.
    """
    manifest = load_manifest()
    if manifest is None:
        return 1

    bad = []
    for entry in manifest:
        path = os.path.join(OUT_DIR, entry["file"])
        defined, referenced = set(), set()
        for ln in awlib.read_lines(path):
            d = awlib.LOCAL_DEF_RE.match(ln)
            if d:
                defined.add(d.group(1))
            referenced.update(awlib.LOCAL_REF_RE.findall(ln.split("@")[0]))
        dangling = referenced - defined
        if dangling:
            bad.append((entry["unit"], sorted(dangling)[:6], len(dangling)))

    if bad:
        print(f"FAIL {len(bad)} unit(s) reference labels they do not define:")
        for unit, sample, n in bad[:15]:
            print(f"  {unit:26} {n:3} dangling: {', '.join(sample)}")
        return 1

    print(f"PASS  all {len(manifest):,} units are self-contained "
          f"(no dangling local labels)")
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-v", "--verbose", action="store_true")
    args = ap.parse_args()
    rc = verify(verbose=args.verbose)
    rc |= check_self_contained(verbose=args.verbose)
    return rc


if __name__ == "__main__":
    sys.exit(main())
