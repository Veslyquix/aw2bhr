#!/usr/bin/env python3
"""Split asm/*.s into one translation unit per function under build/functions/.

Why this exists: upstream keeps 4,554 functions in 4 monolithic files (one holds
2,698). That layout blocks per-function objdiff scoring, blocks decomp-permuter
(which requires one function per file), and makes parallel agents collide on the
same file. Splitting is the enabling change for everything downstream.

Upstream asm/*.s is never modified -- it stays the source of truth and this
regenerates from it, so pulling upstream is just a re-run.

Correctness rules:
  * Chunks are copied verbatim, never reformatted. Reconstructing the original
    file from its units must be byte-identical (tools/verify_split.py).
  * 20 functions reference labels defined in a sibling function. Splitting those
    apart would produce undefined symbols, so their connected component is
    emitted as one unit, expanded to a contiguous address span to preserve order.
  * code.s defines 3 pool labels before its first function. That preamble is
    emitted as its own unit and must link first within that file's slot.

Usage:
    python tools/split_asm.py [--stats] [--clean]
"""

import argparse
import json
import os
import shutil
import sys

import awlib

OUT_DIR = os.path.join(awlib.REPO, "build", "functions")
MANIFEST = os.path.join(OUT_DIR, "units.json")

def file_header(af):
    """The leading `.include`/`.syntax` block, copied verbatim.

    Taken from the file rather than hardcoded: three of the four sources use
    CRLF and one uses LF, so a literal here would corrupt the round-trip.
    """
    out = []
    for ln in af.preamble_lines:
        s = ln.strip()
        if s.startswith(".include") or s.startswith(".syntax") or not s:
            out.append(ln)
        else:
            break                          # first pool label ends the header
    return "".join(out)


class Unit:
    def __init__(self, name, src, funcs, is_preamble=False, preamble_text="",
                 header=""):
        self.name = name
        self.src = src
        self.funcs = funcs                 # list[awlib.Function], in order
        self.is_preamble = is_preamble
        self.preamble_text = preamble_text
        self.header = header               # stripped again by verify_split.py

    @property
    def filename(self):
        return f"{self.name}.s"

    @property
    def addr(self):
        return self.funcs[0].addr if self.funcs else -1

    def render(self):
        if self.is_preamble:
            # Already carries the real .include/.syntax header from upstream.
            return self.preamble_text + "".join(f.text for f in self.funcs)
        return self.header + "".join(f.text for f in self.funcs)


def plan_units(af):
    """Group an AsmFile's functions into emittable units."""
    n = len(af.funcs)
    definer = {}
    for i, fn in enumerate(af.funcs):
        for label in fn.defs:
            definer[label] = i

    parent = list(range(n))

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    def union(a, b):
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[max(ra, rb)] = min(ra, rb)

    # Functions that reach into a sibling's labels must travel together.
    needs_preamble = set()
    for i, fn in enumerate(af.funcs):
        external = fn.refs - fn.defs
        for label in external:
            if label in af.preamble_defs:
                needs_preamble.add(i)
            elif label in definer:
                union(i, definer[label])

    # A function at a non-word-aligned address cannot start its own object. The
    # linker aligns every input .text section to 4, so such a function is pushed
    # forward 2 bytes and everything after it in the ROM shifts -- including the
    # stored function pointers, which is how a 2-byte slip turns into millions of
    # differing bytes. Four functions in the corpus are like this, all declared
    # `non_word_aligned_thumb_func_start`, and each is preceded by a word-aligned
    # function; travelling with that predecessor keeps every unit boundary
    # word-aligned. Keyed on the address rather than the directive because the
    # address is what the linker actually reacts to.
    for i, fn in enumerate(af.funcs):
        if fn.addr % 4 and i > 0:
            union(i, i - 1)

    groups = {}
    for i in range(n):
        groups.setdefault(find(i), []).append(i)

    # Expand each component to a contiguous span so link order is preserved.
    spans = []
    for members in groups.values():
        spans.append((min(members), max(members)))
    spans.sort()

    merged = []
    for lo, hi in spans:
        if merged and lo <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(merged[-1][1], hi))
        else:
            merged.append((lo, hi))

    # The preamble unit absorbs any function depending on preamble-only labels.
    pre_hi = -1
    if needs_preamble:
        pre_hi = max(needs_preamble)
        for lo, hi in merged:
            if lo <= pre_hi <= hi:
                pre_hi = max(pre_hi, hi)

    units = []
    base = af.base[:-2]
    header = file_header(af)
    has_preamble = bool(af.preamble_defs) or pre_hi >= 0
    if has_preamble:
        absorbed = [f for f in af.funcs[:pre_hi + 1]] if pre_hi >= 0 else []
        units.append(Unit(f"{base}__pre", af.base, absorbed,
                          is_preamble=True,
                          preamble_text="".join(af.preamble_lines)))

    start_at = pre_hi + 1
    for lo, hi in merged:
        if hi < start_at:
            continue
        lo = max(lo, start_at)
        units.append(Unit(af.funcs[lo].name, af.base, af.funcs[lo:hi + 1],
                          header=header))

    return units


def build(clean=False):
    if clean and os.path.isdir(OUT_DIR):
        shutil.rmtree(OUT_DIR)
    os.makedirs(OUT_DIR, exist_ok=True)

    files = awlib.load_all()
    manifest = []
    total_funcs = 0

    for af in files:
        units = plan_units(af)
        for u in units:
            awlib.write_text(os.path.join(OUT_DIR, u.filename), u.render())
            total_funcs += len(u.funcs)
            manifest.append({
                "unit": u.name,
                "file": u.filename,
                "src": u.src,
                "is_preamble": u.is_preamble,
                "addr_hex": f"0x{u.addr:08X}" if u.funcs else None,
                "functions": [f.name for f in u.funcs],
                "n_functions": len(u.funcs),
                "size": sum(f.size for f in u.funcs),
                "header_chars": len(u.header),
            })

    awlib.write_text(MANIFEST, json.dumps(manifest, indent=1) + "\n")
    return manifest, total_funcs, files


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--stats", action="store_true")
    ap.add_argument("--clean", action="store_true")
    args = ap.parse_args()

    manifest, total_funcs, files = build(clean=args.clean)
    expected = sum(len(af.funcs) for af in files)

    print(f"wrote {len(manifest):,} units to {os.path.relpath(OUT_DIR, awlib.REPO)}")
    print(f"  functions emitted {total_funcs:,} / {expected:,}")
    if total_funcs != expected:
        print("  ERROR: function count mismatch -- split dropped or duplicated code")
        return 1

    if args.stats:
        multi = [m for m in manifest if m["n_functions"] > 1]
        pre = [m for m in manifest if m["is_preamble"]]
        print(f"\n  single-function units {len(manifest) - len(multi):,}")
        print(f"  merged units          {len(multi):,} (cross-referencing siblings)")
        print(f"  preamble units        {len(pre):,}")
        for m in multi:
            print(f"    {m['unit']:24} {m['n_functions']:3} funcs  {m['src']}")
        print("\n  by source file")
        for src in sorted({m["src"] for m in manifest}):
            sel = [m for m in manifest if m["src"] == src]
            print(f"    {src:22} {len(sel):5} units")
    return 0


if __name__ == "__main__":
    sys.exit(main())
