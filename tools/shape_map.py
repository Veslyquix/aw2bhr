#!/usr/bin/env python3
"""Pairwise normalised-shape similarity across the unmatched straight-line band.

Wave 17 established this as the first cost metric that ordered a batch
correctly IN ADVANCE, and it is cheap -- about a minute over the whole band:

    ratio | outcome
    0.960 | matched in two compiles (second function was transcription)
    0.937 | matched, one try_match each
    0.750 | matched, one try_match each
    0.276 | still open at +4, despite an IDENTICAL callee set, the same
          | subsystem and the same globals as the 0.960 pair

Size, callee count, new-symbol count and the index's own `difficulty` field
all order that batch wrong. `.LC` word count (tools/lc_screen.py) is a
necessary condition, not a sufficient one -- wave 17's three zero-scoring
functions cost 2, 45 and 55+ compiles, and the one that ordered them was this.

Why families.py does not already find these: its exact tier requires an
IDENTICAL normalised shape, and its fuzzy tier is capped by FUZZY_MAX_LEN_DELTA
and MIN_FUZZY_INSNS, which the large band exceeds. The pairs here are real
anyway -- 0.960 means ~250 of 261 instructions align.

Expect the list to be SHORT. Only two pairs in the whole band exceeded 0.80 in
wave 17. Batch the wave around what it finds rather than hunting for more.

    python tools/shape_map.py                 # the .LC-free band, pairs >= 0.60
    python tools/shape_map.py --all           # ignore the .LC-free filter
    python tools/shape_map.py --min 0.5       # widen the threshold
    python tools/shape_map.py sub_08027B68    # what pairs with one function
"""
import argparse
import collections
import difflib
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import awlib
import families
import lc_screen

# Below this the "shape" is coincidence -- wave 17's 0.276 pair shared a callee
# set, a subsystem and a global list, and was still an unrelated function.
MIN_RATIO = 0.60
# Two functions whose lengths differ by more than this are not one shape.
MAX_LEN_DELTA = 0.45
MIN_SIZE = 256


def band(scr, recs, lc_free_only=True):
    out = []
    for f in recs:
        if f["status"] != "asm" or f["mode"] != "THUMB":
            continue
        if f["backward_branches"] or f["size"] < MIN_SIZE:
            continue
        if lc_free_only and scr.split(f)[0]:
            continue
        out.append(f)
    return out


def pairs(names, sigs, min_ratio):
    found = []
    for i, a in enumerate(names):
        sa = sigs[a]
        for b in names[i + 1:]:
            sb = sigs[b]
            if abs(len(sa) - len(sb)) > MAX_LEN_DELTA * max(len(sa), len(sb)):
                continue
            r = difflib.SequenceMatcher(None, sa, sb).ratio()
            if r >= min_ratio:
                found.append((r, a, b))
    found.sort(reverse=True)
    return found


def clusters(names, found):
    """Connected components over the surviving pairs."""
    par = {n: n for n in names}

    def find(x):
        while par[x] != x:
            par[x] = par[par[x]]
            x = par[x]
        return x

    for _, a, b in found:
        ra, rb = find(a), find(b)
        if ra != rb:
            par[ra] = rb
    comp = collections.defaultdict(list)
    for n in names:
        comp[find(n)].append(n)
    return [sorted(ms) for ms in comp.values() if len(ms) > 1]


def main(argv=None):
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="*", help="restrict output to these functions")
    ap.add_argument("--min", type=float, default=MIN_RATIO)
    ap.add_argument("--all", action="store_true",
                    help="include functions carrying .LC pool words")
    args = ap.parse_args(argv)

    recs = lc_screen.load()
    scr = lc_screen.Screen(recs)
    by = {f["name"]: f for f in recs}

    objs = {}
    for af in awlib.load_all():
        for fn in af.funcs:
            objs[fn.name] = fn

    members = band(scr, recs, lc_free_only=not args.all)
    names = sorted(f["name"] for f in members if f["name"] in objs)
    sigs = {n: families.signature(objs[n])[0] for n in names}

    print("band: %d funcs, %d bytes  (>=%dB, straight-line%s)"
          % (len(names), sum(by[n]["size"] for n in names), MIN_SIZE,
             "" if args.all else ", .LC-free"))

    found = pairs(names, sigs, args.min)
    if args.name:
        want = set(args.name)
        found = [p for p in found if p[1] in want or p[2] in want]
    print("pairs >= %.2f: %d\n" % (args.min, len(found)))
    for r, a, b in found:
        print("  %.3f  %-16s %4dB   %-16s %4dB"
              % (r, a, by[a]["size"], b, by[b]["size"]))

    if not args.name:
        cs = clusters(names, found)
        if cs:
            print("\nclusters, largest first:")
            for ms in sorted(cs, key=lambda m: -sum(by[x]["size"] for x in m)):
                print("  %5dB  %s"
                      % (sum(by[x]["size"] for x in ms),
                         " ".join("%s(%d)" % (x, by[x]["size"]) for x in ms)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
