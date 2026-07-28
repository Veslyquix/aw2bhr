#!/usr/bin/env python3
"""Refresh stale work/<fn>/<fn>.c drafts from the promoted source.

Once a function is promoted, src/decomp/ is the truth and its work/ draft is
dead. The drafts do not stay harmless, though: most predate the shared headers
and still carry their own `extern`, so `trymatch` on one reports

    COMPILE FAILED ... conflicting types for `gUnknown_XXXXXXXX'

which reads as breakage and is not. That has now produced false alarms in three
separate sessions, and worse, it fires during the very check that is supposed
to prove a header widening safe -- `grep -rl <global> src/` names the promoted
files at risk, and running trymatch on them hits the stale draft rather than
the file you just edited.

So: run this after changing a shared type, then trymatch is meaningful again.

    python tools/sync_work.py                 # every promoted function
    python tools/sync_work.py sub_08016E74    # just these

Multi-function files are handled too. That used to be impossible here -- the
claim was that a promoted file could not be split back without re-deriving
where each function starts -- but promote.py already locates exactly those
boundaries on the way in, so this just runs its splitter backwards. It matters
more than it sounds: a third of promoted functions live in multi-function
files, so leaving them out meant the check that is supposed to prove a header
change safe silently skipped a third of the corpus.

`make SPLIT=1 compare` is still the check that cannot be fooled, and is worth
running after any shared-type change regardless.
"""

import json
import os
import re
import sys

import awlib
import promote

PROMOTED = os.path.join(awlib.DATA_DIR, "promoted.json")

# The generated banner names every function in the file, which is wrong on a
# single-function draft and confusing to read there.
BANNER = re.compile(r'/\* Promoted from assembly;.*?\*/\n+', re.S)


def split_unit(text, fns):
    """(shared declarations, {fn: body}) for one promoted file.

    Boundaries come from promote.doc_comment_start, the same function that put
    them there, so a comment written above a definition travels with it rather
    than being stranded on the previous function.
    """
    lines = text.splitlines(keepends=True)
    starts = {}
    for fn in fns:
        pat = re.compile(r'^\S.*\b%s\s*\(' % re.escape(fn))
        hit = next((i for i, ln in enumerate(lines) if pat.match(ln)), None)
        if hit is None:
            return None, None
        starts[fn] = promote.doc_comment_start(lines, hit)

    order = sorted(starts, key=lambda f: starts[f])
    head = BANNER.sub("", "".join(lines[:starts[order[0]]]), count=1)
    bodies = {}
    for k, fn in enumerate(order):
        end = starts[order[k + 1]] if k + 1 < len(order) else len(lines)
        bodies[fn] = "".join(lines[starts[fn]:end]).rstrip() + "\n"
    return head, bodies


def main(argv):
    wanted = set(argv[1:])
    with open(PROMOTED, encoding="utf-8") as fh:
        units = json.load(fh)

    synced, skipped, missing = [], [], []
    for unit in units:
        fns = unit["functions"]
        if wanted and not wanted & set(fns):
            continue
        src = os.path.join(awlib.REPO, unit["file"])
        if not os.path.isfile(src):
            missing.append(unit["file"])
            continue

        text = open(src, encoding="utf-8", newline="").read()
        if len(fns) == 1:
            drafts = {fns[0]: text}
        else:
            head, bodies = split_unit(text, fns)
            if head is None:
                skipped.append((unit["file"], len(fns)))
                continue
            drafts = {fn: head + body for fn, body in bodies.items()}

        for fn, body in drafts.items():
            if wanted and fn not in wanted:
                continue
            dst_dir = os.path.join(awlib.REPO, "work", fn)
            dst = os.path.join(dst_dir, fn + ".c")
            if os.path.isfile(dst) and open(dst, encoding="utf-8",
                                            newline="").read() == body:
                continue
            os.makedirs(dst_dir, exist_ok=True)
            with open(dst, "w", encoding="utf-8", newline="\n") as fh:
                fh.write(body)
            synced.append(fn)

    print("synced %d draft(s) from src/decomp/" % len(synced))
    for fn in synced[:20]:
        print("  " + fn)
    if len(synced) > 20:
        print("  ... and %d more" % (len(synced) - 20))
    if skipped:
        print("\n%d file(s) whose function boundaries could not be located --"
              " for these the check is `make SPLIT=1 compare`:" % len(skipped))
        for path, n in skipped[:10]:
            print("  %s (%d functions)" % (path, n))
    if missing:
        print("\nmissing source file(s): %s" % ", ".join(missing))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
