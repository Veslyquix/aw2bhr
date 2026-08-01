#!/usr/bin/env python3
"""Undo line-ending churn: restore each unchanged line's ORIGINAL ending.

Several repo files have MIXED line endings in git -- docs/agbcc-codegen.md is
CRLF with 723 bare-LF lines among them, and data/parked.json is CRLF throughout.
An agent that rewrites such a file wholesale (a heredoc, a read-modify-write, a
"normalise while I'm here") re-terminates every line, and git then reports every
line as changed.

Wave 32 hit this four times on one file. A 198-line addition showed up as
921 insertions / 724 deletions, and a later 111-line one as 969/858 -- the
finding buried in churn nobody can review. Wave 30 hit the same thing on
data/parked.json (425/379 for a five-entry change).

This does NOT touch content. It diffs the working file against HEAD ignoring
line endings, then rewrites it so every line that did not change keeps exactly
the ending it had in HEAD; genuinely new lines keep whatever they were written
with. If the content differs, the content still differs afterwards -- only the
invisible half of the diff is reverted.

    python tools/fix_eol.py                       # every tracked text file
    python tools/fix_eol.py docs/agbcc-codegen.md # just this one
    python tools/fix_eol.py --check               # report, change nothing

Exit status is 1 under --check if any file has churn, so it can gate a commit.
"""

import argparse
import difflib
import os
import subprocess
import sys

import awlib

SKIP_EXT = {".gba", ".png", ".bin", ".o", ".elf", ".map"}


def head_bytes(path):
    p = subprocess.run(["git", "show", "HEAD:%s" % path],
                       capture_output=True, cwd=awlib.REPO)
    return p.stdout if p.returncode == 0 else None


def ending(line):
    if line.endswith("\r\n"):
        return "\r\n"
    return "\n" if line.endswith("\n") else ""


def churn(old_raw, new_raw):
    """(restored bytes, changed-line count) or (None, 0) if nothing to do."""
    try:
        old_lines = old_raw.decode("utf-8").splitlines(keepends=True)
        new_lines = new_raw.decode("utf-8").splitlines(keepends=True)
    except UnicodeDecodeError:
        return None, 0
    old_txt = [l.rstrip("\r\n") for l in old_lines]
    new_txt = [l.rstrip("\r\n") for l in new_lines]

    out, fresh = [], 0
    sm = difflib.SequenceMatcher(None, old_txt, new_txt, autojunk=False)
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == "equal":
            for k in range(j2 - j1):
                out.append(new_txt[j1 + k] + ending(old_lines[i1 + k]))
        elif tag in ("insert", "replace"):
            for k in range(j1, j2):
                out.append(new_txt[k] + (ending(new_lines[k]) or "\r\n"))
                fresh += 1
    return "".join(out).encode("utf-8"), fresh


def tracked():
    p = subprocess.run(["git", "diff", "--name-only", "HEAD"],
                       capture_output=True, text=True, cwd=awlib.REPO)
    return [f for f in p.stdout.split()
            if os.path.splitext(f)[1].lower() not in SKIP_EXT]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("paths", nargs="*")
    ap.add_argument("--check", action="store_true",
                    help="report churn, change nothing (exit 1 if any)")
    args = ap.parse_args()

    dirty = 0
    for rel in (args.paths or tracked()):
        full = os.path.join(awlib.REPO, rel)
        if not os.path.isfile(full):
            continue
        old = head_bytes(rel)
        if old is None:
            continue                      # new file, no baseline to restore
        with open(full, "rb") as fh:
            cur = fh.read()
        if old == cur:
            continue
        fixed, fresh = churn(old, cur)
        if fixed is None or fixed == cur:
            continue
        # Lines that differ between the file as written and the file with
        # original endings restored are, by construction, pure ending churn.
        noise = sum(1 for a, b in zip(cur.splitlines(keepends=True),
                                      fixed.splitlines(keepends=True))
                    if a != b)
        dirty += 1
        print("%-40s %d line(s) differ ONLY by their ending" % (rel, noise))
        print("     the real change is %d new/changed line(s)" % fresh)
        if not args.check:
            with open(full, "wb") as fh:
                fh.write(fixed)
            print("     restored (content untouched)")

    if not dirty:
        print("no line-ending churn")
    elif args.check:
        print("run `python tools/fix_eol.py` to restore before committing")
    return 1 if (dirty and args.check) else 0


if __name__ == "__main__":
    sys.exit(main())
