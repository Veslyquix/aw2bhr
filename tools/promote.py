#!/usr/bin/env python3
"""Promote matched C out of work/ and into the build.

A function only counts once the ROM is built from its C instead of its assembly.
This performs that swap and records it in data/promoted.json, which split_asm.py
and gen_lds.py read to route the address slot to the C object.

asm/ is deliberately left alone. Because the build already assembles per-function
units, promoting means "stop emitting this unit and link the C object at its
address" -- not "delete the original". The assembly stays as reference, the split
still reconstructs it byte-for-byte, and the upstream monolithic build keeps
working untouched, which is a second independent check that the ROM is right.

Two constraints the linker imposes, both enforced here:

  * A .c file occupies one contiguous address range, because the linker script
    places its .text as a single unit. Functions are therefore grouped into runs
    of adjacent addresses, one file per run.
  * A promoted run cannot share a split unit with a function that is still
    assembly, since the unit is emitted or not as a whole.

Nothing is promoted unless tools/trymatch.py currently says it matches.

    python tools/promote.py sub_08013AEC sub_08013AFC
    python tools/promote.py --all-matched
"""

import argparse
import json
import os
import re
import subprocess
import sys

import awlib

WORK = os.path.join(awlib.REPO, "work")
DECOMP_DIR = os.path.join(awlib.REPO, "src", "decomp")
PROMOTED = os.path.join(awlib.DATA_DIR, "promoted.json")
INCLUDE_LINE = '#include "global.h"\n'


def load_index():
    path = os.path.join(awlib.DATA_DIR, "functions.json")
    with open(path, encoding="utf-8") as fh:
        return {r["name"]: r for r in json.load(fh)}


def load_promoted():
    if not os.path.exists(PROMOTED):
        return []
    with open(PROMOTED, encoding="utf-8") as fh:
        return json.load(fh)


def verify(name):
    """True only if trymatch currently reports a byte-for-byte match."""
    proc = subprocess.run(
        [sys.executable, os.path.join(awlib.REPO, "tools", "trymatch.py"), name],
        cwd=awlib.REPO, capture_output=True, text=True, timeout=600,
        stdin=subprocess.DEVNULL)
    return proc.returncode == 0, proc.stdout.strip().splitlines()[-1:]


def split_source(name, text):
    """(declarations, body) for one work file.

    The body starts at the function's definition line; everything above it is
    includes, externs and struct definitions, which are merged and de-duplicated
    across the files sharing a translation unit.
    """
    lines = text.splitlines(keepends=True)
    pat = re.compile(r'^\S.*\b%s\s*\(' % re.escape(name))
    for i, ln in enumerate(lines):
        if pat.match(ln):
            return lines[:i], lines[i:]
    return None, None


def decl_chunks(lines):
    """Split a declaration section into whole declarations.

    A chunk is one brace-balanced construct: a `struct X { ... };` block or a
    single `extern ...;` line. De-duplicating at line level instead silently
    destroys source -- two different structs both contain a line `{` and a line
    `};`, so dropping the repeats leaves the second one without its braces.
    """
    chunks, cur, depth = [], [], 0
    for ln in lines:
        s = ln.strip()
        if not s and not cur:
            continue
        if s == INCLUDE_LINE.strip():
            continue
        if s.startswith("/*") or s.startswith("*") or s.startswith("//"):
            if not cur:
                continue                      # stray comment between decls
        cur.append(ln)
        depth += ln.count("{") - ln.count("}")
        if depth <= 0 and (s.endswith(";") or s.endswith("}")):
            chunks.append("".join(cur))
            cur, depth = [], 0
    if cur:
        chunks.append("".join(cur))
    return chunks


def merge(run, index):
    """One .c source for a contiguous run of functions."""
    decls, bodies = [], []
    seen = set()
    for name in run:
        path = os.path.join(WORK, name, name + ".c")
        text = "".join(awlib.read_lines(path))
        head, body = split_source(name, text)
        if head is None:
            return None, "could not locate the definition of %s in %s" % (
                name, os.path.relpath(path, awlib.REPO))
        for chunk in decl_chunks(head):
            key = " ".join(chunk.split())     # whitespace-insensitive identity
            if key not in seen:
                seen.add(key)
                decls.append(chunk)
        bodies.append("".join(body).rstrip() + "\n")

    addrs = ", ".join("%s @ %s" % (n, index[n]["addr_hex"]) for n in run)
    header = (INCLUDE_LINE + "\n"
              "/* Promoted from assembly; each function below is byte-for-byte\n"
              " * identical to the original. Order is address order and must\n"
              " * stay that way -- the linker places this file's .text as one\n"
              " * contiguous block at %s.\n"
              " * %s\n */\n\n" % (index[run[0]]["addr_hex"], addrs))
    return header + "".join(decls) + ("\n" if decls else "") + \
        "\n".join(bodies), None


def contiguous_runs(names, index):
    """Split names into runs where each function abuts the next in memory."""
    ordered = sorted(names, key=lambda n: index[n]["addr"])
    runs, cur = [], []
    for n in ordered:
        if cur:
            prev = index[cur[-1]]
            if prev["addr"] + prev["size"] != index[n]["addr"]:
                runs.append(cur)
                cur = []
        cur.append(n)
    if cur:
        runs.append(cur)
    return runs


def all_matched(index):
    """Every function with a candidate in work/ that currently matches."""
    if not os.path.isdir(WORK):
        return []
    already = {n for e in load_promoted() for n in e["functions"]}
    out = []
    for name in sorted(os.listdir(WORK)):
        if name not in index or name in already:
            continue          # checking a promoted function again is just noise
        if not os.path.exists(os.path.join(WORK, name, name + ".c")):
            continue
        ok, _ = verify(name)
        print("  %-22s %s" % (name, "match" if ok else "does not match, skipped"))
        if ok:
            out.append(name)
    return out


def promote(names, index):
    existing = load_promoted()
    already = {n for e in existing for n in e["functions"]}
    names = [n for n in names if n not in already]
    if not names:
        print("nothing to promote (all already promoted)")
        return 0

    os.makedirs(DECOMP_DIR, exist_ok=True)
    added = []
    for run in contiguous_runs(names, index):
        text, err = merge(run, index)
        if err:
            print("error: %s" % err)
            return 1
        stem = "c_%s" % index[run[0]]["addr_hex"][2:]
        rel = "src/decomp/%s.c" % stem
        awlib.write_text(os.path.join(awlib.REPO, rel), text)
        entry = {
            "file": rel,
            "obj": "src/decomp/%s.o" % stem,
            "addr_hex": index[run[0]]["addr_hex"],
            "functions": run,
            "size": sum(index[n]["size"] for n in run),
        }
        existing.append(entry)
        added.append(entry)
        print("  %s  <-  %s (%d bytes)"
              % (rel, ", ".join(run), entry["size"]))

    existing.sort(key=lambda e: int(e["addr_hex"], 16))
    awlib.write_text(PROMOTED, json.dumps(existing, indent=1) + "\n")

    n_fn = sum(len(e["functions"]) for e in added)
    print("\npromoted %d function(s) into %d file(s)" % (n_fn, len(added)))
    print("\nnow rebuild and prove the ROM is unchanged:")
    print("  python tools/split_asm.py && python tools/gen_lds.py")
    print("  make SPLIT=1 compare")
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("names", nargs="*")
    ap.add_argument("--all-matched", action="store_true",
                    help="promote every function in work/ that currently matches")
    args = ap.parse_args()

    index = load_index()
    if args.all_matched:
        print("checking candidates in work/ ...")
        names = all_matched(index)
        if not names:
            print("no matching candidates found")
            return 1
    else:
        names = args.names
        if not names:
            ap.error("give function names or --all-matched")
        for n in names:
            if n not in index:
                print("error: %s is not in the index" % n)
                return 1
            ok, tail = verify(n)
            if not ok:
                print("refusing to promote %s -- it does not match" % n)
                for ln in tail:
                    print("  %s" % ln)
                return 1
    return promote(names, index)


if __name__ == "__main__":
    sys.exit(main())
