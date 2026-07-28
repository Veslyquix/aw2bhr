#!/usr/bin/env python3
"""Brute-force a near-match with decomp-permuter, then judge it with trymatch.

This exists for one failure mode. A candidate can be semantically correct,
compile to the right instructions in the right order, and still not match
because a value landed in the wrong register -- and register allocation is
decided by phrasing the source rather than by what it computes, so it is
reachable by rewriting and not by reasoning. `docs/agbcc-codegen.md` records two
functions where fourteen and eight rewrites respectively all produced identical
output. The permuter searches that space mechanically.

Two things are worth being precise about.

**The permuter's score is not the verdict.** It scores by diffing objdump text,
so it ignores encoding details and stops at the boundary of what objdump prints.
Every candidate it produces is re-checked here with tools/trymatch.py, which
compares the encoded bytes and the relocations. A permuter score of 0 that
trymatch rejects is a real outcome, not a bug.

Measured, the two are not even monotonically related: on both blocked functions
the permuter's best-scoring candidate was a byte-level *regression* -- 35 -> 30
while bytes went 80% -> 75%, and 220 -> 80 while bytes went 88.2% -> 55.9%.
That is why the original source is restored when nothing matches, and why
best.c is only ever moved forward by trymatch's own measurement.

**target.o must contain the target function and nothing else.** The scorer
disassembles the whole object, so a multi-function unit would make every score
meaningless while still looking like it worked. This refuses to run in that case
rather than produce numbers that cannot be trusted.

    python tools/permute.py sub_08063980 --seconds 600
    python tools/permute.py sub_08001158 --setup-only   # inspect, do not run

The vendored permuter is not committed; see vendor/README.md.
"""

import argparse
import json
import os
import re
import shutil
import sys

import agbenv
import awlib
import trymatch

PERMUTER_DIR = os.path.join(awlib.REPO, "vendor", "decomp-permuter")
WORK = os.path.join(awlib.REPO, "work")

CLONE_HINT = (
    "vendor/decomp-permuter is missing. It is not committed -- clone it with:\n"
    "    git clone https://github.com/WhenGryphonsFly/decomp-permuter-agbcc.git \\\n"
    "        vendor/decomp-permuter\n"
    "See vendor/README.md for the pinned commit and the WSL packages it needs.")

# The compile pipeline, byte-identical to agbenv.compile_c and so to the
# Makefile's own recipe. `cd` is required because the permuter invokes this from
# whatever directory it was started in, with absolute temp paths for input and
# output, while the compiler flags are all relative to the repo.
COMPILE_SH = """#!/bin/bash
set -e
IN="$1"
OUT="$3"
cd {repo}
S="$OUT.s"
trap 'rm -f "$S"' EXIT
{cpp} {cppflags} "$IN" | iconv -f UTF-8 -t CP932 | {cc1} {cflags} -o "$S"
printf '.text\\n\\t.align\\t2, 0\\n' >> "$S"
{as_} {asflags} "$S" -o "$OUT"
{strip} -N .gcc2_compiled. "$OUT"
"""


def shq(s):
    return "'" + s.replace("'", "'\\''") + "'"


def definition_line(lines, name):
    """Index of the line where `name`'s definition starts, or None.

    A prototype is excluded by the trailing semicolon -- `unknown-functions.h`
    declares many of these functions, so after preprocessing the declaration and
    the definition both appear and only the second one is wanted.
    """
    rx = re.compile(r'^[A-Za-z_].*\b%s\s*\(' % re.escape(name))
    for i, ln in enumerate(lines):
        if rx.match(ln) and not ln.rstrip().endswith(";"):
            return i
    return None


def pick_source(workdir, name, prefer_best):
    """The C to start permuting from.

    best.c is the highest byte score ever reached, which is not necessarily the
    file left behind by the last iteration; starting anywhere else throws away
    the work that got us close enough for this to be worth running.
    """
    cur = os.path.join(workdir, name + ".c")
    best = os.path.join(workdir, "best.c")
    if prefer_best and os.path.exists(best):
        return best, "best.c"
    if os.path.exists(cur):
        return cur, name + ".c"
    return None, None


def setup(rec, unit, prefer_best):
    """Build work/<name>/permuter/ and return its path, or None on failure."""
    name = rec["name"]
    workdir = os.path.join(WORK, name)
    pdir = os.path.join(workdir, "permuter")

    src, which = pick_source(workdir, name, prefer_best)
    if src is None:
        print("error: no C to permute -- run `python tools/newfunc.py %s` first"
              % name)
        return None

    if len(unit["functions"]) != 1:
        print("error: %s shares split unit %s with %s."
              % (name, unit["unit"],
                 ", ".join(f for f in unit["functions"] if f != name)))
        print("       target.o would contain those too and every score would be")
        print("       measured against the wrong code. Refusing to run.")
        return None

    os.makedirs(pdir, exist_ok=True)
    # Old results would be harvested as if this run had produced them.
    for entry in os.listdir(pdir):
        if entry.startswith("output-"):
            shutil.rmtree(os.path.join(pdir, entry), ignore_errors=True)

    unit_dir = unit.get("dir", "build/functions")
    unit_o = "%s/%s.o" % (unit_dir, unit["unit"])
    rc, _, se = agbenv.assemble("%s/%s" % (unit_dir, unit["file"]), unit_o)
    if rc != 0:
        print("error: could not assemble the original unit\n%s" % se[-1500:])
        return None
    shutil.copyfile(os.path.join(awlib.REPO, unit_o.replace("/", os.sep)),
                    os.path.join(pdir, "target.o"))

    # base.c must be a self-contained translation unit: the permuter parses it
    # with pycparser after running `cpp -P -nostdinc`, which resolves no include
    # paths, so anything left unexpanded here fails at load time.
    f = agbenv.flags()
    rel_src = os.path.relpath(src, awlib.REPO).replace(os.sep, "/")
    rel_base = os.path.relpath(os.path.join(pdir, "base.c"),
                               awlib.REPO).replace(os.sep, "/")
    # pycparser cannot parse GCC attributes, so any source reaching hardware.h
    # died at load time with `Syntax error in base.c ... struct
    # __attribute__((aligned(4))) DispCnt` -- which took every function touching
    # a hardware register off the permuter entirely, including textbook cases
    # like sub_0806EB5C (exact size, one register swap). Define the attribute
    # away for the parse.
    #
    # base.c is also what compile.sh builds, so this is only safe if stripping
    # is byte-neutral. Measured before committing to it: seven promoted files
    # that include hardware.h, compiled both ways and compared on .text alone
    # -- all seven identical, c_08012420.c (364 B, uses REG_BG3CNT) included.
    # Re-measure if a struct ever needs alignment the ABI does not already give.
    rc, _, se = agbenv.run('%s %s -P -D"__attribute__(x)=" %s -o %s'
                           % (f["CPP"], f["CPPFLAGS"], shq(rel_src),
                              shq(rel_base)))
    if rc != 0:
        print("error: preprocessing %s failed\n%s" % (rel_src, se[-1500:]))
        return None

    sh = COMPILE_SH.format(
        repo=shq(agbenv.REPO_POSIX), cpp=f["CPP"], cppflags=f["CPPFLAGS"],
        cc1=f["CC1"], cflags=f["CFLAGS"], as_=f["AS"], asflags=f["ASFLAGS"],
        strip=f["STRIP"])
    # Written as bytes with LF endings on purpose. A CRLF shebang makes the
    # kernel look for an interpreter called "/bin/bash\r" and the script exits
    # 127 -- which the permuter reports as "every candidate failed to compile".
    with open(os.path.join(pdir, "compile.sh"), "wb") as fh:
        fh.write(sh.encode("utf-8"))

    awlib.write_text(os.path.join(pdir, "settings.toml"),
                     'func_name = "%s"\ncompiler_type = "gcc"\n' % name)

    rel_pdir = os.path.relpath(pdir, awlib.REPO).replace(os.sep, "/")
    # The permuter checks the executable bit itself and refuses to start
    # without it. NTFS under WSL usually reports 0777 anyway, but not when the
    # drive is mounted with metadata.
    agbenv.run("chmod +x %s/compile.sh" % shq(rel_pdir))

    print("set up %s" % rel_pdir)
    print("  source   %s" % which)
    print("  target   %s (%d bytes, %d function)"
          % (unit_o, rec["size"], len(unit["functions"])))
    return pdir


def base_score(pdir):
    """Compile and score the starting point without permuting anything.

    A failure here is a harness problem -- unparseable base.c, a broken
    compile.sh -- and is worth separating from "the search found nothing",
    because the two look identical from the outside.
    """
    rel = os.path.relpath(pdir, awlib.REPO).replace(os.sep, "/")
    # --debug writes debug_source.c and debug_compiled_object.o into the working
    # directory, which is the repo root. Left there, debug_source.c breaks the
    # Makefile's source discovery (see the comment on C_SRCS). Move them into
    # the permuter directory, where they are still available and harmless.
    rc, so, se = agbenv.run(
        "python3 vendor/decomp-permuter/permuter.py %s --debug; rc=$?\n"
        "mv -f debug_source.c debug_compiled_object.o %s/ 2>/dev/null\n"
        "exit $rc" % (shq(rel), shq(rel)),
        timeout=300)
    text = so + se
    m = re.search(r'base score = (\d+)', text)
    if m is None:
        print("error: the permuter could not score the starting point.")
        for ln in text.strip().splitlines()[-20:]:
            print("  " + ln)
        return None
    return int(m.group(1))


def run(pdir, seconds, threads):
    rel = os.path.relpath(pdir, awlib.REPO).replace(os.sep, "/")
    # SIGINT first, so the permuter's own handler shuts the workers down and the
    # output directories are left complete. `-k 30` is not optional: measured, a
    # run took SIGINT at 900s and was still going at 2906s, holding every core
    # it had. Whatever swallows the signal -- the multiprocessing pool, most
    # likely -- a wall-clock limit that does not actually stop the process is
    # worse than no limit, because nothing is watching it any more.
    cmd = ("timeout -s INT -k 30 %d python3 vendor/decomp-permuter/permuter.py "
           "%s --better-only --stop-on-zero -j %d"
           % (seconds, shq(rel), threads))
    log = os.path.join(pdir, "permuter.log")
    print("\nrunning for up to %ds with %d threads; live output below, also"
          % (seconds, threads))
    print("logged to %s\n" % os.path.relpath(log, awlib.REPO))
    rc, _ = agbenv.stream(cmd, log_path=log)
    return rc


def harvest(pdir):
    """(score, source path) for this run's outputs, best score first."""
    out = []
    for entry in sorted(os.listdir(pdir)):
        if not entry.startswith("output-"):
            continue
        src = os.path.join(pdir, entry, "source.c")
        if not os.path.exists(src):
            continue
        try:
            with open(os.path.join(pdir, entry, "score.txt")) as fh:
                score = int(fh.read().strip())
        except (OSError, ValueError):
            continue
        out.append((score, src))
    return sorted(out, key=lambda t: t[0])


def splice(orig_lines, cand_lines, name):
    """The original file's preamble plus the permuted function.

    The permuter's output is base.c -- every header expanded -- with the
    function rewritten. That compiles, but it is not something anyone would
    commit. Grafting the new function onto the original's includes and externs
    gives back a normal source file. Returns None if either side cannot be
    split, in which case the caller falls back to the raw output.
    """
    a = definition_line(orig_lines, name)
    b = definition_line(cand_lines, name)
    if a is None or b is None:
        return None
    return orig_lines[:a] + cand_lines[b:]


def verify(rec, pdir, keep_all):
    """Run every candidate past trymatch and keep the first that matches."""
    name = rec["name"]
    workdir = os.path.join(WORK, name)
    csrc = os.path.join(workdir, name + ".c")
    orig = awlib.read_lines(csrc)

    cands = harvest(pdir)
    if not cands:
        print("\nno candidate scored better than the starting point.")
        return 1

    print("\n%d candidate(s) to check against trymatch:" % len(cands))
    for score, src in cands:
        rel = os.path.relpath(src, awlib.REPO).replace(os.sep, "/")
        cand = awlib.read_lines(src)
        print("\n  permuter score %d  (%s)" % (score, rel))

        # Try the tidy form first. If the graft is wrong in any way the raw
        # output still holds the real result, so a failure here costs one
        # compile rather than the candidate.
        forms = []
        grafted = splice(orig, cand, name)
        if grafted is not None:
            forms.append(("spliced onto the original preamble", grafted))
        forms.append(("raw permuter output (headers expanded)", cand))

        for label, lines in forms:
            awlib.write_text(csrc, "".join(lines))
            print("  checking: %s" % label)
            rc = trymatch.check(name)
            if rc == 0:
                print("\nMATCH from the permuter -- %s is written to %s"
                      % (label, os.path.relpath(csrc, awlib.REPO)))
                if lines is cand:
                    print("      this is the header-expanded form; reduce it to")
                    print("      an include plus externs before promoting.")
                return 0

    awlib.write_text(csrc, "".join(orig))
    print("\nno candidate matched at the byte level; %s restored unchanged."
          % os.path.relpath(csrc, awlib.REPO))
    if not keep_all:
        print("output directories kept under %s for inspection."
              % os.path.relpath(pdir, awlib.REPO))
    return 1


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", help="function name or address")
    ap.add_argument("--seconds", type=int, default=300,
                    help="wall-clock limit for the search (default 300)")
    ap.add_argument("-j", "--threads", type=int, default=4)
    ap.add_argument("--setup-only", action="store_true",
                    help="build the permuter directory and stop")
    ap.add_argument("--current", action="store_true",
                    help="start from <name>.c rather than best.c")
    ap.add_argument("--keep", action="store_true",
                    help="keep output directories even on success")
    args = ap.parse_args()

    if not os.path.isdir(PERMUTER_DIR):
        print(CLONE_HINT)
        return 2

    rec, unit = trymatch.resolve(args.name)
    if rec is None or unit is None:
        return 2

    pdir = setup(rec, unit, prefer_best=not args.current)
    if pdir is None:
        return 2

    score = base_score(pdir)
    if score is None:
        return 2
    print("  base score %d  (0 would mean the starting point already matches)"
          % score)
    if score == 0:
        print("\nthe starting point already scores 0 -- run trymatch to see")
        print("whether it matches at the byte level.")
        return 0

    if args.setup_only:
        rel = os.path.relpath(pdir, awlib.REPO).replace(os.sep, "/")
        print("\nsetup only. To run it yourself:")
        print("    wsl -d %s -e bash -c 'cd %s && "
              "python3 vendor/decomp-permuter/permuter.py %s'"
              % (agbenv.DISTRO, shq(agbenv.REPO_POSIX), shq(rel)))
        return 0

    run(pdir, args.seconds, args.threads)
    return verify(rec, pdir, args.keep)


if __name__ == "__main__":
    sys.exit(main())
