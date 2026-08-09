#!/usr/bin/env python3
"""Find TWIN PAIRS: two UNMATCHED functions whose instruction streams are the
same shape, so deriving one hands you the other.

NOT THE SAME TOOL AS `tools/twin_screen.py` -- READ THIS BEFORE WRITING A THIRD.
They screen opposite directions of the same idea and both are live:

  twin_screen.py  unmatched -> MATCHED.  "Does this target have a finished twin
                  I can transcribe from?"  Wave 45. Nearly dry as of wave 50 --
                  one near-twin in the whole corpus.
  twin_pairs.py   unmatched <-> unmatched.  "Are two targets the same shape as
                  each other, so one derivation buys both?"  Wave 50/51. NOT
                  dry: 33 pairs, 41 functions, 13,200 bytes.

Wave 50 re-derived the wave-45 axis from scratch in a scratchpad script without
noticing `twin_screen.py` already existed, and wave 51 briefly overwrote it.
Grep `tools/` before adding a screen.

Validated in wave 50. Four pairs at >= 0.58 out of 111 candidates, and 7 of
their 8 functions matched -- one of them closing in a single `try_match` with
zero probes because its twin had already answered every decision.

THE RATIO IS A FILTER, NOT A RANK. Wave 50's lowest-scoring pair (0.678) went
2/2; its highest (0.893) went 1/2. A high ratio says the pair is REAL, not that
it is cheap. Do not sort your batch by it.

Wave 50 only ever scanned its own block-screen output -- 111 functions, at a
0.58 floor it never tested below. This tool scans the WHOLE unmatched corpus,
and prints what every filter excluded, because three separate defaults in
overlap_screen.py each hid most of the corpus for several waves before anyone
noticed (--min-size wave 27, --block-min-matched wave 28, --block-max wave 33).
A dry result here is a statement about THESE THRESHOLDS, not about the corpus.

Usage:
    python tools/twin_pairs.py                     # defaults, unmatched only
    python tools/twin_pairs.py --min-ratio 0.45    # the wave-51 rescan
    python tools/twin_pairs.py --include-parked
    python tools/twin_pairs.py --self-test
"""

import argparse
import difflib
import glob
import io
import json
import os
import re
import sys

import awlib

ASM_GLOB = os.path.join(awlib.REPO, "asm", "*.s")

_LINES = {}


def _load(path):
    if path not in _LINES:
        with io.open(path, encoding="utf-8", errors="replace") as fh:
            _LINES[path] = fh.read().splitlines()
    return _LINES[path]


def _index_bodies():
    """name -> list of raw body lines, for every thumb_func in asm/."""
    bodies = {}
    for path in sorted(glob.glob(ASM_GLOB)):
        cur = None
        acc = []
        for line in _load(path):
            s = line.strip()
            if s.startswith("thumb_func_start "):
                if cur:
                    bodies[cur] = acc
                cur = s.split()[1]
                acc = []
                continue
            if s.startswith("thumb_func_end "):
                if cur:
                    bodies[cur] = acc
                cur = None
                acc = []
                continue
            if cur is not None:
                acc.append(line.rstrip())
        if cur:
            bodies[cur] = acc
    return bodies


def insns(lines):
    out = []
    for line in lines:
        s = line.strip()
        if not s or s.startswith("@") or s.startswith(".") or s.endswith(":"):
            continue
        out.append(s.split("@")[0].strip())
    return out


def norm(s):
    """Erase what varies BETWEEN twins, keep what defines the shape.

    Labels and immediates go; mnemonics, operand count and register roles stay.
    Two functions that differ only in which globals they touch and which
    constants they compare against normalise to the same stream.
    """
    s = re.sub(r"_0[0-9A-F]{7}", "LBL", s)
    s = re.sub(r"\b0x[0-9a-fA-F]+\b", "#", s)
    s = re.sub(r"\b\d+\b", "#", s)
    return s.strip()


def show_pair(a, b):
    """Diff two functions' RAW assembly, alongside the normalised ratio.

    WHY THIS EXISTS. Wave 51's orchestrator read a pair's difference off the
    NORMALISED streams and briefed an agent that they differed by exactly one
    instruction, `bhi` vs `bne` -- concluding one relational operator. The raw
    assembly differed in TWO slots: `cmp #0x17 / bne` against `cmp #2 / bhi`.
    The predicate changed bound as well as sense, because norm() erases
    immediates BY DESIGN.

    A normalised "one instruction apart" means one instruction SLOT, and a slot
    can carry two independent changes. Never brief a pair off the normalised
    diff -- use this.
    """
    bodies = _index_bodies()
    missing = [n for n in (a, b) if n not in bodies]
    if missing:
        print("no thumb body in asm/ for: %s" % ", ".join(missing))
        return 1

    def lbl_only(s):
        """Erase LABEL NAMES only. Immediates and pool symbols stay.

        Two twins always sit at different addresses, so every local label and
        pool-slot name differs between them -- pure noise. Immediates are the
        opposite: they are exactly where a twin pair's real difference hides.
        This is the view to brief from.
        """
        return re.sub(r"_0[0-9A-F]{7}", "LBL", s).strip()

    ra, rb = insns(bodies[a]), insns(bodies[b])
    na, nb = [norm(i) for i in ra], [norm(i) for i in rb]
    la, lb = [lbl_only(i) for i in ra], [lbl_only(i) for i in rb]
    print("%s: %d insns   %s: %d insns   normalised ratio %.3f"
          % (a, len(ra), b, len(rb),
             difflib.SequenceMatcher(None, na, nb).ratio()))
    print("")
    print("DIFF with labels erased but IMMEDIATES INTACT -- brief from THIS:")
    n_raw = 0
    for tag, i1, i2, j1, j2 in difflib.SequenceMatcher(None, la, lb).get_opcodes():
        if tag == "equal":
            continue
        n_raw += 1
        print("  -- %s  %s[%d:%d]  %s[%d:%d]" % (tag, a, i1, i2, b, j1, j2))
        for v in la[i1:i2]:
            print("     %-14s %s" % (a + ":", v))
        for v in lb[j1:j2]:
            print("     %-14s %s" % (b + ":", v))
    if not n_raw:
        print("  (identical once labels are erased -- a pure address rename)")

    n_norm = sum(1 for t, _, _, _, _ in
                 difflib.SequenceMatcher(None, na, nb).get_opcodes()
                 if t != "equal")
    print("")
    print("hunks with immediates INTACT: %d   hunks with immediates ERASED: %d"
          % (n_raw, n_norm))
    if n_raw > n_norm:
        print("  ^ THE NORMALISATION IS HIDING %d HUNK(S) -- operand-only changes"
              " (immediates, pool symbols)." % (n_raw - n_norm))
        print("    Brief the RAW diff above, not the ratio.")
    return 0


def candidates(include_parked=False):
    with io.open(os.path.join(awlib.REPO, "data", "functions.json"),
                 encoding="utf-8") as fh:
        data = json.load(fh)
    fns = data["functions"] if isinstance(data, dict) else data
    keep, excluded = [], {"matched": 0, "asm-resident": 0, "parked": 0}
    for f in fns:
        st = f.get("status")
        if st == "matched":
            excluded["matched"] += 1
            continue
        if st == "asm-resident":
            excluded["asm-resident"] += 1
            continue
        if st == "parked" and not include_parked:
            excluded["parked"] += 1
            continue
        keep.append(f)
    return keep, excluded


def scan(args):
    fns, excluded = candidates(args.include_parked)
    bodies_raw = _index_bodies()

    streams = {}
    sizes = {}
    too_short = 0
    no_asm = 0
    for f in fns:
        name = f["name"]
        raw = bodies_raw.get(name)
        if raw is None:
            no_asm += 1
            continue
        st = [norm(i) for i in insns(raw)]
        if len(st) < args.min_insns:
            too_short += 1
            continue
        streams[name] = st
        sizes[name] = f.get("size", 0)

    names = sorted(streams)
    print("== TWIN-PAIR SCREEN ==")
    print("corpus: %d unmatched%s, %d with a usable stream"
          % (len(fns), " (parked INCLUDED)" if args.include_parked else "",
             len(names)))
    print("  excluded: %d matched, %d asm-resident, %d parked%s"
          % (excluded["matched"], excluded["asm-resident"], excluded["parked"],
             " (pass --include-parked)" if excluded["parked"] else ""))
    print("EXCLUDED BY --min-insns %d: %d function(s). EXCLUDED (no thumb body"
          " in asm/): %d." % (args.min_insns, too_short, no_asm))
    print("  A dry result below is a statement about THESE THRESHOLDS, not"
          " about the corpus.")
    print("length pre-filter --len-tol %.2f, ratio floor --min-ratio %.2f"
          % (args.len_tol, args.min_ratio))
    print("")

    pairs = []
    skipped_len = 0
    for i, a in enumerate(names):
        sa = streams[a]
        la = len(sa)
        for b in names[i + 1:]:
            sb = streams[b]
            lb = len(sb)
            if abs(la - lb) > args.len_tol * max(la, lb):
                skipped_len += 1
                continue
            sm = difflib.SequenceMatcher(None, sa, sb)
            if sm.real_quick_ratio() < args.min_ratio:
                continue
            if sm.quick_ratio() < args.min_ratio:
                continue
            r = sm.ratio()
            if r >= args.min_ratio:
                pairs.append((r, a, la, b, lb))

    pairs.sort(reverse=True)
    print("pairs >= %.2f: %d   (%d comparisons skipped by the length"
          " pre-filter)" % (args.min_ratio, len(pairs), skipped_len))

    involved = {}
    for r, a, _, b, _ in pairs:
        involved.setdefault(a, 0)
        involved.setdefault(b, 0)
        involved[a] += 1
        involved[b] += 1
    print("distinct functions involved: %d, %d bytes"
          % (len(involved), sum(sizes.get(n, 0) for n in involved)))
    print("")
    print("THE RATIO IS A FILTER, NOT A RANK -- wave 50's LOWEST pair went 2/2"
          " and its highest went 1/2.")
    print("Brief a pair self-verifyingly: derive one, transcribe the other; if"
          " the second does not")
    print("fall out immediately, your derivation of the first is wrong.")
    print("")

    for r, a, la, b, lb in pairs[:args.top]:
        print("  %.3f  %-16s %4dB %3d insns   %-16s %4dB %3d insns"
              % (r, a, sizes.get(a, 0), la, b, sizes.get(b, 0), lb))
    if len(pairs) > args.top:
        print("  (+%d more pair(s) NOT SHOWN -- re-run with --top %d)"
              % (len(pairs) - args.top, len(pairs)))

    if args.json:
        with io.open(args.json, "w", encoding="utf-8") as fh:
            json.dump([{"ratio": round(r, 4), "a": a, "b": b,
                        "a_size": sizes.get(a, 0), "b_size": sizes.get(b, 0)}
                       for r, a, _, b, _ in pairs], fh, indent=1)
        print("\nwrote %s" % args.json)
    return pairs


def self_test():
    """The three ways this screen could lie about the corpus."""
    ok = True

    bodies = _index_bodies()
    fns, _ = candidates(False)
    have = [f["name"] for f in fns if f["name"] in bodies][:40]

    # 1. A function is a perfect twin of itself. Guards norm()/insns() going
    #    non-deterministic, which would silently zero the whole screen.
    bad = []
    for n in have:
        st = [norm(i) for i in insns(bodies[n])]
        if st and difflib.SequenceMatcher(None, st, list(st)).ratio() != 1.0:
            bad.append(n)
    print("[self-test] a stream is identical to itself: %s (%d checked)"
          % ("PASS" if not bad else "FAIL " + ", ".join(bad[:3]), len(have)))
    ok = ok and not bad

    # 2. Lowering the ratio floor never LOSES a pair. This is the failure that
    #    hid most of the corpus behind overlap_screen.py's defaults three
    #    separate times -- a threshold that is not monotone is unreadable.
    class A(object):
        include_parked = False
        min_insns = 20
        len_tol = 0.42
        top = 0
        json = None

    hi, lo = A(), A()
    hi.min_ratio, lo.min_ratio = 0.70, 0.50
    import contextlib
    buf = io.StringIO()
    with contextlib.redirect_stdout(buf):
        ph = scan(hi)
        pl = scan(lo)
    sh = set((a, b) for _, a, _, b, _ in ph)
    sl = set((a, b) for _, a, _, b, _ in pl)
    lost = sh - sl
    print("[self-test] lowering --min-ratio never loses pairs: %s (%d -> %d)"
          % ("PASS" if not lost else "FAIL, lost " + str(sorted(lost)[:3]),
             len(sh), len(sl)))
    ok = ok and not lost

    # 3. norm() must erase immediates and labels but NOT mnemonics. If it ate
    #    the mnemonic, everything would look like a twin of everything.
    a = norm("ldr r0, =gUnknown_08001234")
    b = norm("ldr r0, =gUnknown_0899FFFF")
    c = norm("str r0, =gUnknown_08001234")
    detail = "erased=%s kept=%s" % (a == b, a != c)
    print("[self-test] norm() erases operands, keeps mnemonics: %s (%s)"
          % ("PASS" if (a == b and a != c) else "FAIL", detail))
    ok = ok and (a == b and a != c)

    print("[self-test] %s" % ("PASS" if ok else "FAIL"))
    return 0 if ok else 1


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--min-ratio", type=float, default=0.58,
                    help="similarity floor (wave 50 validated 0.58; it never"
                         " tested below)")
    ap.add_argument("--min-insns", type=int, default=20)
    ap.add_argument("--len-tol", type=float, default=0.42,
                    help="skip pairs whose lengths differ by more than this"
                         " fraction of the longer")
    ap.add_argument("--include-parked", action="store_true")
    ap.add_argument("--top", type=int, default=60)
    ap.add_argument("--json", default=None)
    ap.add_argument("--pair", nargs=2, metavar=("A", "B"),
                    help="RAW assembly diff of two functions. ALWAYS use this"
                         " before briefing a pair -- the ratio is computed on"
                         " normalised streams that erase immediates.")
    ap.add_argument("--self-test", action="store_true")
    args = ap.parse_args()
    if args.self_test:
        return self_test()
    if args.pair:
        return show_pair(args.pair[0], args.pair[1])
    scan(args)
    return 0


if __name__ == "__main__":
    sys.exit(main())
