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

Only single-function files are synced. A promoted file holding several
functions cannot be split back into per-function drafts without re-deriving
where each one starts, and the honest check for those is `make SPLIT=1 compare`,
which covers every promoted file at once and cannot be fooled.
"""

import json
import os
import sys

import awlib

PROMOTED = os.path.join(awlib.DATA_DIR, "promoted.json")


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
        if len(fns) != 1:
            skipped.append((unit["file"], len(fns)))
            continue
        if not os.path.isfile(src):
            missing.append(unit["file"])
            continue
        fn = fns[0]
        dst_dir = os.path.join(awlib.REPO, "work", fn)
        dst = os.path.join(dst_dir, fn + ".c")
        body = open(src, encoding="utf-8", newline="").read()
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
        print("\n%d multi-function file(s) left alone -- for these the check is"
              " `make SPLIT=1 compare`:" % len(skipped))
        for path, n in skipped[:10]:
            print("  %s (%d functions)" % (path, n))
    if missing:
        print("\nmissing source file(s): %s" % ", ".join(missing))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
