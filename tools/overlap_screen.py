#!/usr/bin/env python3
"""Rank unmatched functions by their proximity to an ALREADY-MATCHED one.

Every band screen this project has run filtered on `size >= 256 &&
backward_branches == 0`. Wave 20 (W20-C) found that floor was wrong: the 0x08052
sprite block holds five matched exemplars interleaved with seven unmatched
siblings at 144-256 bytes, and no band screen ever showed it. Size was never the
right floor -- EXEMPLAR PROXIMITY is, and it is cheap to measure.

Two measurements, both off `calls` in data/functions.json, plus one off the
assembly itself:

  overlap    |shared callees| and the Jaccard ratio between an unmatched
             function and every matched one. `calls` is invariant to inserted
             code, which is why wave 19 could batch on it where a normalised
             shape string scored the same pair 0.366.

  duplicate  the normalised instruction stream, label names erased. Two
             functions with the same stream have the SAME C body -- match one
             and the other is transcription. This is the highest-value thing
             the screen finds and it costs one pass over asm/.

  cluster    unmatched functions that share a matched exemplar, plus every
             unmatched function that is itself close to one of them. That is
             the unit a wave can be batched on.

    python tools/overlap_screen.py                 # the standard report
    python tools/overlap_screen.py --min-size 96 --min-shared 4 --min-j 0.6
    python tools/overlap_screen.py --self-test     # the wave-20 acceptance test

`--self-test` re-derives the 0x08052 cluster with no knowledge of it: it
requires sub_08052650/sub_08052AF4 to come back as a byte-identical pair and
sub_08052718/sub_08052BBC to come back grouped with the matched sub_08051BEC
and sub_08051F4C. A screen that cannot rediscover a cluster we know is real is
not finding the ones we do not.
"""

import argparse
import bisect
import collections
import hashlib
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import awlib

ASM_DIR = os.path.join(awlib.REPO, "asm")
LOCAL_LABEL = re.compile(r"\b_0[0-9A-F]{7}\b")
POOL_LINE = re.compile(r"^_0[0-9A-F]{7}: \.4byte (\S+)")
START = re.compile(r"^\s*(?:thumb|arm)_func_start (\S+)")


def load_index():
    with open(os.path.join(awlib.DATA_DIR, "functions.json"),
              encoding="utf-8") as fh:
        return json.load(fh)


def apply_pending(recs):
    """Promote in-memory anything trymatch has already matched but that has not
    been promoted yet, and return the names.

    THIS SCREEN GOES STALE EVERY WAVE and that is the whole reason the flag
    exists. Its output is a function of the MATCHED SET, so a wave that adds 30
    exemplars invalidates the previous wave's list -- most sharply the duplicate
    section, whose headline ("no unmatched function is a byte-identical twin of
    a matched one") can flip the moment a new exemplar lands. `data/functions.json`
    only learns about a match at promotion time, which is after the wave ends,
    so a screen run inside a wave sees the state the wave STARTED in.
    `work/<fn>/_cand.bin` and `_target.bin` are what trymatch wrote on its last
    run; byte-equal means that draft matched. Regenerating the list is a
    PRE-FLIGHT step for the next wave, not a wave-end one.
    """
    units_path = os.path.join(awlib.REPO, "build", "functions", "units.json")
    if not os.path.exists(units_path):
        return []
    with open(units_path, encoding="utf-8") as fh:
        units = json.load(fh)
    base = {}
    for u in units:
        for fn in u["functions"]:
            base[fn] = int(u["addr_hex"], 16)

    pending = []
    for r in recs:
        if r["status"] != "asm" or r["name"] not in base:
            continue
        d = os.path.join(awlib.REPO, "work", r["name"])
        a = os.path.join(d, "_cand.bin")
        b = os.path.join(d, "_target.bin")
        if not (os.path.exists(a) and os.path.exists(b)):
            continue
        cand = open(a, "rb").read()
        tgt = open(b, "rb").read()
        off = r["addr"] - base[r["name"]]
        # `_target.bin` is the whole SPLIT UNIT's .text, `_cand.bin` only the
        # candidate's -- comparing the files whole is wrong for any unit that
        # holds more than one function, which is most of them.
        if off < 0 or len(cand) != r["size"]:
            continue
        if tgt[off:off + r["size"]] == cand:
            r["status"] = "matched"
            pending.append(r["name"])
    return pending


def drop_hub_callees(recs, max_fanin):
    """Delete ubiquitous callees from every `calls` set, in place.

    Measured in wave 20: the top cluster the raw metric returns is 17 functions
    and 7,476 bytes across three subsystems, and the callees ALL of them share
    are `Div` and `SetObjAffine` -- called by 137 and 67 functions each. A
    library helper carries no family information, so a Jaccard built on it
    reports a family that is not there. Dropping callees above the threshold is
    a plain IDF cut and it is what makes the clusters takeable.
    """
    if not max_fanin:
        return set()
    fan = collections.Counter()
    for r in recs:
        for c in set(r["calls"]):
            fan[c] += 1
    hubs = set(c for c, n in fan.items() if n > max_fanin)
    for r in recs:
        r["calls"] = [c for c in r["calls"] if c not in hubs]
    return hubs


def asm_bodies():
    """{name: (instruction tuple, pool-word tuple)} for every function in asm/."""
    out = {}
    for fname in sorted(os.listdir(ASM_DIR)):
        if not fname.endswith(".s"):
            continue
        path = os.path.join(ASM_DIR, fname)
        cur = None
        insns = []
        pool = []
        with open(path, encoding="utf-8", errors="replace") as fh:
            for line in fh:
                m = START.match(line)
                if m:
                    if cur:
                        out[cur] = (tuple(insns), tuple(pool))
                    cur, insns, pool = m.group(1), [], []
                    continue
                if cur is None:
                    continue
                t = line.split("@")[0].strip()
                if not t:
                    continue
                mp = POOL_LINE.match(t)
                if mp:
                    pool.append(mp.group(1))
                    continue
                if t.endswith(":") or t.startswith("."):
                    continue
                insns.append(LOCAL_LABEL.sub("L", t))
        if cur:
            out[cur] = (tuple(insns), tuple(pool))
    return out


def digest(parts):
    return hashlib.sha1("\n".join(parts).encode()).hexdigest()[:12]


def duplicates(recs, bodies):
    """Groups of functions whose instruction streams are identical.

    Two digests per function.  `strict` keeps the pool words' symbol NAMES;
    `loose` replaces each with its slot index, so two siblings whose only
    difference is which `gUnknown_` a private -fforce-addr word names still
    group.  Report both -- strict is a certainty, loose is a lead.
    """
    strict = collections.defaultdict(list)
    loose = collections.defaultdict(list)
    for r in recs:
        body = bodies.get(r["name"])
        if not body or len(body[0]) < 4:
            continue
        insns, pool = body
        strict[digest(list(insns) + ["POOL"] + list(pool))].append(r)
        loose[digest(list(insns) + ["POOL"] + ["#%d" % i
                                               for i in range(len(pool))])
              ].append(r)
    return ({k: v for k, v in strict.items() if len(v) > 1},
            {k: v for k, v in loose.items() if len(v) > 1})


def overlaps(targets, matched, min_shared, min_j):
    """[(target, exemplar, |shared|, J)] over the threshold, best first."""
    pairs = []
    for t in targets:
        ct = set(t["calls"])
        if len(ct) < min_shared:
            continue
        for m in matched:
            cm = set(m["calls"])
            if len(cm) < min_shared:
                continue
            shared = ct & cm
            if len(shared) < min_shared:
                continue
            j = len(shared) / float(len(ct | cm))
            if j < min_j:
                continue
            pairs.append((t, m, len(shared), j))
    pairs.sort(key=lambda p: (-p[2], -p[3]))
    return pairs


def dataref_neighbours(targets, matched, min_shared):
    """Unmatched functions whose `data_refs` are a SUBSET of a matched one's.

    This is the axis the callee-set screen is blind to, and it is the axis the
    wave-20 W20-C batch actually lived on. sub_08052358 has ONE callee, so
    `|shared callees| >= 4` can never see it -- but its four data_refs are a
    strict subset of the matched sub_08052154's, every type it needed was
    already declared, and it matched on the first attempt. A subset means the
    exemplar's type model covers the target completely: no new struct, no new
    global, no new prototype.

    TWO DEFECTS FIXED IN WAVE 20 (found by W20-A, fixed here):

    1. `matched` used to be filtered `status == "matched" and r["calls"]`. That
       guard belongs to the CALLEE axis -- this function never looks at `calls`
       -- and it silently excluded every matched LEAF, 596 of them, from ever
       being a data_refs exemplar. It is why sub_08075368 was reported as "57%
       of sub_08076494" when its four refs are in fact EQUAL to those of three
       different matched functions the screen could not see.
    2. The reported degree, `len(target_refs) / len(exemplar_refs)`, was
       PRESENTED as a percentage "of" the exemplar and read as coverage. That
       reading carries no information: coverage is 100% by construction, since
       this axis only reports subsets. The number is gone.

       IT WAS NOT, HOWEVER, ANTI-CORRELATED, and the proposal to rank by the
       exemplar's SIZE instead is inverted. That degree is maximised by the
       exemplar whose vocabulary is CLOSEST to the target's, which is the right
       one to read: an exemplar using the target's four globals and nothing
       else is about the same thing. Measured against the two functions this
       axis actually produced in wave 20:

           sub_08052358   5 covering exemplars, sub_08052154 was the one read
                          tightest-first rank 1,  widest-first rank 5
           sub_08050134  11 covering exemplars, sub_08052154 was the one read
                          tightest-first rank 1,  widest-first rank 11

       Widest-first puts the exemplar an agent actually used LAST in both
       cases, because the widest cover of any small ref set is whatever large
       function happens to touch those globals among dozens -- sub_0801258C
       covers sub_08075368's four refs among its own 88, and covers 24 other
       targets the same way. Selection therefore stays tightest-first; what
       changed is that the ratio is no longer printed as though it measured
       coverage.

       Printed instead: the number of refs covered, the TIGHTEST exemplar with
       its own ref count so the fit is visible, and HOW MANY distinct matched
       functions cover the target -- the last of these new, exposed by the leaf
       fix, and the one that separates a lucky pairing from a vocabulary that
       is thoroughly worked out.

    THE TIE-BREAK WAS WRONG, AND WAVE 21 (W21-C) MEASURED IT. Ref-count
    minimality is the right PRIMARY key -- it is the subset guarantee -- but it
    ties constantly, and the tie was broken by `m["size"]` ASCENDING, i.e. by
    preferring the smallest covering exemplar. Smallest means "does least",
    which means "demonstrates fewest of the operations the target performs".

    The controlled case: sub_08012358 (36 B) and sub_08085F40 (80 B) have
    IDENTICAL data_refs -- {gUnknown_03001FFC, gUnknown_03002020,
    gUnknown_03002B28, gUnknown_030030E0} -- and both are zero-call leaves, so
    they tie on every key the screen had except size, and the smallest-first
    tie-break named sub_08012358 for twelve targets. sub_08012358's entire body
    is four zero stores. Against the four 96-116 B targets W21-C took on that
    exact ref set it supplied NOTHING beyond "these globals are declared", and
    it is worse than uninformative: it writes `gUnknown_030030E0.raw = 0`, and
    the union `.raw` spelling is precisely the one that FAILS on any target
    performing a read-modify-write (it drags a live zero into a spurious `orr`
    and costs a register -- see c_08085F40.c). sub_08085F40, the exemplar the
    old tie-break ranked second, is the one that carried the whole batch.

    So the tie-break is now PROXIMITY: closest in size, then closest in callee
    count. On those four targets |dsize| to sub_08085F40 is 16-36 and to
    sub_08012358 is 60-80, so proximity picks the useful one every time. This
    does NOT reinstate the widest-first proposal rejected above: the primary key
    is still minimal ref count, and "nearest" is bounded on both sides where
    "widest" was not.

    `nearest` is also reported separately -- the best covering exemplar by
    proximity ALONE, ignoring ref count -- and printed only when it differs from
    `tightest`. Reporting both is cheap and loses nothing; where they disagree,
    that disagreement is itself the signal that the tightest cover is a
    vocabulary match rather than a shape match.
    """
    out = []
    for t in targets:
        dt = set(t["data_refs"])
        if len(dt) < min_shared:
            continue
        covering = [m for m in matched if dt <= set(m["data_refs"])]
        if not covering:
            continue

        def proximity(m):
            return (abs(m["size"] - t["size"]),
                    abs(len(m["calls"]) - len(t["calls"])),
                    m["name"])

        tightest = min(covering, key=lambda m: (len(m["data_refs"]),)
                       + proximity(m))
        nearest = min(covering, key=proximity)
        out.append((t, tightest, len(dt), len(covering), nearest))
    out.sort(key=lambda p: (-p[3], -p[0]["size"]))
    return out


def near_misses(recs, floor):
    """Unpromoted drafts trymatch already scored at `floor`% or better.

    `work/<fn>/best.json` is written on every MISS and nothing reads it. A
    function sitting at 95%+ that nobody promoted is a stronger lead than any
    overlap score -- somebody has already done the derivation and stopped one
    edit short. Cross-referenced here so the batching list sees it (wave 20).
    """
    out = []
    for r in recs:
        if r["status"] not in ("asm", "parked"):
            continue
        meta = os.path.join(awlib.REPO, "work", r["name"], "best.json")
        if not os.path.exists(meta):
            continue
        try:
            with open(meta, encoding="utf-8") as fh:
                pct = json.load(fh).get("percent", 0)
        except (ValueError, OSError):
            continue
        if pct >= floor:
            out.append((pct, r))
    out.sort(key=lambda x: (-x[0], -x[1]["size"]))
    return out


def clusters(pairs, targets, min_shared, min_j):
    """Group unmatched functions that share an exemplar, then merge on
    target-to-target overlap so a sibling with no exemplar of its own still
    lands in the cluster its twin is in."""
    parent = {}

    def find(x):
        while parent.setdefault(x, x) != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    def union(a, b):
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[ra] = rb

    # Sharing an exemplar is NOT enough to merge. A hub exemplar such as
    # sub_0807567C is close to eight unrelated targets, and unioning on it
    # produced one 17-function 7.5 kB blob spanning three subsystems -- not a
    # batch anyone can take. Merge only on TARGET-TO-TARGET overlap; the
    # exemplar list is then a property of the cluster, not its definition.
    named = {t["name"]: t for t in targets}
    hot = sorted(set(t["name"] for t, _, _, _ in pairs))
    for i, a in enumerate(hot):
        ca = set(named[a]["calls"])
        for b in hot[i + 1:]:
            cb = set(named[b]["calls"])
            sh = ca & cb
            if len(sh) >= min_shared and len(sh) / float(len(ca | cb)) >= min_j:
                union(a, b)

    groups = collections.defaultdict(set)
    exemplars = collections.defaultdict(set)
    for t, m, n, j in pairs:
        groups[find(t["name"])].add(t["name"])
        exemplars[find(t["name"])].add(m["name"])
    out = []
    for root, members in groups.items():
        by = sum(named[x]["size"] for x in members)
        out.append((by, sorted(members), sorted(exemplars[root])))
    out.sort(key=lambda g: -g[0])
    return out


def report(args):
    recs = load_index()
    bodies = asm_bodies()
    pending = apply_pending(recs) if args.pending else []
    hubs = drop_hub_callees(recs, args.max_fanin)

    # TWO pools, deliberately. The callee axis needs an exemplar that HAS
    # callees; the data_refs axis does not, and serving both from one list
    # excluded every matched LEAF -- 596 of them -- from the subset screen for
    # as long as the `and r["calls"]` guard was shared (wave 20, found by
    # W20-A). Do not re-merge them.
    matched = [r for r in recs if r["status"] == "matched" and r["calls"]]
    matched_all = [r for r in recs if r["status"] == "matched"]
    # Normal runs batch on `asm` only -- parked functions are deliberately not
    # handed out again. The self-test must still see them: its two cluster
    # checks anchor on sub_08052718/sub_08052BBC, which wave 20 PARKED after
    # writing the test, so from wave 21 on those checks could not pass however
    # healthy the screen was. A permanently-red acceptance test hides the
    # regression it exists to catch, so widen the pool for --self-test only.
    ok_status = ("asm", "parked") if args.include_parked else ("asm",)
    targets = [r for r in recs
               if r["status"] in ok_status and r["mode"] == "THUMB"
               and r["size"] >= args.min_size and not r["trivial"]]

    print("corpus: %d functions, %d matched, %d unmatched THUMB >= %dB "
          "(%d bytes)"
          % (len(recs), sum(1 for r in recs if r["status"] == "matched"),
             len(targets), args.min_size, sum(t["size"] for t in targets)))

    # WHAT THE FLOOR HID. Every axis below reports on `targets`, so a `--min-size`
    # that excludes most of the corpus makes "0 pairs" read as "this axis is
    # exhausted" when it means "this axis was not asked". Wave 20 established
    # that exemplar proximity is the floor and SIZE IS NOT, and the flag
    # outlived the lesson: wave 24 found the default of 96 hiding 2,986
    # unmatched functions, and dropping it to 24 resurfaced duplicate pairs
    # immediately -- including one wave 21 had backed out and left free.
    below = [r for r in recs
             if r["status"] in ok_status and r["mode"] == "THUMB"
             and not r["trivial"] and r["size"] < args.min_size]
    if below:
        print("EXCLUDED BY --min-size %d: %d unmatched non-trivial THUMB "
              "functions, %d bytes." % (args.min_size, len(below),
                                        sum(r["size"] for r in below)))
        print("  A dry result below is a statement about THIS FLOOR, not about "
              "the corpus.")
        if args.min_size > 24:
            print("  Re-run with --min-size 24 before concluding an axis is "
                  "exhausted.")
    if pending:
        print("pending (matched by trymatch, not yet promoted): %d counted as "
              "exemplars" % len(pending))
    if hubs:
        print("hub callees dropped (fan-in > %d): %d -- %s"
              % (args.max_fanin, len(hubs),
                 ", ".join(sorted(hubs)[:8])
                 + (" ..." if len(hubs) > 8 else "")))

    pairs = overlaps(targets, matched, args.min_shared, args.min_j)
    covered = {}
    for t, m, n, j in pairs:
        if t["name"] not in covered or n > covered[t["name"]][1]:
            covered[t["name"]] = (t, n, j, m["name"])
    print("\n== overlap with a MATCHED exemplar "
          "(|shared| >= %d, J >= %.2f) ==" % (args.min_shared, args.min_j))
    print("pairs: %d   distinct unmatched functions: %d   bytes: %d"
          % (len(pairs), len(covered), sum(v[0]["size"] for v in covered.values())))

    strict, loose = duplicates(recs, bodies)

    def kinds(group):
        st = set(r["status"] for r in group)
        if "matched" in st and len(st) > 1:
            return "FREE"          # an unmatched twin of a matched function
        if st == {"matched"}:
            return "both-matched"
        return "pair"              # two unmatched siblings: halves the work

    print("\n== byte-identical duplicates (labels stripped) ==")
    for tag, table in (("strict (pool symbols too)", strict),
                       ("loose  (pool slots only)", loose)):
        free = [g for g in table.values() if kinds(g) == "FREE"]
        pair = [g for g in table.values() if kinds(g) == "pair"]
        print("  %s: %d groups -- %d with a matched member (%d free bytes), "
              "%d all-unmatched (%d bytes)"
              % (tag, len(table), len(free),
                 sum(r["size"] for g in free for r in g
                     if r["status"] != "matched"),
                 len(pair), sum(r["size"] for g in pair for r in g)))

    print("\n  LOOSE groups with a MATCHED member -- a free match if the pool"
          "\n  words really are interchangeable; check each by hand:")
    any_free = False
    for g in sorted(loose.values(), key=lambda g: -max(r["size"] for r in g)):
        if kinds(g) != "FREE":
            continue
        any_free = True
        print("    %5dB  %s" % (g[0]["size"],
              "  ".join("%s[%s]" % (r["name"], r["status"]) for r in g)))
    if not any_free:
        print("    (none)")

    strict_sets = [frozenset(r["name"] for r in g) for g in strict.values()]
    print("\n  LOOSE groups, all-unmatched, >= %dB -- ONE SHAPE with differing"
          "\n  pool symbols; derive one member, transcribe the rest:"
          % args.min_size)
    shown = 0
    for g in sorted(loose.values(), key=lambda g: -max(r["size"] for r in g)):
        if kinds(g) != "pair" or max(r["size"] for r in g) < args.min_size:
            continue
        if frozenset(r["name"] for r in g) in strict_sets:
            continue
        print("    %5dB x%d  %s" % (g[0]["size"], len(g),
                                    "  ".join(r["name"] for r in g)))
        shown += 1
        if shown >= args.top:
            break
    if not shown:
        print("    (none)")

    print("\n  STRICT groups worth taking (>= %dB members, unmatched involved):"
          % args.min_size)
    shown = 0
    for g in sorted(strict.values(), key=lambda g: -sum(r["size"] for r in g)):
        if all(r["status"] == "matched" for r in g):
            continue
        if max(r["size"] for r in g) < args.min_size:
            continue
        print("    %5dB  %-9s %s"
              % (g[0]["size"], kinds(g),
                 "  ".join("%s[%s]" % (r["name"], r["status"]) for r in g)))
        shown += 1
        if shown >= args.top:
            break
    if not shown:
        print("    (none)")

    subs = dataref_neighbours(targets, matched_all, args.min_shared)
    print("\n== data_refs a strict SUBSET of a matched function's "
          "(>= %d refs) ==" % args.min_shared)
    print("functions: %d   bytes: %d   (the axis |shared callees| cannot see)"
          % (len(subs), sum(t["size"] for t, _, _, _, _ in subs)))
    print("  All coverage here is 100% -- this axis only reports SUBSETS, so a"
          "\n  percentage would carry no information. exemplars=N is how many"
          "\n  DISTINCT matched functions cover the target. `tightest` is the"
          "\n  smallest covering VOCABULARY, ties broken by proximity in size and"
          "\n  callee count; `nearest` is the closest covering SHAPE ignoring ref"
          "\n  count, printed only where the two disagree. READ BOTH -- wave 21"
          "\n  measured a 36-byte all-zero-stores leaf winning the old"
          "\n  smallest-first tie-break for twelve targets and teaching nothing.")
    for t, m, covers, n, near in subs[:args.top]:
        line = ("    %-14s %4dB  %d refs, exemplars=%-3d tightest %s "
                "(%d refs, %dB)"
                % (t["name"], t["size"], covers, n, m["name"],
                   len(m["data_refs"]), m["size"]))
        if near["name"] != m["name"]:
            line += "  nearest %s (%d refs, %dB)" % (
                near["name"], len(near["data_refs"]), near["size"])
        print("%s  [%s]" % (line, t["src"]))

    nm = near_misses(recs, args.near_miss)
    print("\n== unpromoted near-misses: work/<fn>/best.json >= %.0f%% =="
          % args.near_miss)
    print("functions: %d   bytes: %d   (somebody already derived these and "
          "stopped short)" % (len(nm), sum(r["size"] for _, r in nm)))
    for pct, r in nm[:args.top]:
        print("    %-14s %5dB  %5.1f%%  [%s]"
              % (r["name"], r["size"], pct, r["status"]))

    print("\n== top %d clusters by bytes ==" % args.top)
    named = {t["name"]: t for t in targets}
    for by, members, exs in clusters(pairs, targets,
                                     args.min_shared, args.min_j)[:args.top]:
        core = set(named[members[0]]["calls"])
        for name in members[1:]:
            core &= set(named[name]["calls"])
        print("  %5dB  %d fn  exemplars: %s"
              % (by, len(members), ", ".join(exs[:4])
                 + (" ..." if len(exs) > 4 else "")))
        print("           core (callees shared by ALL %d): %s"
              % (len(members),
                 ", ".join(sorted(core)) if core
                 else "EMPTY -- transitive chain, split it before batching"))
        for name in sorted(members, key=lambda n: -named[n]["size"]):
            t = named[name]
            best = covered[name]
            print("           %-14s %4dB  |shared|=%d J=%.3f  vs %s"
                  % (name, t["size"], best[1], best[2], best[3]))

    # Runs LAST on purpose. Every axis above is shape-based and they go dry
    # together; when they do, this is the one that still has work in it, and it
    # should be the last thing on screen when you sit down to write the brief.
    block_offered = []
    if not args.no_blocks:
        _, block_offered = blocks(recs, args)

    return pairs, covered, strict, loose, targets, block_offered


def blocks(recs, args):
    """Rank 4KB address blocks by how cheap they are to batch.

    THIS IS THE AXIS THAT CARRIED WAVE 24 (109 functions from 39 assigned) and
    it is not a shape metric at all. Every shape-based screen above was dry
    that wave -- families 0 with_exemplar, callee overlap 0 pairs, duplicates 0
    usable groups, data_refs subset down to 3 -- and the work was still there.

    The insight is that a block's cost is its VOCABULARY, not its shapes. Ten
    small functions from one already-half-promoted block reuse the same globals,
    the same struct layouts and the same callee prototypes; the promoted
    siblings have already written all of that down. The shapes are unrelated and
    that does not matter. Wave 24's W24-C matched its assigned 13 in two
    compile_probe rounds and 13 first-attempt try_match calls.

    Two limits, both measured, both worth stating in the brief:
      - It is only cheap where the block is ALREADY half promoted. A cold block
        has no vocabulary to inherit and behaves nothing like this.
      - These are small functions. Wave 24's 109 are ~4,500 bytes; wave 23's 17
        were 3,344. Function count and byte count diverged long ago.

    AND DO NOT BATCH ON A (size, calls, refs) SIGNATURE. It looks like it finds
    25-member families. Wave 24 checked three members of one and got a rounding
    divide, a byte-store wrapper and a stack-args forwarder -- the same
    false-positive mode wave 21 recorded for duplicate signatures. Group by
    LOCALITY and tell the agent the shapes are unrelated.
    """
    promoted_units = set()
    try:
        with open(os.path.join(awlib.DATA_DIR, "promoted.json"),
                  encoding="utf-8") as fh:
            for u in json.load(fh):
                m = re.search(r'c_([0-9A-Fa-f]{8})\.c', u["file"])
                if m:
                    promoted_units.add(int(m.group(1), 16))
    except (OSError, ValueError):
        pass

    named = [r for r in recs if r["name"].startswith("sub_")]
    addr = {r["name"]: int(r["name"][4:], 16) for r in named}
    matched_addrs = sorted(addr[r["name"]] for r in named
                           if r["status"] == "matched")

    pool = [r for r in named
            if r["status"] == "asm" and r["mode"] == "THUMB"
            and args.block_min <= r["size"] <= args.block_max
            and r["backward_branches"] == 0 and not r["trivial"]]

    by_block = collections.defaultdict(list)
    for r in pool:
        by_block[addr[r["name"]] >> 12].append(r)

    rows = []
    for blk, fns in by_block.items():
        n_matched = sum(1 for a in matched_addrs if a >> 12 == blk)
        n_units = sum(1 for a in promoted_units if a >> 12 == blk)
        if n_matched < args.block_min_matched:
            continue
        rows.append((len(fns), n_matched, n_units, blk, fns))
    rows.sort(key=lambda x: (-x[0], -x[1]))

    print("\n== ADDRESS-LOCALITY BLOCKS (%d-%dB, straight-line, non-trivial, "
          ">= %d matched in block) ==" % (args.block_min, args.block_max,
                                          args.block_min_matched))
    print("blocks: %d   candidate functions: %d   bytes: %d"
          % (len(rows), sum(r[0] for r in rows),
             sum(f["size"] for r in rows for f in r[4])))
    print("  Cost is the block's VOCABULARY, not its shapes -- see blocks().")
    print("  Give ONE block per agent and name each target's nearest matched")
    print("  neighbour as its exemplar. Tell the agent the shapes are NOT")
    print("  variations of each other.")

    offered = []          # [(record, nearest_matched_addr, exemplar_path)]
    for n, n_matched, n_units, blk, fns in rows[:args.top_blocks]:
        print("\n  block 0x%05X000  %2d candidates, %4d bytes  "
              "(%d matched, %d promoted units in block)"
              % (blk, n, sum(f["size"] for f in fns), n_matched, n_units))
        shown = 0
        for r in sorted(fns, key=lambda x: addr[x["name"]])[:args.per_block]:
            a = addr[r["name"]]
            i = bisect.bisect_left(matched_addrs, a)
            near = min((matched_addrs[j] for j in (i - 1, i)
                        if 0 <= j < len(matched_addrs)),
                       key=lambda x: abs(x - a), default=None)
            if near is None:
                continue
            shown += 1
            # The exemplar is the promoted UNIT that contains the nearest
            # matched neighbour, i.e. the greatest unit address <= it. That is
            # a guess about unit boundaries rather than a lookup, which is why
            # --self-test checks every path it prints actually exists.
            ex = [u for u in promoted_units if u <= near]
            exf = "src/decomp/c_%08X.c" % max(ex) if ex else None
            offered.append((r, near, exf))
            print("    %-16s %3dB calls=%-2d refs=%-2d  nearest sub_%08X  %s"
                  % (r["name"], r["size"], len(r["calls"]),
                     len(r["data_refs"]), near, exf or "?"))
        # NO SILENT CAPS. This listing IS the batching list, so a block that
        # says "19 candidates" and prints 14 hands the next wave a short batch
        # that looks complete. Wave 26 caught it only by comparing the two
        # numbers by hand.
        if shown < n:
            print("    (+%d more not shown -- re-run with --per-block %d)"
                  % (n - shown, n))

    # NO SILENT CAPS -- AT THE BLOCK LEVEL EITHER. The per-block notice above
    # has existed since wave 26; this one had not, so wave 28 read a header
    # saying "blocks: 28, candidate functions: 284" above six listings totalling
    # 120 and never saw the other 164. A truncated batching list does not look
    # truncated -- it looks like the axis is nearly exhausted, which is the
    # single most expensive wrong belief a wave can start from.
    if len(rows) > args.top_blocks:
        hidden = rows[args.top_blocks:]
        print("\n  (+%d more block(s) NOT SHOWN: %d further candidate "
              "function(s), %d bytes.\n"
              "   re-run with --top-blocks %d to see them. The header count "
              "above covers\n"
              "   ALL blocks, so it will not agree with the listings until you "
              "do.)"
              % (len(hidden), sum(len(r[4]) for r in hidden),
                 sum(f["size"] for r in hidden for f in r[4]), len(rows)))
    return rows, offered


def self_test(args):
    """The wave-20 acceptance test -- the screen must rediscover a cluster we
    already know is real, with no knowledge of it."""
    pairs, covered, strict, loose, targets, block_offered = report(args)
    ok = True

    dup = [g for g in list(strict.values()) + list(loose.values())
           if set(r["name"] for r in g) >= {"sub_08052650", "sub_08052AF4"}]
    print("\n[self-test] sub_08052650 / sub_08052AF4 byte-identical: %s"
          % ("PASS" if dup else "FAIL"))
    ok &= bool(dup)

    for t in ("sub_08052718", "sub_08052BBC"):
        exs = set(m["name"] for tt, m, _, _ in pairs if tt["name"] == t)
        want = {"sub_08051BEC", "sub_08051F4C"}
        hit = want & exs
        print("[self-test] %s grouped with %s: %s"
              % (t, "/".join(sorted(want)),
                 "PASS (%s)" % ", ".join(sorted(hit)) if hit else "FAIL"))
        ok &= bool(hit)

    # The block screen's acceptance test. It has no "known real cluster" to
    # rediscover the way the axes above do, so it is checked on the two things
    # that would actually make it lie to a brief: offering a function that is
    # not available, and naming an exemplar file that does not exist. The
    # second is the realistic bug -- the exemplar is resolved as "the greatest
    # promoted unit address <= the nearest matched neighbour", which is a
    # guess about unit boundaries, not a lookup.
    bad_status = [r["name"] for r, _, _ in block_offered
                  if r["status"] != "asm"]
    print("\n[self-test] block screen offers only unmatched targets: %s"
          % ("PASS (%d offered)" % len(block_offered) if not bad_status
             else "FAIL (%s)" % ", ".join(bad_status[:4])))
    ok &= not bad_status

    # An EMPTY block screen is a legitimate state -- wave 27 promoted the last
    # of the twelve blocks -- but it is also exactly what a broken screen looks
    # like, so it may not simply pass. Distinguish the two the way the project
    # distinguishes every other dry axis: drop the floor and see whether the
    # work reappears. If it does, the screen works and the axis is exhausted AT
    # THIS THRESHOLD; if nothing appears even at --block-min-matched 1, the
    # screen itself is suspect.
    #
    # This assertion used to be `ok &= ... and bool(block_offered)` while the
    # label above only tested `bad_status`, so the moment wave 27 emptied the
    # last block the test printed "PASS (0 offered)" on the very line that was
    # failing, and only the summary went red. A check whose label disagrees
    # with its verdict is worse than no check.
    if not block_offered:
        probe = argparse.Namespace(**vars(args))
        probe.block_min_matched = 1
        deep = blocks(load_index(), probe)[1]
        print("[self-test] block screen is EMPTY -- lowering the floor to "
              "--block-min-matched 1 finds %d: %s"
              % (len(deep),
                 "PASS (screen works; the axis is exhausted at the default "
                 "threshold, not broken)" if deep
                 else "FAIL (nothing at any threshold -- suspect the screen)"))
        ok &= bool(deep)

    # Wave 28: the block LIST itself was silently truncated to --top-blocks
    # (default 6). The header counted all 28 blocks while six were listed, so a
    # wave read "284 candidates" above 120 rows and never learned the other 164
    # existed. Truncation is fine; unannounced truncation is not, because a short
    # batching list looks like an exhausted axis rather than a clipped one.
    #
    # Assert the property that actually matters -- REACHABILITY. Every candidate
    # the header counts must be obtainable by raising --top-blocks, and the
    # totals must agree once it is raised. This catches both the missing notice
    # and any future off-by-one in the slice.
    all_rows = blocks(load_index(), args)[0]
    if len(all_rows) > args.top_blocks:
        full = argparse.Namespace(**vars(args))
        full.top_blocks = len(all_rows)
        full.per_block = max(len(r[4]) for r in all_rows)
        deep = blocks(load_index(), full)[1]
        want = sum(len(r[4]) for r in all_rows)
        good = len(deep) == want
        print("[self-test] block list truncated to %d of %d -- every hidden "
              "candidate is reachable via --top-blocks: %s"
              % (args.top_blocks, len(all_rows),
                 "PASS (%d of %d offered when raised)" % (len(deep), want)
                 if good else
                 "FAIL (%d offered, header counts %d)" % (len(deep), want)))
        ok &= good

    missing = [p for _, _, p in block_offered
               if not p or not os.path.isfile(os.path.join(awlib.REPO, p))]
    print("[self-test] every named exemplar file exists: %s"
          % ("PASS" if not missing
             else "FAIL (%d bad: %s)"
                  % (len(missing), ", ".join(sorted(set(map(str, missing)))[:3]))))
    ok &= not missing

    print("[self-test] %s" % ("PASS" if ok else "FAIL"))
    return 0 if ok else 1


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--min-size", type=int, default=96)
    p.add_argument("--min-shared", type=int, default=4)
    p.add_argument("--min-j", type=float, default=0.6)
    p.add_argument("--top", type=int, default=15)
    p.add_argument("--max-fanin", type=int, default=40,
                   help="drop callees called by more than this many functions "
                        "(0 disables the IDF cut)")
    p.add_argument("--near-miss", type=float, default=95.0,
                   help="floor for the work/<fn>/best.json near-miss sweep")
    p.add_argument("--pending", action="store_true",
                   help="also count drafts trymatch has matched but that are "
                        "not promoted yet -- use this DURING a wave, because "
                        "data/functions.json does not learn about a match "
                        "until promotion")
    p.add_argument("--block-min", type=int, default=12,
                   help="smallest function the address-locality screen offers")
    p.add_argument("--block-max", type=int, default=72,
                   help="largest function the address-locality screen offers; "
                        "above this the per-function work stops being one or "
                        "two statements and the block's shared vocabulary "
                        "stops being the dominant cost")
    p.add_argument("--block-min-matched", type=int, default=20,
                   help="skip blocks with fewer matched functions than this -- "
                        "the axis is only cheap where the vocabulary is ALREADY "
                        "written down, and a cold block behaves nothing like it")
    p.add_argument("--top-blocks", type=int, default=6)
    p.add_argument("--per-block", type=int, default=14,
                   help="targets listed per block; ~13 is one agent's batch")
    p.add_argument("--no-blocks", action="store_true",
                   help="skip the address-locality screen")
    p.add_argument("--self-test", action="store_true")
    p.add_argument("--include-parked", action="store_true",
                   help="also screen parked functions as targets; implied by "
                        "--self-test, whose anchors are parked")
    args = p.parse_args()
    if args.self_test:
        args.include_parked = True
        print("[self-test] --include-parked is ON (the anchors are parked), so "
              "every count below\n            is HIGHER than a plain run's. "
              "The two outputs are not comparable;\n            batch off the "
              "plain run.")
        sys.exit(self_test(args))
    report(args)


main()
