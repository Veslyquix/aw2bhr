#!/usr/bin/env python3
"""Generate aw2bhr.split.lds -- the linker script for the per-function build.

Upstream aw2bhr.lds lists one object per monolithic asm file. After splitting
there are 4,505 objects instead of 4, and they must link in exactly the original
address order or every address in the ROM shifts.

Rather than regenerate the whole script (which would risk dropping the libgcc
placement or the interleaved src/*.o slots), this rewrites only the
`asm/<file>.o(.text);` lines, expanding each into its unit list. Every other
line -- EWRAM/IWRAM symbol tables, libgcc ordering, rodata/data -- passes
through verbatim.

Upstream aw2bhr.lds is left untouched; the Makefile on this branch selects the
generated one.

Usage:
    python tools/gen_lds.py [--check]
"""

import argparse
import json
import os
import re
import sys

import awlib
from split_asm import MANIFEST

SRC_LDS = os.path.join(awlib.REPO, "aw2bhr.lds")
OUT_LDS = os.path.join(awlib.REPO, "aw2bhr.split.lds")

# e.g. "\t\tasm/code-0801D390.o(.text);"
ASM_OBJ_RE = re.compile(r'^(\s*)asm/([\w.-]+)\.o\(\.text\);\s*$')

# Objects live beside their generated sources under build/functions/, and the
# link step runs from BUILD_DIR, so paths are relative to that.
OBJ_PREFIX = "functions"


def load_units():
    if not os.path.exists(MANIFEST):
        print("error: build/functions/units.json missing -- run "
              "tools/split_asm.py first")
        return None
    with open(MANIFEST, encoding="utf-8") as fh:
        manifest = json.load(fh)

    by_src = {}
    for entry in manifest:
        by_src.setdefault(entry["src"], []).append(entry)

    # Preamble first, then ascending address -- the exact order verify_split.py
    # proves reconstructs the original file.
    for entries in by_src.values():
        entries.sort(key=lambda e: (not e["is_preamble"],
                                    int(e["addr_hex"], 16) if e["addr_hex"] else -1))
    return by_src


def generate():
    by_src = load_units()
    if by_src is None:
        return None, 0

    out = []
    expanded = 0
    seen = set()
    for line in awlib.read_lines(SRC_LDS):
        m = ASM_OBJ_RE.match(line)
        if not m:
            out.append(line)
            continue
        indent, base = m.group(1), m.group(2) + ".s"
        entries = by_src.get(base)
        if not entries:
            print(f"error: no units for {base}; is the split current?")
            return None, 0
        seen.add(base)
        out.append(f"{indent}/* {base} -- {len(entries)} units */\n")
        for e in entries:
            out.append(f"{indent}{OBJ_PREFIX}/{e['unit']}.o(.text);\n")
        expanded += len(entries)

    missing = set(by_src) - seen
    if missing:
        print(f"error: split produced units for {sorted(missing)} but the "
              f"linker script never references them")
        return None, 0

    return "".join(out), expanded


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true",
                    help="verify the generated script is current without writing")
    args = ap.parse_args()

    text, expanded = generate()
    if text is None:
        return 1

    if args.check:
        if not os.path.exists(OUT_LDS):
            print("FAIL aw2bhr.split.lds missing")
            return 1
        current = "".join(awlib.read_lines(OUT_LDS))
        if current != text:
            print("FAIL aw2bhr.split.lds is stale -- re-run tools/gen_lds.py")
            return 1
        print(f"PASS aw2bhr.split.lds current ({expanded:,} object entries)")
        return 0

    awlib.write_text(OUT_LDS, text)
    print(f"wrote {os.path.relpath(OUT_LDS, awlib.REPO)}  "
          f"({expanded:,} object entries)")
    print(f"      upstream aw2bhr.lds left untouched")
    return 0


if __name__ == "__main__":
    sys.exit(main())
