#!/usr/bin/env python3
"""Publish the unmatched drafts from work/ into wip/, which is tracked.

work/ is gitignored and runs to gigabytes of objects, listings and permuter
output, so none of the drafts behind the parked functions have ever been
visible to anyone outside this checkout. This copies the parts a contributor
needs -- the draft, the closest attempt, the notes, the target assembly -- and
writes a README per function from its data/parked.json entry, so what has
already been ruled out travels with the draft.

    python tools/export_wip.py              # rebuild wip/ from work/
    python tools/export_wip.py --restore    # copy wip/ drafts into work/
    python tools/export_wip.py --restore sub_0803D558

The set is every parked function plus every function still `asm` in
data/functions.json. wip/ is rebuilt from scratch, so a function that matched
since the last run drops out. Run it at wave end, after the parked.json edits.

best.c is exported only when it differs from the draft and still includes the
project headers. The header-expanded form the permuter leaves behind (~190KB
of preprocessed source for 23 functions at the time of writing) is not
something anyone can edit or promote, so its score is shown but flagged.

--restore never overwrites a file already in work/. best.json travels with
best.c for the same reason: without it, trymatch's first compile of the draft
replaces best.c.

Every draft is also COMPILED (read-only, through tools/drafts.py, into
build/drafts/) and one that does not compile against today's headers is
flagged in its README and in the table. Wave 90 found that after PR #3's
renames 46 of 101 exported drafts did not compile, and wip/ had been handing
them to contributors as if they did.

    python tools/export_wip.py --check-only        # list non-compiling drafts, write nothing
    python tools/export_wip.py --no-compile-check  # skip the compile (fast)
"""

import argparse
import hashlib
import json
import os
import re
import shutil
import sys

import awlib

WIP = os.path.join(awlib.REPO, "wip")
WORK = os.path.join(awlib.REPO, "work")
FN_DIR_RE = re.compile(r'^sub_[0-9A-F]{8}$')

# parked.json field -> heading. Anything not listed is rendered under its key.
HEADINGS = [
    ("best", "Best so far"),
    ("remaining_diff", "What still differs"),
    ("why_it_is_close", "Why it is close"),
    ("axes_ruled_out", "Already ruled out"),
    ("ruled_out", "Already ruled out"),
    ("settled_by_this_attempt", "Settled"),
    ("what_is_left_to_try", "Left to try"),
    ("open_question", "Open question"),
    ("reason", "Why it is parked"),
]
SKIP_KEYS = {"bytes", "summary"}

# The plain-language `summary` object in a parked entry (docs/writing-notes.md),
# in the order the README shows it.
SUMMARY_HEADINGS = [
    ("does", "What it does"),
    ("status", "How close it is"),
    ("left", "What is left"),
    ("tried", "Already tried"),
]


def load_state():
    funcs = {f["name"]: f for f in
             json.load(open(os.path.join(awlib.DATA_DIR, "functions.json"),
                            encoding="utf-8"))}
    parked = json.load(open(os.path.join(awlib.DATA_DIR, "parked.json"),
                            encoding="utf-8"))["functions"]
    return funcs, parked


def wip_names(funcs, parked):
    names = set(parked) | {n for n, f in funcs.items() if f["status"] == "asm"}
    for n in sorted(names):
        if funcs.get(n, {}).get("status") == "matched":
            print("  !! %s is matched but still in parked.json -- delete the "
                  "entry; left out of wip/" % n)
    return sorted(n for n in names
                  if n in funcs and funcs[n]["status"] != "matched")


def read(path):
    with open(path, "rb") as fh:
        return fh.read()


def best_state(name):
    """(label for the best score, sort key, whether best.c is exported)."""
    w = os.path.join(WORK, name)
    draft, best = os.path.join(w, name + ".c"), os.path.join(w, "best.c")
    try:
        meta = json.load(open(os.path.join(w, "best.json"), encoding="utf-8"))
    except (OSError, ValueError):
        meta = {}
    pct = meta.get("percent")
    if pct is None or not os.path.exists(best):
        return "not measured", -1.0, False
    text = read(best)
    label = "%.1f%%" % pct
    if meta.get("exact_size") is False and meta.get("size_delta"):
        label += ", %+d bytes" % meta["size_delta"]
    want = meta.get("source_sha1")
    if want and hashlib.sha1(text).hexdigest() != want:
        return label + " (unverified)", pct, False
    if os.path.exists(draft) and text == read(draft):
        return label, pct, False
    if b"#include" not in text:
        return label + " (preprocessed form, not included)", pct, False
    return label + " (best.c)", pct, True


def render_value(v):
    if isinstance(v, list):
        return "\n".join("- " + render_value(x).replace("\n", "\n  ") for x in v)
    if isinstance(v, dict):
        return "\n".join("- **%s:** %s" % (k, render_value(x)) for k, x in v.items())
    return str(v).strip()


def render_summary(summary):
    out = []
    for key, heading in SUMMARY_HEADINGS:
        if summary.get(key):
            out.append("## %s\n\n%s\n" % (heading, render_value(summary[key])))
    return out


def render_parked(entry):
    if entry is None:
        return ("Not parked. This one is still in the queue and has not been "
                "worked to a stopping point yet.\n")
    if isinstance(entry, str):
        return entry.strip() + "\n"
    out, seen = [], set()
    for key, heading in HEADINGS:
        if key in entry and key not in seen:
            out.append("### %s\n\n%s\n" % (heading, render_value(entry[key])))
            seen.add(key)
    for key, v in entry.items():
        if key not in seen and key not in SKIP_KEYS:
            out.append("### %s\n\n%s\n" % (pretty_key(key), render_value(v)))
    return "\n".join(out)


def pretty_key(key):
    """`wave87` -> `Wave 87`, `park_kind` -> `Park kind`."""
    if key in ("note", "notes"):
        return "Notes"
    key = re.sub(r'^wave_?(\d+)', r'wave \1', key).replace("_", " ")
    return key[:1].upper() + key[1:]


def compile_states(names, workers=4):
    """{fn: first error} for every draft that does NOT compile today.

    Compiles into build/drafts/ (tools/drafts.py), never into work/, so it is
    safe to run while agents are working.
    """
    import concurrent.futures
    import drafts

    def one(n):
        b = drafts.build(n, drafts.draft_rel(n), "export-check")
        return n, (None if b.ok else drafts.first_error(b.err))
    bad = {}
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as ex:
        for n, err in ex.map(one, names):
            if err is not None:
                bad[n] = err
    return bad


def export_one(name, rec, entry, broken=None):
    src, dst = os.path.join(WORK, name), os.path.join(WIP, name)
    if os.path.isdir(dst):
        shutil.rmtree(dst)
    os.makedirs(dst)
    label, pct, with_best = best_state(name)

    files = []
    for fname, what in [(name + ".c", "the current draft"),
                        ("best.c", "the closest attempt, when it is not the draft"),
                        ("NOTES.md", "working notes"),
                        ("target.s", "the original assembly")]:
        p = os.path.join(src, fname)
        if fname == "best.c" and not with_best:
            continue
        if os.path.exists(p):
            shutil.copyfile(p, os.path.join(dst, fname))
            files.append("- `%s`: %s" % (fname, what))
    if with_best:
        shutil.copyfile(os.path.join(src, "best.json"),
                        os.path.join(dst, "best.json"))

    status = "parked" if entry is not None else "queued"
    warn = ""
    if broken:
        status += ", does not compile"
        warn = ("**This draft does not compile against the current headers.** "
                "The score below is from before the break. Fix it first:\n\n"
                "    %s\n" % broken)
    summary = entry.get("summary") if isinstance(entry, dict) else None
    body = ["# %s\n" % name,
            "%s, %d bytes, %s, %s.\n" % (rec["addr_hex"], rec["size"],
                                         rec["mode"], status),
            warn,
            "Best score so far: %s.\n" % label]
    if summary:
        # The plain-language summary (docs/writing-notes.md) leads; the full
        # technical record stays available but collapsed.
        body += render_summary(summary)
        body += ["## Files\n", "\n".join(files) + "\n",
                 "## Technical history\n",
                 "<details>\n<summary>The full record from `data/parked.json`: "
                 "every attempt, with compiler detail.</summary>\n",
                 render_parked(entry), "</details>\n"]
    else:
        body += ["## Files\n", "\n".join(files) + "\n",
                 "## What has been tried\n",
                 "From `data/parked.json`.\n" if entry is not None else "",
                 render_parked(entry)]
    awlib.write_text(os.path.join(dst, "README.md"),
                     "\n".join(b for b in body if b))
    return label, pct, status


def export(compile_check=True, check_only=False):
    funcs, parked = load_state()
    names = wip_names(funcs, parked)
    have = [n for n in names if os.path.exists(os.path.join(WORK, n, n + ".c"))]
    broken = compile_states(have) if compile_check else {}
    if compile_check:
        print("compile check: %d of %d drafts do not compile" % (len(broken), len(have)))
        for n in sorted(broken):
            print("  %-16s %s" % (n, broken[n][:140]))
    if check_only:
        return
    os.makedirs(WIP, exist_ok=True)
    for d in os.listdir(WIP):
        if FN_DIR_RE.match(d) and d not in names:
            shutil.rmtree(os.path.join(WIP, d))

    rows, missing = [], []
    for n in names:
        if not os.path.exists(os.path.join(WORK, n, n + ".c")):
            missing.append(n)
            continue
        label, pct, status = export_one(n, funcs[n], parked.get(n), broken.get(n))
        rows.append((pct, funcs[n]["addr"], n, funcs[n]["size"], label, status))
    rows.sort(key=lambda r: (-r[0], r[1]))

    total = sum(r[3] for r in rows)
    table = "\n".join("| [%s](%s/) | %d | %s | %s |" % (n, n, size, label, status)
                      for _, _, n, size, label, status in rows)
    note = ""
    if broken:
        note = ("\n**%d of these drafts do not compile** against the current "
                "headers (marked `does not compile` below). A header rename broke "
                "them; each one's README gives the first error.\n" % len(broken))
    elif not compile_check:
        note = "\n(Not compile-checked in this export.)\n"
    awlib.write_text(os.path.join(WIP, "README.md"), README % {
        "count": len(rows), "bytes": total, "table": table, "broken_note": note})
    print("wip/: %d functions, %d bytes" % (len(rows), total))
    if missing:
        print("  no draft in work/, not exported: %s" % ", ".join(missing))


def restore(only):
    names = only or sorted(d for d in os.listdir(WIP) if FN_DIR_RE.match(d))
    copied = 0
    for n in names:
        src = os.path.join(WIP, n)
        if not os.path.isdir(src):
            print("  %s: not in wip/" % n)
            continue
        dst = os.path.join(WORK, n)
        os.makedirs(dst, exist_ok=True)
        for fname in os.listdir(src):
            if fname == "README.md" or os.path.exists(os.path.join(dst, fname)):
                continue
            shutil.copyfile(os.path.join(src, fname), os.path.join(dst, fname))
            copied += 1
    print("restored %d files into work/" % copied)


README = """\
# Work in progress

Functions that are still assembly, with the C written for them so far. None of
these match yet. Each folder has the current draft, the closest attempt when it
is a different file, any working notes, the original assembly, and a README
listing what has already been tried.

This folder is regenerated by `tools/export_wip.py` after each wave, so changes
made directly here will be overwritten. Work in `work/` instead.

## Trying one

```sh
python3 tools/export_wip.py --restore sub_XXXXXXXX
python3 tools/trymatch.py sub_XXXXXXXX --diff
```

`--restore` copies the files into `work/<name>/`, which is where `trymatch.py`
looks. It never overwrites a file already there. Leave out the name to restore
all of them.

Read the function's README before starting. Most of these have been attempted
more than once, and the "Already ruled out" list will save you repeating those
attempts.

A match is `trymatch.py` exiting 0. Send the draft in a pull request, or promote
it yourself as described under Contributing in the main README.

## Functions

%(count)d functions, %(bytes)d bytes, closest first. The score is the share of
bytes identical to the original. A byte count after it means the attempt
compiles to a different size.
%(broken_note)s
| function | bytes | best so far | state |
|---|---|---|---|
%(table)s
"""


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--restore", action="store_true",
                    help="copy wip/ drafts into work/ instead of exporting")
    ap.add_argument("names", nargs="*", help="with --restore: just these")
    ap.add_argument("--no-compile-check", action="store_true",
                    help="do not compile the drafts (no 'does not compile' flags)")
    ap.add_argument("--check-only", action="store_true",
                    help="only report drafts that do not compile; write nothing")
    args = ap.parse_args()
    if args.restore:
        restore(args.names)
    elif args.names:
        ap.error("names are only used with --restore")
    else:
        export(compile_check=not args.no_compile_check, check_only=args.check_only)


if __name__ == "__main__":
    sys.exit(main())
