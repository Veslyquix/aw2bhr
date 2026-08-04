#!/usr/bin/env python3
"""Carve promoted units' `-fforce-addr` pool words out of data/rodata.s.

The problem this exists for
---------------------------
agbcc parks an address constant in the compiling unit's own `.rodata` when
`-fforce-addr` needs it live across a control-flow merge. In the original build
those words are the translation unit's OUTPUT. In this repo they arrive instead
as bytes in data/rodata.s, incbin'd straight out of the ROM, because every
function that owns one is still assembly.

So a function whose C reproduces the ROM exactly -- naming the global directly,
the way the original source did -- cannot be promoted: its object emits a 4-byte
`.rodata` word that has nowhere to live, and data/rodata.s is still supplying
the same 4 bytes from the ROM image. The workaround (naming the pool word and
dereferencing it) reaches the ROM's relocation but changes register allocation,
which is what holds several functions parked.

What this does
--------------
Splits data/rodata.s into pieces around the words that promoted C units now
emit, exactly as split_asm.py splits asm/*.s into per-function units: it READS
data/rodata.s and WRITES generated pieces under build/, and never modifies
data/ or asm/. gen_lds.py then interleaves the pieces with the C objects so each
word lands at the address the original build put it at.

Opt-in per promoted unit, via a `rodata` list of word addresses in
data/promoted.json. With no unit opting in this emits a single piece covering
the whole file and gen_lds.py leaves its line verbatim, so the build is
bit-identical to not running it at all.

    python tools/split_rodata.py [--check]
"""

import argparse
import json
import os
import re
import sys

import awlib

# The ROM blobs that currently supply agbcc's pool words. Each is a flat
# run of `.global`/label/`.incbin` triples, one per symbol, fully contiguous --
# which is what makes a per-symbol split exact. `sect` is the output-section
# name the linker script places that blob's pieces under; a promoted unit's word
# is always `.rodata` whichever blob it is carved out of, because that is the
# section agbcc emits it into.
#
# EXTEND THIS LIST when a promoted unit claims a word from a blob not named
# here -- data/ holds five blobs and this list is deliberately only the ones
# that have supplied a word so far. Wave 21 added rodata-0808F098.s for
# sub_0802CFFC's 0x08090C04 (`&gUnknown_030033E8`, a -fforce-addr constant).
# Add ONLY a blob that actually supplies a word: `blobs.mk` below emits every
# entry here as a replaced blob whether it was carved or not, and the failure
# mode for over-listing is megabytes silently dropped from the image.
SOURCES = [("rodata.s", ".rodata"), ("data.s", ".data"),
           ("rodata-0808F098.s", ".rodata")]
OUT_DIR = os.path.join(awlib.REPO, "build", "rodata")
MANIFEST = os.path.join(OUT_DIR, "units.json")
PROMOTED = os.path.join(awlib.DATA_DIR, "promoted.json")
BASEROM = os.path.join(awlib.REPO, "baserom.gba")

# ROM address of the first byte data/rodata.s covers; its incbin offsets are
# file offsets, and for this cart they are the low 25 bits of the address.
ROM_BASE = 0x08000000

CHUNK_RE = re.compile(
    r'^\s*\.incbin\s+"baserom\.gba",\s*(0x[0-9A-Fa-f]+),\s*(0x[0-9A-Fa-f]+)')
LABEL_RE = re.compile(r'^\s*(gUnknown_[0-9A-Fa-f]+):')


def read_chunks(src):
    """[(addr, size, [source lines])] in file order."""
    chunks, cur = [], None
    header = []
    for raw in awlib.read_lines(os.path.join(awlib.DATA_DIR, src)):
        m = CHUNK_RE.match(raw)
        if m:
            off, size = int(m.group(1), 16), int(m.group(2), 16)
            cur["addr"] = ROM_BASE + off
            cur["size"] = size
            cur["lines"].append(raw)
            chunks.append(cur)
            cur = None
            continue
        if LABEL_RE.match(raw) or raw.strip().startswith(".global"):
            if cur is None:
                cur = {"addr": None, "size": 0, "lines": []}
            cur["lines"].append(raw)
            continue
        if raw.strip() == "":
            continue          # re-emitted between chunks, so it need not be kept
        if cur is not None:
            cur["lines"].append(raw)
        else:
            header.append(raw)
    return header, chunks


def split_for_carves(carve, chunks):
    """Split any chunk that CONTAINS a carve address so the word stands alone.

    agbcc's -fforce-addr pool word does not have to sit at a label boundary in
    the original data. Wave 32 hit `0x0808DF94 is 1412 bytes, expected a 4-byte
    pool word`: sub_080114A0's word is the FIRST word of a 1,412-byte unlabelled
    blob, and the function -- verified byte-for-byte -- had to be backed out of
    the wave because the carve could not be expressed.

    Splitting is safe because a chunk is just an `.incbin` range: cutting it into
    [head][word][tail] re-emits exactly the same bytes in the same order. The
    label, if any, belongs to the chunk START and stays with whichever piece
    starts there -- the head, or the carved word itself when the word IS the
    first thing in the chunk, which is the case that prompted this. The tail is
    anonymous data nobody references by name.
    """
    out = []
    for c in chunks:
        hits = sorted(a for a in carve
                      if c["addr"] <= a < c["addr"] + c["size"])
        if not hits or c["size"] == 4:
            out.append(c)
            continue
        indent = re.match(r'(\s*)', c["lines"][-1]).group(1)

        def incbin(addr, size):
            return ('%s.incbin "baserom.gba", 0x%X, 0x%X\n'
                    % (indent, addr - ROM_BASE, size))

        pos = c["addr"]
        pre = c["lines"][:-1]           # labels/.global, minus the incbin line
        for a in hits:
            if a > pos:
                out.append({"addr": pos, "size": a - pos,
                            "lines": pre + [incbin(pos, a - pos)]})
                pre = []
            out.append({"addr": a, "size": 4, "lines": pre + [incbin(a, 4)]})
            pre = []
            pos = a + 4
        end = c["addr"] + c["size"]
        if pos < end:
            out.append({"addr": pos, "size": end - pos,
                        "lines": [incbin(pos, end - pos)]})
    return out


def load_carveouts():
    """{addr: obj} for every promoted unit that declares pool words."""
    if not os.path.exists(PROMOTED):
        return {}
    with open(PROMOTED, encoding="utf-8") as fh:
        entries = json.load(fh)
    out = {}
    for e in entries:
        for a in e.get("rodata", []):
            addr = int(a, 16) if isinstance(a, str) else a
            if addr in out:
                raise SystemExit("error: 0x%08X claimed by both %s and %s"
                                 % (addr, out[addr], e["obj"]))
            out[addr] = e["obj"]
    return out


def verify(carve, chunks, strict):
    """Each carved word must be 4 bytes and hold a plausible ROM address.

    Cheap, but it is the check that matters: if the word we are removing from
    the data blob is not the address constant the C unit re-emits, the ROM
    changes and the only symptom is a SHA mismatch 4,500 objects later.
    """
    by_addr = {c["addr"]: c for c in chunks}
    rom = open(BASEROM, "rb").read()
    for addr, obj in sorted(carve.items()):
        c = by_addr.get(addr)
        if c is None:
            if strict:
                raise SystemExit("error: 0x%08X (%s) is not a chunk boundary in "
                                 "any data blob" % (addr, obj))
            continue
        if c["size"] != 4:
            raise SystemExit("error: 0x%08X (%s) is %d bytes, expected a "
                             "4-byte pool word" % (addr, obj, c["size"]))
        val = int.from_bytes(rom[addr - ROM_BASE:addr - ROM_BASE + 4], "little")
        if not (0x02000000 <= val < 0x0A000000):
            # Wave 42: a unit's .rodata is not only address words. The wave-39
            # whole-section acceptance means a promoted list can carry string
            # literals and initialiser templates (sub_080281F0's holds "ON\0\0"
            # inside its { "OFF", "ON" } table), and trymatch byte-validated
            # every listed word against baserom before promote.py recorded it.
            # Accept a non-address word ONLY as part of that case: the same
            # unit must claim an adjacent word, i.e. it sits inside a
            # consecutive multi-word run. A LONE non-address word is still a
            # typo until proven otherwise, and the final oracle is unchanged
            # either way -- a wrong carve fails `make SPLIT=1 compare`.
            same_unit_neighbour = (carve.get(addr - 4) == obj
                                   or carve.get(addr + 4) == obj)
            if not same_unit_neighbour:
                raise SystemExit("error: 0x%08X (%s) holds 0x%08X, which is "
                                 "not an address and has no adjacent word in "
                                 "the same unit -- refusing to carve it"
                                 % (addr, obj, val))


def build(header, chunks, carve, stem):
    """Interleave: rodata pieces and promoted objects, in address order."""
    seq, piece, pieces = [], [], []

    def flush():
        if piece:
            start = piece[0]["addr"]
            name = "%s-%08X" % (stem, start)
            pieces.append((name, list(piece)))
            seq.append({"kind": "asm", "obj": "rodata/%s.o" % name,
                        "addr_hex": "0x%08X" % start,
                        "size": sum(c["size"] for c in piece)})
            del piece[:]

    # A unit with several force-addr'd symbols owns that many CONSECUTIVE words,
    # and its object must be placed ONCE covering the whole run -- agbcc emits
    # them as one .rodata section. Placing it per word would emit the section
    # once per word and overrun the next piece.
    i = 0
    while i < len(chunks):
        c = chunks[i]
        if c["addr"] in carve:
            flush()
            obj = carve[c["addr"]]
            run = [c]
            while (i + 1 < len(chunks) and carve.get(chunks[i + 1]["addr"]) == obj):
                i += 1
                run.append(chunks[i])
            claimed = sum(1 for a, o in carve.items() if o == obj)
            if claimed != len(run):
                raise SystemExit(
                    "error: %s claims %d pool words but only %d are consecutive "
                    "from 0x%08X -- agbcc emits one .rodata section per unit, so "
                    "the words it owns must be adjacent"
                    % (obj, claimed, len(run), c["addr"]))
            seq.append({"kind": "c", "obj": obj,
                        "addr_hex": "0x%08X" % c["addr"],
                        "size": sum(x["size"] for x in run)})
        else:
            piece.append(c)
        i += 1
    flush()

    files = {}
    for name, cs in pieces:
        body = list(header)
        for c in cs:
            body.append("\n")
            body.extend(c["lines"])
        files[name + ".s"] = "".join(body)
    return seq, files


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true",
                    help="verify the generated pieces are current")
    args = ap.parse_args()

    carve = load_carveouts()
    claimed, manifest, files, totals = set(), {}, {}, []

    for src, sect in SOURCES:
        stem = src[:-2]
        header, chunks = read_chunks(src)
        chunks = split_for_carves(carve, chunks)
        mine = {a: o for a, o in carve.items()
                if any(c["addr"] == a for c in chunks)}
        verify(mine, chunks, strict=True)
        claimed |= set(mine)
        seq, fs = build(header, chunks, mine, stem)
        manifest[src] = {"sect": sect, "seq": seq}
        files.update(fs)
        placed = sum(e["size"] for e in seq)
        total = sum(c["size"] for c in chunks)
        assert total == placed, (src, total, placed)
        totals.append((src, len(fs), len(mine), total))

    missing = set(carve) - claimed
    if missing:
        raise SystemExit("error: no data blob contains %s -- a promoted unit "
                         "claims a pool word that is in none of the blobs this "
                         "tool scans (%s).\nIf `grep` finds the address under "
                         "data/, the blob just needs adding to SOURCES; see the "
                         "note there."
                         % (", ".join("0x%08X" % a for a in sorted(missing)),
                            ", ".join(s for s, _ in SOURCES)))

    if args.check:
        if not os.path.exists(MANIFEST):
            print("FAIL build/rodata missing -- run tools/split_rodata.py")
            return 1
        with open(MANIFEST, encoding="utf-8") as fh:
            if json.load(fh) != manifest:
                print("FAIL build/rodata is stale -- re-run tools/split_rodata.py")
                return 1
        for name, text in files.items():
            q = os.path.join(OUT_DIR, name)
            if not os.path.exists(q) or open(q, encoding="utf-8").read() != text:
                print("FAIL %s is stale -- re-run tools/split_rodata.py" % name)
                return 1
        print("PASS build/rodata current (%d pieces, %d carved words)"
              % (len(files), len(carve)))
        return 0

    os.makedirs(OUT_DIR, exist_ok=True)
    for stale in os.listdir(OUT_DIR):
        if stale.endswith((".s", ".o", ".d")):
            os.remove(os.path.join(OUT_DIR, stale))
    for name, text in files.items():
        awlib.write_text(os.path.join(OUT_DIR, name), text)
    awlib.write_text(MANIFEST, json.dumps(manifest, indent=1) + "\n")

    # The Makefile must drop exactly the blobs replaced here from DATA_SRCS.
    # Emitted rather than hardcoded because getting it wrong in either
    # direction is silent: too few and the original blob is linked twice
    # (duplicate symbols), too many and megabytes of ROM data vanish from the
    # image with only a SHA mismatch to show for it.
    awlib.write_text(os.path.join(OUT_DIR, "blobs.mk"),
                     "SPLIT_BLOBS := %s\n"
                     % " ".join("data/%s" % s for s, _ in SOURCES))

    for src, npieces, ncarve, total in totals:
        print("data/%-10s -> %d piece(s), %d word(s) carved to C, %d bytes"
              % (src, npieces, ncarve, total))
    for src, _ in SOURCES:
        for e in manifest[src]["seq"]:
            if e["kind"] == "c":
                print("      %s -> %s" % (e["addr_hex"], e["obj"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
