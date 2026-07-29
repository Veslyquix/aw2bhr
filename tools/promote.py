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


# name -> pool words its match depends on, filled by verify().
POOL_WORDS = {}


def verify(name):
    """True only if trymatch currently reports a byte-for-byte match.

    Also returns any `-fforce-addr` pool words the match DEPENDS ON being
    placed. trymatch prints them because a promotion that omits them either
    drops the word or shifts every address after it -- and that failure would
    surface in the split build, not here, with the function already moved.
    Parsing them out means the caller cannot forget.
    """
    proc = subprocess.run(
        [sys.executable, os.path.join(awlib.REPO, "tools", "trymatch.py"), name],
        cwd=awlib.REPO, capture_output=True, text=True, timeout=600,
        stdin=subprocess.DEVNULL)
    words = []
    for ln in proc.stdout.splitlines():
        m = re.search(r'"rodata": \[(.+?)\]', ln)
        if m:
            words = re.findall(r'0x[0-9A-Fa-f]{8}', m.group(1))
    if words:
        POOL_WORDS[name] = words
    return proc.returncode == 0, proc.stdout.strip().splitlines()[-1:], words


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
            j = doc_comment_start(lines, i)
            return lines[:j], lines[j:]
    return None, None


def doc_comment_start(lines, i):
    """Where the comment block documenting the definition at `lines[i]` begins.

    A comment written directly above a function is that function's
    documentation and has to travel with it into the body. Cutting at the
    definition line alone strands it in the declaration section, where it comes
    out above whichever declaration happens to merge first -- so `c_08063F98.c`
    ended up explaining how to copy a matrix directly above the function that
    loads the identity.
    """
    j = i
    while j > 0 and not lines[j - 1].strip():
        j -= 1
    if j == 0 or not lines[j - 1].strip().endswith("*/"):
        return i
    k = j - 1
    while k >= 0 and "/*" not in lines[k]:
        k -= 1
    return k if k >= 0 else i


def strip_comments(ln, in_comment):
    """(code with comments blanked out, whether a block comment is still open).

    Only the returned code is inspected for braces and terminators; the original
    line is what gets emitted. Every test below has to run on comment-free text,
    because comment prose is arbitrary and routinely contains `;`, `{` and `}`.
    """
    out, i, n = [], 0, len(ln)
    while i < n:
        if in_comment:
            end = ln.find("*/", i)
            if end < 0:
                break
            i, in_comment = end + 2, False
            continue
        start = ln.find("/*", i)
        line_c = ln.find("//", i)
        if line_c >= 0 and (start < 0 or line_c < start):
            out.append(ln[i:line_c])
            break
        if start < 0:
            out.append(ln[i:])
            break
        out.append(ln[i:start])
        i, in_comment = start + 2, True
    return "".join(out), in_comment


def decl_chunks(lines):
    """Split a declaration section into whole declarations.

    A chunk is one brace-balanced construct: a `struct X { ... };` block, a
    single `extern ...;` line, or one preprocessor directive -- together with any
    comment block sitting directly above it, which is the documentation for that
    declaration and has to travel with it. De-duplicating at line level instead
    silently destroys source -- two different structs both contain a line `{` and
    a line `};`, so dropping the repeats leaves the second one without its braces.

    Comment state is tracked explicitly rather than sniffed from the leading
    characters of each line. Two bugs came from not doing that, and they
    compounded: a comment whose prose ended in `;` closed the chunk mid-comment,
    and the continuation lines that followed were then discarded as stray
    comments because nothing was accumulated any more. `c_0806978C.c` was
    promoted with an unterminated comment swallowing the struct beneath it, and
    the agent's C was fine -- the draft in work/ compiled and matched. A
    directive was never a terminator either, so `#include "proc.h"` could not
    close its own chunk and glued itself onto the next declaration.
    """
    chunks, cur, depth = [], [], 0
    in_comment = False
    for ln in lines:
        raw = ln.strip()
        code, next_in_comment = strip_comments(ln, in_comment)
        s = code.strip()
        if not cur and not in_comment:
            if not raw or raw == INCLUDE_LINE.strip():
                continue
        cur.append(ln)
        depth += code.count("{") - code.count("}")
        was_open, in_comment = in_comment, next_in_comment
        if in_comment:
            continue
        if s.startswith("#") and depth <= 0:
            chunks.append("".join(cur))        # a directive is complete on its line
            cur, depth = [], 0
            continue
        if not s and (was_open or raw.startswith("/*")):
            continue                          # comment block; the decl follows
        if depth <= 0 and (s.endswith(";") or s.endswith("}")):
            chunks.append("".join(cur))
            cur, depth = [], 0
    if cur:
        chunks.append("".join(cur))
    return chunks


def chunk_key(chunk):
    """Identity of a declaration, ignoring its comments and whitespace.

    Two agents will document the same struct differently, and if the comment is
    part of the key those collapse to two definitions of one type -- which is a
    hard `redefinition of struct X` at compile time, not a cosmetic problem. The
    text kept is still the first occurrence's, comment included.
    """
    code, in_comment = [], False
    for ln in chunk.splitlines(keepends=True):
        part, in_comment = strip_comments(ln, in_comment)
        code.append(part)
    key = " ".join("".join(code).split())
    return key or " ".join(chunk.split())     # comment-only chunk: compare as-is


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
            key = chunk_key(chunk)
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
        ok, _, _ = verify(name)
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
        # Pool words this unit now emits itself. tools/split_rodata.py carves
        # them out of data/rodata.s or data/data.s so the C's copy is the only
        # one; without this the bytes would be in the ROM twice.
        words = sorted({w for n in run for w in POOL_WORDS.get(n, [])},
                       key=lambda w: int(w, 16))
        if words:
            entry["rodata"] = words
            print("      .rodata pool word(s): %s" % ", ".join(words))
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
            ok, tail, _ = verify(n)
            if not ok:
                print("refusing to promote %s -- it does not match" % n)
                for ln in tail:
                    print("  %s" % ln)
                return 1
    return promote(names, index)


if __name__ == "__main__":
    sys.exit(main())
