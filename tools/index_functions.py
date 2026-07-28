#!/usr/bin/env python3
"""Build data/functions.json -- the master index of every function in the ROM.

This is the work queue the agent fleet pulls from. Each record carries enough
context to schedule and prompt a matching attempt without re-parsing the asm.

Usage:
    python tools/index_functions.py [--stats]
"""

import argparse
import json
import os
import re
import sys

import awlib

OUT = os.path.join(awlib.DATA_DIR, "functions.json")

# 4-8 byte `svc` thunks. These are BIOS entry points, not game code -- a port
# reimplements them natively rather than decompiling them.
BIOS_SYSCALLS = {
    "SoftReset", "RegisterRamReset", "Halt", "Stop", "IntrWait",
    "VBlankIntrWait", "Div", "DivArm", "DivRem", "Sqrt", "ArcTan", "ArcTan2",
    "CpuSet", "CpuFastSet", "BiosChecksum", "BgAffineSet", "ObjAffineSet",
    "BitUnPack", "LZ77UnCompWram", "LZ77UnCompVram", "HuffUnComp",
    "RLUnCompWram", "RLUnCompVram", "Diff8bitUnFilterWram",
    "Diff8bitUnFilterVram", "Diff16bitUnFilter", "SoundBias", "MultiBoot",
}

ANON_RE = re.compile(r'^sub_[0-9A-Fa-f]{8}$')

# Linker veneers and hand-written driver assembly. See the file's own comment
# for why these are called out rather than left in the queue.
ASM_RESIDENT_FILE = os.path.join(awlib.DATA_DIR, "asm-resident.json")


def asm_resident():
    if not os.path.isfile(ASM_RESIDENT_FILE):
        return {}
    with open(ASM_RESIDENT_FILE, encoding="utf-8") as fh:
        return json.load(fh).get("functions", {})


def decompiled_symbols():
    """Function names already living in src/*.c -- these are done."""
    names = set()
    src = os.path.join(awlib.REPO, "src")
    if not os.path.isdir(src):
        return names
    sig = re.compile(r'^[A-Za-z_][\w \*]*?\b([A-Za-z_]\w*)\s*\([^;]*\)\s*\{?\s*$')
    # A function returning a function pointer nests its own name inside
    # parentheses -- `void (*f(void))(void)` -- so `sig`, which expects the name
    # immediately before the argument list, never matches one. sub_080366DC and
    # sub_080366E8 sat promoted-but-counted-as-asm until this was added, which
    # also means the work queue kept offering them after they were in the ROM.
    fptr = re.compile(r'^[A-Za-z_][\w \*]*\(\s*\*\s*([A-Za-z_]\w*)\s*\(')
    # Recursive: promoted functions live in src/decomp/, and missing them would
    # leave them queued as outstanding work after they are already in the ROM.
    for dirpath, _, filenames in os.walk(src):
        for entry in sorted(filenames):
            if not entry.endswith(".c"):
                continue
            with open(os.path.join(dirpath, entry), encoding="utf-8",
                      errors="replace") as fh:
                for ln in fh:
                    m = sig.match(ln) or fptr.match(ln)
                    if m:
                        names.add(m.group(1))
    return names


def build():
    files = awlib.load_all()
    done = decompiled_symbols()
    resident = asm_resident()
    records = []

    for af in files:
        for fn in af.funcs:
            anon = bool(ANON_RE.match(fn.name))
            records.append({
                "name": fn.name,
                "addr": fn.addr,
                "addr_hex": f"0x{fn.addr:08X}",
                "size": fn.size,
                "mode": fn.mode,
                "directive": fn.directive,
                "src": fn.src,
                # Promoted functions stay in asm/ as reference -- the build
                # simply stops emitting their unit -- so presence in the
                # assembly no longer means outstanding. Without this the work
                # queue keeps handing out functions that are already in the ROM.
                # asm-resident is a third state: not outstanding and never
                # will be, because the assembly is not compiler output.
                "status": ("matched" if fn.name in done
                           else "asm-resident" if fn.name in resident
                           else "asm"),
                "asm_resident_reason": resident.get(fn.name),
                "named": not anon,
                "kind": "bios" if fn.name in BIOS_SYSCALLS else "game",
                "trivial": awlib.is_trivial(fn),
                "difficulty": awlib.difficulty(fn),
                "calls": sorted({t for _, t in fn.calls}),
                "data_refs": sorted(set(fn.data_refs)),
                "n_lines": len(fn.lines),
            })

    records.sort(key=lambda r: r["addr"])
    awlib.write_text(OUT, json.dumps(records, indent=1) + "\n")
    return records, done


def stats(records, done):
    total = len(records)
    by_bytes = sum(r["size"] for r in records)
    bios = [r for r in records if r["kind"] == "bios"]
    named = [r for r in records if r["named"]]
    game = [r for r in records if r["kind"] == "game"]

    print(f"indexed              {total:,} functions   {by_bytes:,} bytes")
    print(f"  BIOS syscall stubs {len(bios):,}  ({sum(r['size'] for r in bios):,} B)")
    print(f"  real game code     {len(game):,}  ({sum(r['size'] for r in game):,} B)")
    print(f"  named/identified   {len(named):,}  ({len(named)/total*100:.1f}%)")
    print(f"  already in src/    {len(done):,} C functions (proc.c, title-screen.c)")

    print("\nby source file")
    for src in sorted({r["src"] for r in records}):
        sel = [r for r in records if r["src"] == src]
        print(f"  {src:22} {len(sel):5} funcs  {sum(r['size'] for r in sel):>9,} B")

    print("\nby difficulty (scheduling hint)")
    for lo, hi, label in [(0, 20, "trivial"), (20, 40, "easy"), (40, 60, "moderate"),
                          (60, 80, "hard"), (80, 101, "brutal")]:
        sel = [r for r in records if lo <= r["difficulty"] < hi]
        print(f"  {label:9} {len(sel):5} ({len(sel)/total*100:5.1f}%)  "
              f"{sum(r['size'] for r in sel):>9,} B")

    leaves = [r for r in records if not r["calls"]]
    print(f"\nleaf functions (no outgoing calls): {len(leaves):,} "
          f"({len(leaves)/total*100:.1f}%)  <- start the fleet here")
    easy_leaves = [r for r in leaves if r["difficulty"] < 20 and r["kind"] == "game"]
    print(f"  of those, trivial difficulty:     {len(easy_leaves):,}")

    stubs = [r for r in records if r["trivial"] and r["kind"] == "game"]
    print(f"\nreturn stubs (`bx lr` / `movs r0,#N; bx lr`): {len(stubs):,} "
          f"({sum(r['size'] for r in stubs):,} B)")
    print(f"  demoted in the queue and swept as one bulk task, not one agent each")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--stats", action="store_true")
    args = ap.parse_args()
    records, done = build()
    rel = os.path.relpath(OUT, awlib.REPO)
    print(f"wrote {rel}  ({len(records):,} functions)")
    if args.stats:
        print()
        stats(records, done)
    return 0


if __name__ == "__main__":
    sys.exit(main())
