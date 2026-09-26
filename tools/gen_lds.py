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


def o1_dead_rodata_objects(by_src):
    """Promoted objects whose functions carry an -O1 override.

    WAVE 60. agbcc at -O1 emits its address-constant pool as `.LC` words in
    .rodata AND builds the .text minipools it actually uses, leaving the
    .rodata copy with ZERO references -- measured on sub_0808AB8C: seven `.LC`
    labels defined, none referenced, the body loading from .text pools `.L8`
    and `.L10` instead. Nothing carves that section, so it gets no placement
    from this script and the linker drops it just past the end of the image.

    The symptom is a ROM that is byte-identical everywhere and 108 bytes LONG,
    which reads exactly like the wave-20 "forgot to run split_rodata.py"
    failure and is NOT that -- there, every differing word pointed at
    0x08800000+N; here nothing differs at all.

    Scoped to -O1 units on purpose. A blanket `/DISCARD/ { *(.rodata) }` would
    also swallow a future promoted file with LIVE .rodata that nobody recorded,
    turning a loud build failure into a silently wrong ROM.
    """
    try:
        import agbenv
        ov = agbenv.compiler_overrides()
    except Exception:
        return []
    objs = set()
    for entries in by_src.values():
        for e in entries:
            obj = e.get("promoted")
            if not obj:
                continue
            for fn in e.get("functions", ()):
                o = ov.get(fn)
                if o and "-O1" in (o.get("cflags_add") or ()):
                    objs.add(obj)
                    break
    return sorted(objs)


# e.g. "\t\t/* SPLIT_RAM_OBJ: src/proc.o(ewram_data)"
RAM_OBJ_START_RE = re.compile(
    r'^(\s*)/\* SPLIT_RAM_OBJ:\s*(\S+)\(([.\w]+)\)')
RAM_OBJ_END_RE = re.compile(r'END_SPLIT_RAM_OBJ')
RAM_OBJ_ADDR_RE = re.compile(r'\.\s*=\s*(0x[0-9A-Fa-f]+)\s*;')


def expand_split_ram_objs(lines):
    """Swap a base-build RAM placeholder block for the real object under SPLIT.

    src/decomp/*.c never declares its own RAM storage -- every global it
    touches is already an `extern` into a symbol the base build's aw2bhr.lds
    places by address (the giant `. = ADDR; NAME = .;` list in EWRAM/IWRAM).
    A file promoted directly under src/ (design.c, proc.c, ...) can instead be
    the ORIGINAL definition of an EWRAM_DATA/IWRAM_DATA global -- proc.c's
    sProcArray is one -- and the base build still needs SOME placeholder for
    it there, since it has no C at all. Under SPLIT=1 the promoted file really
    is compiled, so its own `ewram_data`/`.bss` section is the authoritative
    definition; keeping the placeholder too would double-define every symbol
    in it (or, discarded, leave the object's own surviving sections referring
    to a symbol GNU ld now considers undefined -- "referenced ... defined in
    discarded section").

    A `SPLIT_RAM_OBJ: OBJ(SECTION)` marker comment through a matching
    `END_SPLIT_RAM_OBJ` marks exactly one such placeholder block; this
    replaces the whole span with `. = ALIGN(4); OBJ(SECTION);` so the promoted
    object supplies it instead. Base aw2bhr.lds keeps the placeholder verbatim
    -- this only runs when building aw2bhr.split.lds.
    """
    out = []
    i = 0
    n = 0
    while i < len(lines):
        m = RAM_OBJ_START_RE.match(lines[i])
        if not m:
            out.append(lines[i])
            i += 1
            continue
        indent, obj, sect = m.group(1), m.group(2), m.group(3)
        j = i + 1
        addr = None
        while j < len(lines) and not RAM_OBJ_END_RE.search(lines[j]):
            if addr is None:
                am = RAM_OBJ_ADDR_RE.search(lines[j])
                if am:
                    addr = am.group(1)
            j += 1
        if j >= len(lines):
            print("error: SPLIT_RAM_OBJ marker for %s(%s) has no matching "
                  "END_SPLIT_RAM_OBJ" % (obj, sect))
            return None, 0
        if addr is None:
            print("error: SPLIT_RAM_OBJ marker for %s(%s) has no `. = ADDR;` "
                  "line to anchor the real object's placement" % (obj, sect))
            return None, 0
        # The placeholder block's own leading `. = ADDR;` is the object's real
        # start address -- without re-asserting it here, the object would
        # instead land wherever the PRECEDING placeholder line left the
        # location counter (measured: it is not the same address).
        out.append("%s. = %s;\n" % (indent, addr))
        out.append("%s. = ALIGN(4); %s(%s);\n" % (indent, obj, sect))
        n += 1
        i = j + 1
    return out, n


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
                # A "c" piece defaults to .rodata (agbcc's -fforce-addr pool
                # words always land there regardless of the source blob's own
                # section), but split_rodata.py's dict-form carve entries can
                # override it per address -- e.g. a CONST_DATA table that
                # agbcc places in .data instead.
                sect = e.get("sect", ".rodata") if e["kind"] == "c" else blobs[blob]["sect"]
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

    out, n_ram = expand_split_ram_objs(out)
    if out is None:
        return None, 0
    if n_ram:
        print("      swapped %d SPLIT_RAM_OBJ placeholder block(s) for the "
              "real object" % n_ram)

    text = "".join(out)

    dead = o1_dead_rodata_objects(by_src)
    if dead:
        cut = text.rstrip().rfind("}")
        block = ["\n\t/* -O1 dead .LC pools -- unreferenced; see"
                 " o1_dead_rodata_objects() */\n",
                 "\t/DISCARD/ :\n\t{\n"]
        block += ["\t\t%s(.rodata)\n" % o for o in dead]
        block.append("\t}\n")
        text = text[:cut] + "".join(block) + text[cut:]
        print("      discarding dead -O1 .rodata from %d object(s): %s"
              % (len(dead), ", ".join(os.path.basename(o) for o in dead)))

    return text, expanded


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
