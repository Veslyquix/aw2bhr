#!/usr/bin/env python3
"""Scaffold a work directory for one matching attempt.

Creates work/<name>/ holding the target assembly, a stub .c, and a note of what
the function touches, so an agent can start writing C immediately instead of
rediscovering the same context every time.

The stub's signature is a guess, inferred from which argument registers are read
before they are written and whether r0 is set before returning. It is a starting
point and frequently wrong -- the ABI is not recoverable from one function in
isolation -- but wrong-and-concrete beats blank, and trymatch.py settles it.

    python tools/newfunc.py sub_08013AEC
    python tools/trymatch.py sub_08013AEC --diff
"""

import argparse
import json
import os
import re
import sys

import awlib

WORK = os.path.join(awlib.REPO, "work")
ARG_REGS = ["r0", "r1", "r2", "r3"]

# Instructions whose first operand is read, not written -- everything else is
# assumed to write its first operand, which is right for the ARM/THUMB subset
# agbcc emits.
READS_FIRST = re.compile(r'^(str|strb|strh|stm|push|cmp|cmn|tst|teq|b|bl|blx|bx|'
                         r'swi|svc)\b')


def infer_signature(fn):
    """(n_args, returns_value) from register use before definition."""
    written = set()
    n_args = 0
    returns = False
    for text in awlib.instructions(fn):
        mnem = text.split()[0].lower()
        ops = text.split(None, 1)[1] if " " in text else ""
        regs = re.findall(r'\br(?:[0-9]|1[0-5])\b', ops)
        if not regs:
            continue
        if READS_FIRST.match(mnem):
            reads, writes = regs, []
        else:
            reads, writes = regs[1:], regs[:1]
        for r in reads:
            if r in ARG_REGS and r not in written:
                n_args = max(n_args, ARG_REGS.index(r) + 1)
                written.add(r)          # counted once
        for r in writes:
            if r == "r0":
                returns = True
            written.add(r)
    return n_args, returns


def stub(fn, rec, n_args, returns):
    args = ", ".join("int a%d" % (i + 1) for i in range(n_args)) or "void"
    ret = "int" if returns else "void"
    body = "    return 0;" if returns else "    "
    notes = []
    if rec["calls"]:
        notes.append(" * calls: " + ", ".join(rec["calls"][:12]))
    if rec["data_refs"]:
        notes.append(" * touches: " + ", ".join(rec["data_refs"][:12]))
    note_block = ("/*\n" + "\n".join(notes) + "\n */\n") if notes else ""

    return (
        '#include "global.h"\n\n'
        '%s'
        '/* %s @ %s, %d bytes, %s.\n'
        ' * Signature below is inferred from register use and may be wrong.\n'
        ' */\n'
        '%s %s(%s)\n{\n%s\n}\n'
        % (note_block, fn, rec["addr_hex"], rec["size"], rec["mode"],
           ret, fn, args, body))


def create(name, force=False):
    with open(os.path.join(awlib.DATA_DIR, "functions.json"), encoding="utf-8") as fh:
        recs = json.load(fh)
    key = name.strip().lower()
    rec = next((r for r in recs if r["name"].lower() == key
                or r["addr_hex"].lower() == key), None)
    if rec is None:
        print("error: no function %r in the index" % name)
        return 1

    fn = rec["name"]
    index = {}
    for af in awlib.load_all():
        for f in af.funcs:
            index[f.name] = f
    parsed = index.get(fn)
    if parsed is None:
        print("error: %s not found in asm/*.s" % fn)
        return 1

    d = os.path.join(WORK, fn)
    os.makedirs(d, exist_ok=True)

    awlib.write_text(os.path.join(d, "target.s"), parsed.text)

    csrc = os.path.join(d, fn + ".c")
    if os.path.exists(csrc) and not force:
        print("kept existing %s (use --force to overwrite)"
              % os.path.relpath(csrc, awlib.REPO))
    else:
        n_args, returns = infer_signature(parsed)
        awlib.write_text(csrc, stub(fn, rec, n_args, returns))

    fe = None
    fe_path = os.path.join(awlib.DATA_DIR, "fe_matches.json")
    if os.path.exists(fe_path):
        with open(fe_path, encoding="utf-8") as fh:
            fe = next((h["fe_name"] for h in json.load(fh)["matches"]
                       if h["name"] == fn), None)

    rel = os.path.relpath(d, awlib.REPO)
    print("%s  %s  %d bytes  %s  difficulty %s"
          % (fn, rec["addr_hex"], rec["size"], rec["mode"], rec["difficulty"]))
    print("  %s/target.s   the original assembly" % rel)
    print("  %s/%s.c   stub to fill in" % (rel, fn))
    if fe:
        print("  identified as %s in the Fire Emblem decomps -- start from their C"
              % fe)
    print("\n  python tools/trymatch.py %s --diff" % fn)
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", help="function name or address")
    ap.add_argument("--force", action="store_true",
                    help="overwrite an existing stub")
    args = ap.parse_args()
    return create(args.name, force=args.force)


if __name__ == "__main__":
    sys.exit(main())
