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
import re
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


def symbol_addresses():
    """name -> final linked address, read from the last built ELF.

    Only used to resolve relocations, so a stale or missing ELF costs nothing
    beyond falling back to the plain symbol comparison.
    """
    if symbol_addresses.cache is not None:
        return symbol_addresses.cache
    syms = {}
    if os.path.exists(os.path.join(awlib.REPO, "aw2bhr.elf")):
        prefix = agbenv.makefile_var("PREFIX") or "arm-none-eabi-"
        rc, so, _ = agbenv.run('%snm "aw2bhr.elf"' % prefix)
        if rc == 0:
            for ln in so.splitlines():
                parts = ln.split()
                if len(parts) == 3:
                    try:
                        syms[parts[2]] = int(parts[0], 16)
                    except ValueError:
                        pass
    symbol_addresses.cache = syms
    return syms


symbol_addresses.cache = None


def sym_addr(name, syms):
    """Address of `name`, from the last ELF or from the name itself.

    `gen_lds.py` and the data blobs invent a `gUnknown_<addr>` symbol at exactly
    that address, so the name carries the answer. The fallback is not cosmetic:
    once a pool word is CARVED OUT of a data blob and emitted by promoted C
    instead (tools/split_rodata.py), the `gUnknown_<addr>` label goes with it and
    the symbol is absent from the split build's ELF entirely -- so a target
    relocation naming it could not be resolved at all, and every function in the
    class would silently fall back to "relocations differ".
    """
    if name in syms:
        return syms[name]
    m = re.fullmatch(r"gUnknown_(0[0-9A-F]{7})", name)
    return int(m.group(1), 16) if m else None


def section_relocs(obj_rel, section):
    """(offset, type, symbol) for relocations in one named section."""
    prefix = agbenv.makefile_var("PREFIX") or "arm-none-eabi-"
    rc, so, _ = agbenv.run('%sobjdump -r "%s"' % (prefix, obj_rel))
    if rc != 0:
        return []
    out, inside = [], False
    for ln in so.splitlines():
        s = ln.strip()
        if s.startswith("RELOCATION RECORDS FOR"):
            inside = "[%s]" % section in s
            continue
        if not inside or not s or s.startswith("OFFSET"):
            continue
        parts = s.split()
        if len(parts) >= 3:
            try:
                out.append((int(parts[0], 16), parts[1], parts[2]))
            except ValueError:
                pass
    return out


def pool_word_equivalent(cand_o, rodata_off, rom_addr):
    """True if the candidate's own `.rodata` word will hold the ROM's bytes.

    A draft that names a global directly the way the original source did makes
    agbcc park the address in THIS unit's `.rodata` (a `-fforce-addr` pool word),
    so its `.text` pool load relocates against the local section symbol while the
    original relocates against the `gUnknown_<addr>` that data/rodata.s or
    data/data.s supplies. Both link to the same byte once the build places the
    word at that address, which tools/split_rodata.py now does.

    The check is the substantive one rather than a name comparison: resolve what
    the candidate's `.rodata` word will contain, and require it to equal the word
    the ROM actually has at the address the original's code loads. If those agree
    then promoting with a `rodata` entry naming `rom_addr` reproduces the ROM.
    """
    rom_path = os.path.join(awlib.REPO, "baserom.gba")
    if not os.path.exists(rom_path) or not (0x08000000 <= rom_addr < 0x0A000000):
        return False
    rel = {o: (t, s) for o, t, s in section_relocs(cand_o, ".rodata")}
    if rodata_off not in rel:
        return False
    typ, sym = rel[rodata_off]
    if typ != "R_ARM_ABS32":
        return False
    name, extra = _split_sym(sym)
    base = sym_addr(name, symbol_addresses())
    if base is None:
        return False
    prefix = agbenv.makefile_var("PREFIX") or "arm-none-eabi-"
    out_rel = "build/probe/_cand_rodata.bin"
    os.makedirs(os.path.join(awlib.REPO, "build", "probe"), exist_ok=True)
    rc, _, _ = agbenv.run('%sobjcopy -O binary --only-section=.rodata "%s" "%s"'
                          % (prefix, cand_o, out_rel))
    if rc != 0:
        return False
    data = open(os.path.join(awlib.REPO, out_rel.replace("/", os.sep)), "rb").read()
    if rodata_off + 4 > len(data):
        return False
    value = base + extra + int.from_bytes(
        data[rodata_off:rodata_off + 4], "little")
    with open(rom_path, "rb") as fh:
        fh.seek(rom_addr - 0x08000000)
        rom_word = int.from_bytes(fh.read(4), "little")
    return value == rom_word


pool_word_equivalent.needed = []


def reloc_equivalent(tgt_fn, cand_fn, t_rel, c_rel, cand_o=None):
    """True if the two sides differ only in which symbol names the same address.

    asm/ is disassembled output, so a pool word holding an address gets
    symbolized as whichever symbol happens to sit at that address. A candidate
    spelling the same address as `base + N` emits a different symbol with the
    difference carried in the inline addend -- ARM .text uses REL, so the addend
    lives in the data word. Both link to the identical byte, but comparing
    symbol names alone calls it a mismatch.

    sub_08011B34 is the case that found this: the original's pool word relocates
    against gUnknown_03000040 with addend 0, the candidate's against
    gUnknown_03000000 with addend 0x40, and 0x03000000 + 0x40 == 0x03000040.
    It was rejected at 39 of 40 bytes despite producing an identical ROM.

    Deliberately strict: same offsets, same types, ABS32 only, both symbols
    known, and every differing byte must fall inside a relocation site.
    """
    if t_rel is None or c_rel is None or len(tgt_fn) != len(cand_fn):
        return False
    if len(t_rel) != len(c_rel) or not t_rel:
        return False

    syms = symbol_addresses()
    sites = []
    for (t_off, t_typ, t_sym), (c_off, c_typ, c_sym) in zip(t_rel, c_rel):
        if t_off != c_off or t_typ != c_typ:
            return False
        if t_typ != "R_ARM_ABS32":
            # Only a literal-pool word can carry an addend difference. Anything
            # else -- in practice a `bl`'s R_ARM_THM_CALL -- has to name the
            # identical symbol, and its bytes are then compared like any other
            # non-relocation bytes by the loop below.
            #
            # This used to `return False` outright, which made the whole check
            # unreachable for any function containing a call: the ABS32 pool
            # words were never examined because the `bl` was rejected first.
            # sub_08011B34, the case this was written for, is a leaf, so the
            # hole survived until family F049 in wave 15 hit it -- four
            # functions reported at 99.1% with one differing byte, all four
            # instruction-for-instruction identical and linking to the same
            # ROM.
            if t_sym != c_sym:
                return False
            continue
        t_name, t_extra = _split_sym(t_sym)
        c_name, c_extra = _split_sym(c_sym)
        if t_off + 4 > len(tgt_fn):
            return False
        t_base = sym_addr(t_name, syms)
        if t_base is None:
            return False
        t_addr = t_base + t_extra + int.from_bytes(
            tgt_fn[t_off:t_off + 4], "little")

        # The candidate parked the address in its OWN .rodata -- a -fforce-addr
        # pool word, which is what the original source's spelling produces. The
        # section symbol has no address of its own, so resolve the word's
        # contents against the ROM instead. Requires the build to place that
        # .rodata at t_addr, which is a `rodata` entry in data/promoted.json;
        # see tools/split_rodata.py.
        if c_name == ".rodata" and cand_o is not None:
            rodata_off = c_extra + int.from_bytes(
                cand_fn[c_off:c_off + 4], "little")
            if not pool_word_equivalent(cand_o, rodata_off, t_addr):
                return False
            pool_word_equivalent.needed.append((t_addr, rodata_off))
            sites.append(t_off)
            continue

        c_base = sym_addr(c_name, syms)
        if c_base is None:
            return False
        c_addr = c_base + c_extra + int.from_bytes(
            cand_fn[c_off:c_off + 4], "little")
        if t_addr != c_addr:
            return False
        sites.append(t_off)

    for i, (a, b) in enumerate(zip(tgt_fn, cand_fn)):
        if a != b and not any(off <= i < off + 4 for off in sites):
            return False
    return True


def _split_sym(field):
    """objdump prints `sym` or `sym+0xN`; return (name, extra)."""
    name, _, rest = field.partition("+")
    try:
        return name, int(rest, 16) if rest else 0
    except ValueError:
        return name, 0


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


def record_best(workdir, name, pct):
    """Keep the highest-scoring candidate seen, beside the current one.

    An iteration that scores worse overwrites the source that scored better, so
    without this the best attempt is simply lost -- one agent reported reaching
    88.2% and left a 25% regression behind it, with no way back. best.c is never
    read by the build; it exists so a handoff starts from the best known point
    rather than the last one.
    """
    meta = os.path.join(workdir, "best.json")
    prev = -1.0
    if os.path.exists(meta):
        try:
            with open(meta, encoding="utf-8") as fh:
                prev = json.load(fh).get("percent", -1.0)
        except (ValueError, OSError):
            prev = -1.0
    if pct <= prev:
        print("  best so far: %.1f%% (kept in best.c)" % prev)
        return
    src = os.path.join(workdir, name + ".c")
    awlib.write_text(os.path.join(workdir, "best.c"),
                     "".join(awlib.read_lines(src)))
    awlib.write_text(meta, json.dumps({"percent": round(pct, 2)}) + "\n")
    print("  new best: %.1f%% (saved to best.c)" % pct)


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
    rc, so, se = agbenv.compile_c("work/%s/%s.c" % (fn, fn), cand_o, fn=fn)
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
    pool_word_equivalent.needed = []
    t_rel = relocations(unit_o, offset, offset + size)
    c_rel = relocations(cand_o, 0, size)
    equivalent = False

    if same:
        if t_rel is not None and c_rel is not None and t_rel != c_rel:
            if reloc_equivalent(tgt_fn, cand_fn, t_rel, c_rel, cand_o):
                equivalent = True
            else:
                same = False
                print("  bytes: match, but relocations differ")
                for side, rels in (("original ", t_rel), ("candidate", c_rel)):
                    for r in rels[:8]:
                        print("    %s +0x%03x %-18s %s" % (side, r[0], r[1], r[2]))
        else:
            print("  relocs: match")
    elif len(cand) == size and reloc_equivalent(tgt_fn, cand_fn, t_rel, c_rel, cand_o):
        same = equivalent = True

    if same:
        if equivalent:
            print("  relocs: name different symbols that resolve to the same"
                  " address")
            for (t_off, _, t_sym), (_, _, c_sym) in zip(t_rel, c_rel):
                if t_sym != c_sym:
                    print("    +0x%03x  original %s  candidate %s"
                          % (t_off, t_sym, c_sym))
        # A match resting on a `-fforce-addr` pool word is conditional on the
        # build PLACING that word, and the verdict must say so: promoting
        # without the `rodata` entry drops the word or shifts every address
        # after it, and the failure would land in the build rather than here.
        if pool_word_equivalent.needed:
            words = sorted({a for a, _ in pool_word_equivalent.needed})
            print("  NOTE: this match needs its .rodata pool word(s) PLACED.")
            print("        Add to this function's data/promoted.json entry:")
            print('          "rodata": [%s]'
                  % ", ".join('"0x%08X"' % a for a in words))
            print("        then re-run tools/split_rodata.py and "
                  "tools/gen_lds.py before building.")
            print("\nMATCH -- links to identical bytes. The pool word is the"
                  " same address\n  spelled against a different symbol, which"
                  " is a disassembly artefact,\n  not a difference in the ROM.")
        else:
            print("\nMATCH -- byte-for-byte identical to the original")
        return 0

    n_diff = sum(1 for a, b in zip(tgt_fn, cand_fn) if a != b)
    common = min(len(tgt_fn), len(cand_fn))
    pct = (common - n_diff) / size * 100 if size else 0
    print("  bytes: %d of %d differ  (%.1f%% identical)" % (n_diff, common, pct))
    record_best(workdir, name, pct)
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
