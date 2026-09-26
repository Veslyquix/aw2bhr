#!/usr/bin/env python3
"""Prove that an edit to C sources changed comments and whitespace only.

Documentation passes rewrite thousands of comments in src/ and include/. A
comment can never change the ROM, but a slip that touches code can -- and in a
header it can change every file that includes it. This compares each file
against a git revision with comments removed and whitespace collapsed; any
difference that survives is a code change.

    python tools/comment_check.py                 # every .c/.h changed since HEAD
    python tools/comment_check.py --rev f64737a   # ... since that commit
    python tools/comment_check.py src/decomp/c_0802E010.c include/map.h

Exit 0: every file differs from the revision in comments/whitespace only.
Exit 1: at least one file changed code (listed with the first differing text).
"""
import os
import subprocess
import sys

import awlib


def strip_c(text):
    """Remove /* */ and // comments, leaving string and char literals alone,
    then collapse all whitespace so re-flowed blank lines do not count."""
    out, i, n = [], 0, len(text)
    while i < n:
        c = text[i]
        if c == "/" and text.startswith("/*", i):
            j = text.find("*/", i + 2)
            i = n if j < 0 else j + 2
            out.append(" ")
        elif c == "/" and text.startswith("//", i):
            j = text.find("\n", i)
            i = n if j < 0 else j
        elif c in "\"'":
            j = i + 1
            while j < n and text[j] != c:
                j += 2 if text[j] == "\\" else 1
            out.append(text[i:j + 1])
            i = j + 1
        else:
            out.append(c)
            i += 1
    return " ".join("".join(out).split())


def git(*args):
    return subprocess.run(["git", *args], cwd=awlib.REPO, capture_output=True,
                          text=True, encoding="utf-8", errors="replace")


def first_difference(a, b):
    k = next((i for i, (x, y) in enumerate(zip(a, b)) if x != y), min(len(a), len(b)))
    return a[max(0, k - 40):k + 40], b[max(0, k - 40):k + 40]


def main(argv):
    rev = "HEAD"
    if "--rev" in argv:
        k = argv.index("--rev")
        rev = argv[k + 1]
        argv = argv[:k] + argv[k + 2:]
    paths = [p.replace("\\", "/") for p in argv[1:]]
    if not paths:
        res = git("diff", "--name-only", rev, "--", "*.c", "*.h")
        paths = [p for p in res.stdout.split() if p]
    bad, checked = [], 0
    for path in paths:
        full = os.path.join(awlib.REPO, path)
        if not os.path.exists(full):
            continue
        old = git("show", "%s:%s" % (rev, path))
        if old.returncode != 0:
            print("  new file (no %s version): %s" % (rev, path))
            continue
        checked += 1
        a = strip_c(old.stdout)
        b = strip_c(open(full, encoding="utf-8", errors="replace").read())
        if a != b:
            bad.append((path, first_difference(a, b)))
    for path, (was, now) in bad:
        print("CODE CHANGED  %s\n    was: ...%s...\n    now: ...%s..." % (path, was, now))
    print("comment_check: %d file(s) checked against %s, %d with code changes"
          % (checked, rev, len(bad)))
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
