#!/usr/bin/env python3
"""Flatten the headers into one file: agent prompt context and permuter input.

decomp-permuter's import.py needs a single self-contained translation unit, and
an agent drafting C needs to see every available type and prototype without
opening nine files. Both wants are served by running the real preprocessor with
the real include flags, so what comes out is exactly what the compiler sees --
including whatever `global.h` pulls in transitively.

Usage:
    python tools/gen_context.py [-o build/context.c]
"""

import argparse
import os
import sys

import agbenv
import awlib

DEFAULT_OUT = os.path.join("build", "context.c")
HEADERS = ["global.h", "hardware.h", "oam.h", "proc.h", "types.h",
           "unknown-functions.h"]


def build(out_rel):
    include_dir = os.path.join(awlib.REPO, "include")
    present = [h for h in HEADERS if os.path.exists(os.path.join(include_dir, h))]
    missing = [h for h in HEADERS if h not in present]
    if missing:
        print("note: not present, skipped: %s" % ", ".join(missing))

    stub = "build/_context_stub.c"
    body = "".join('#include "%s"\n' % h for h in present)
    awlib.write_text(os.path.join(awlib.REPO, stub), body)

    f = agbenv.flags()
    rc, so, se = agbenv.run(
        'mkdir -p "$(dirname %s)"\n%s %s %s -o %s'
        % (out_rel, f["CPP"], f["CPPFLAGS"], stub, out_rel))
    if rc != 0:
        print("FAIL preprocessor returned %d\n%s" % (rc, se[-2000:]))
        return 1

    path = os.path.join(awlib.REPO, out_rel)
    text = open(path, encoding="utf-8", errors="replace").read()
    # Line markers are noise in a prompt and the permuter does not need them.
    kept = [ln for ln in text.splitlines(keepends=True)
            if not ln.startswith("#")]
    awlib.write_text(path, "".join(kept))

    n_lines = len(kept)
    print("wrote %s  (%d headers -> %,d lines)".replace("%,d", "{:,}")
          .format(n_lines) % (out_rel, len(present)))
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-o", "--out", default=DEFAULT_OUT)
    args = ap.parse_args()
    return build(args.out.replace("\\", "/"))


if __name__ == "__main__":
    sys.exit(main())
