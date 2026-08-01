#!/usr/bin/env python3
"""Wave pre-flight: every standing check, one command, one compact summary.

Added in wave 20 after the token-usage review: the checks below used to be ~10
separate orchestrator turns of heredocs re-pasted from SKILL.md each wave, and
each turn replays the whole session context. Run this instead:

    python tools/preflight.py            # everything (parked re-test included)
    python tools/preflight.py --skip-parked   # fast run, skip the re-test

What it does, in SKILL.md section-1 order:
  1. regenerates data/families.json (families.py, with its self-validation)
  2. prints the three progress metrics and which one titles the commit
  3. screens the straight-line band (>= 256 B, backward_branches == 0)
  4. sweeps work/*/best.json for unpromoted near-misses (nothing else reads it)
  5. re-tests every data/parked.json entry BY EXIT CODE
  6. reminds you what it deliberately does not do (overlap_screen.py -- its
     full output IS the batching list and belongs in front of the orchestrator)

Exit status is 0 unless families.py's self-validation fails, which is the one
condition under which batching must not proceed.
"""

import argparse
import glob
import json
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
os.chdir(REPO)
sys.path.insert(0, HERE)

PY = sys.executable


def run(args, **kw):
    return subprocess.run([PY] + args, capture_output=True, text=True, **kw)


def sect(title):
    print("\n=== %s ===" % title)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--skip-parked", action="store_true",
                    help="skip the parked-queue re-test (the slow step)")
    args = ap.parse_args()

    # 0. The wave number. Nothing else prints it, it is not derivable from the
    # metrics, and a wrong one lands in every comment the wave's agents write
    # -- a session once numbered itself 25 against an existing wave-25 commit
    # and 40+ annotations had to be renumbered surgically (SKILL.md rule 5).
    sect("last commits (the wave number comes from HERE, nowhere else)")
    g = subprocess.run(["git", "log", "--oneline", "-3"],
                       capture_output=True, text=True)
    print(g.stdout.strip() or "(git log unavailable)")
    m = re.search(r"Wave (\d+):", g.stdout)
    if m:
        print("=> last wave committed: %s -- this wave is %d"
              % (m.group(1), int(m.group(1)) + 1))

    # 1. families.py -- regenerate FIRST; stale clusters waste the wave.
    sect("families.py (regenerated, self-validated)")
    r = run(["tools/families.py"])
    tail = (r.stdout + r.stderr).strip().splitlines()
    for line in tail[-6:]:
        print(line)
    families_ok = r.returncode == 0 and "[FAIL]" not in r.stdout + r.stderr
    if not families_ok:
        print("!! families.py validation FAILED -- do not batch on this")

    # 2. The three progress metrics.
    sect("progress metrics")
    data = json.load(open("data/functions.json", encoding="utf-8"))
    from collections import Counter
    counts = Counter(f["status"] for f in data)
    matched = [f for f in data if f["status"] == "matched"]
    total_b = sum(f["size"] for f in data)
    match_b = sum(f["size"] for f in matched)
    print("status:", dict(counts))
    print("index metric  : %d / %d functions, %d / %d bytes (%.2f%%)"
          % (len(matched), len(data), match_b, total_b, 100.0 * match_b / total_b))
    import index_functions as ix
    cdef = len(ix.decompiled_symbols())
    print("C-def metric  : %d   <- commit TITLES use this one" % cdef)
    print("(progress_map.py prints a third, larger byte figure -- it counts")
    print(" src/proc.c / src/title-screen.c too. Never quote it as progress.)")

    # 3. Straight-line band.
    sect("straight-line band (>= 256 B, backward_branches == 0)")
    band = [f for f in data
            if f["status"] == "asm" and f["mode"] == "THUMB"
            and f["size"] >= 256 and f["backward_branches"] == 0]
    band.sort(key=lambda f: -f["size"])
    print("%d funcs, %d bytes" % (len(band), sum(f["size"] for f in band)))
    for f in band[:15]:
        print("  %-16s %5dB calls=%-2d refs=%-2d %s"
              % (f["name"], f["size"], len(f["calls"]),
                 len(f["data_refs"]), f["src"]))

    # 4. best.json sweep -- wave 20 found a finished 392-byte function here.
    sect("work/*/best.json near-misses (unmatched only)")
    st = {f["name"]: f["status"] for f in data}
    rows = []
    for p in glob.glob("work/*/best.json"):
        fn = os.path.basename(os.path.dirname(p))
        if st.get(fn) == "matched":
            continue
        try:
            b = json.load(open(p, encoding="utf-8"))
        except (OSError, ValueError):
            continue
        pct = b.get("percent", b.get("pct", -1))
        rows.append((pct, fn, st.get(fn, "?")))
    rows.sort(key=lambda t: -t[0])
    hot = [r for r in rows if r[0] >= 90]
    for pct, fn, s in hot:
        print("  %6.2f%%  %-16s %s" % (pct, fn, s))
    print("(%d at >= 90%%, %d at 70-90%%; re-test anything here by exit code"
          % (len(hot), len([r for r in rows if 70 <= r[0] < 90])))
    print(" before believing it -- a score is not a match)")

    # 5. Parked queue: format, staleness, then the exit-code re-test.
    sect("parked queue re-test (exit code, not message text)")
    raw = open("data/parked.json", "rb").read()
    # Wave 30: the file is CRLF and indent=1. Get either wrong and every one
    # of its ~380 lines re-serialises, burying a real five-entry addition in a
    # 425/379 diff. Catch it here rather than in `git diff` at commit time.
    fmt = []
    if raw.count(b"\r\n") == 0 and raw.count(b"\n") > 0:
        fmt.append("LF line endings (the file is CRLF in git)")
    body = raw.replace(b"\r\n", b"\n")
    first_key = re.search(rb'\{\n( +)"', body)
    if first_key and first_key.group(1) != b" ":
        fmt.append("top-level indent is %d spaces (the file is indent=1)"
                   % len(first_key.group(1)))
    if fmt:
        print("  !! parked.json FORMAT DRIFT: " + "; ".join(fmt))
        print("  !! rewrite with indent=1 and CRLF before committing, or the")
        print("  !! whole file churns and real changes become unreviewable")
    parked = json.load(open("data/parked.json", encoding="utf-8"))["functions"]
    # A parked entry for a function that is already MATCHED is a stale lie --
    # wave 30 had an agent park two functions that a later agent then matched,
    # and left in place they would suppress both from every future pre-flight.
    stale = [n for n in parked if st.get(n) == "matched"]
    for n in stale:
        print("  !! STALE %s -- parked but its status is MATCHED; delete the"
              " entry" % n)
    if args.skip_parked:
        print("skipped (--skip-parked)")
    else:
        for name in parked:
            if name in stale:
                continue
            r = run(["tools/trymatch.py", name])
            if r.returncode == 0:
                print("  UNPARKED %s -- matches now, promote it" % name)
            else:
                print("  still-fails %s" % name)

    # 6. What this deliberately leaves to you.
    sect("not covered here")
    print("python tools/overlap_screen.py   <- run it yourself; its full output")
    print("IS the batching list (duplicate pairs, data_refs subsets, exemplar")
    print("clusters) and it goes stale every wave. Check --self-test passes.")

    return 0 if families_ok else 1


if __name__ == "__main__":
    sys.exit(main())
