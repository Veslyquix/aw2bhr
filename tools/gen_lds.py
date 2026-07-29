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

# e.g. "\t\t. = ALIGN(4); data/rodata.o(.rodata)" -- a ROM data blob that may
# hold -fforce-addr pool words now emitted by promoted C; see
# tools/split_rodata.py. Only the blobs that tool splits are expanded, so the
# other data/*.o lines pass through untouched.
BLOB_RE = re.compile(r'^(\s*)\. = ALIGN\(4\); data/([\w.-]+)\.o\((\.\w+)\)\s*$')
RODATA_MANIFEST = os.path.join(awlib.REPO, "build", "rodata", "units.json")

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


def load_blob_manifest():
    """{"<blob>.s": {"sect": ..., "seq": [...]}} or None to leave lines verbatim.

    Returned whenever build/rodata exists, even with nothing carved out, and
    that is not an optimisation -- it is REQUIRED. **GNU ld auto-loads an
    object named without a wildcard in an input-section spec**, so leaving
    `data/rodata.o(.rodata)` in the script pulls that object into the link even
    though the Makefile never puts it on the command line, and every symbol in
    it collides with the generated piece. Verified directly: a script naming a
    nonexistent `nosuch.o(.text)` fails with `cannot find nosuch.o`.

    With no carve-outs the single generated piece is textually identical to
    data/rodata.s, so the ROM is unchanged either way.
    """
    if not os.path.exists(RODATA_MANIFEST):
        return None
    with open(RODATA_MANIFEST, encoding="utf-8") as fh:
        return json.load(fh)


def generate():
    by_src = load_units()
    if by_src is None:
        return None, 0
    blobs = load_blob_manifest() or {}

    out = []
    expanded = 0
    seen = set()
    for line in awlib.read_lines(SRC_LDS):
        m = BLOB_RE.match(line)
        if m and m.group(2) + ".s" in blobs:
            indent, blob = m.group(1), m.group(2) + ".s"
            seq = blobs[blob]["seq"]
            out.append("%s/* data/%s -- %d piece(s), %d pool word(s) now "
                       "emitted by promoted C */\n"
                       % (indent, blob,
                          sum(1 for e in seq if e["kind"] == "asm"),
                          sum(1 for e in seq if e["kind"] == "c")))
            for e in seq:
                # A promoted unit's pool word is in .rodata whichever blob it
                # was carved out of, because that is the section agbcc emits it
                # into; the surviving blob pieces keep the blob's own section.
                sect = ".rodata" if e["kind"] == "c" else blobs[blob]["sect"]
                out.append("%s. = ALIGN(4); %s(%s)  /* %s */\n"
                           % (indent, e["obj"], sect, e["addr_hex"]))
            continue
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
        emitted_objs = set()
        for e in entries:
            obj = e.get("promoted")
            if obj:
                # This address range now comes from C. The object covers the
                # whole run, so emit it once however many functions it holds.
                if obj in emitted_objs:
                    continue
                emitted_objs.add(obj)
                out.append(f"{indent}{obj}(.text);  /* {len(e['functions'])} "
                           f"function(s), was {e['unit']} */\n")
            else:
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
