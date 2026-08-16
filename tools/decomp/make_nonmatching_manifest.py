#!/usr/bin/env python3
"""Regenerate the expected-size manifests for asm/nonmatching/{design,proc}.

Each file under asm/nonmatching/<group>/ holds one function (or a small group of
functions that had to be kept together, see do_split.py) -- its expected size is used by
fix_section_padding.py to trim the trailing padding GNU as adds when a function that used
to flow straight into its neighbour is assembled as its own object (see that script for
why). That size must come from the *original, complete* address sequence for the group,
not from gaps between whatever files currently happen to be sitting in the directory --
once a function is pulled out into C (leaving a gap in the directory listing), computing
sizes from "next file in this directory" would wrongly inflate whatever asm file used to
be its neighbour. tools/decomp/reference/*.s hold the original, pre-split, pre-any-rename
dumps (from a state of the repo where `make compare` passed) purely as an address map --
they are not built or kept in sync with renames, just re-fetch from an early commit
(e.g. `git show <commit>:asm/code-XXXXXXXX.s`) if a group's boundary ever needs revisiting.

Run this after adding/removing/renaming a file in asm/nonmatching/design/ or .../proc/
(e.g. after pulling a function out into C).
"""
import glob
import json
import os
import re
import subprocess
import sys

LABEL_ADDR_RE = re.compile(r'^(\w+):\s*@\s*(0x[0-9A-Fa-f]+)')

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# (group dir name, commit:path to fetch a pristine dump from, end address == start of
# whatever comes right after this group in aw2bhr.lds -- fixed as long as that neighbor
# doesn't move). Any commit before the group was ever split works, since this is purely
# used as an address map, not built.
GROUPS = [
    ('design', 'c88204e:asm/code-0800119C.s', 0x0801C878),
    ('proc', 'c88204e:asm/code-0801D390.s', 0x0808BBBC),
]


def git_show(spec):
    return subprocess.run(
        ['git', 'show', spec], cwd=ROOT, capture_output=True, text=True, check=True
    ).stdout


def all_addrs(text):
    """Every function-start address appearing anywhere in some asm text, in file order."""
    addrs = []
    for line in text.splitlines():
        m = LABEL_ADDR_RE.match(line)
        if m:
            addrs.append(int(m.group(2), 16))
    return addrs


def build(group_dir, git_spec, end_addr):
    ref_addrs = sorted(set(all_addrs(git_show(git_spec))))

    manifest = {}
    for path in glob.glob(os.path.join(group_dir, '*.s')):
        with open(path) as f:
            addrs_in_file = all_addrs(f.read())
        if not addrs_in_file:
            raise SystemExit(f"no address found in {path}")
        start = min(addrs_in_file)
        last = max(addrs_in_file)

        # find what comes right after `last` in the pristine original sequence
        idx = ref_addrs.index(last) if last in ref_addrs else None
        if idx is None:
            raise SystemExit(
                f"{path}: address {hex(last)} not found in `git show {git_spec}` -- "
                f"pick an earlier commit that still has this function as asm")
        next_addr = ref_addrs[idx + 1] if idx + 1 < len(ref_addrs) else end_addr

        size = next_addr - start
        if size <= 0:
            raise SystemExit(f"{path}: non-positive size ({size})")
        manifest[os.path.basename(path)] = size
    return manifest


def main():
    for group, git_spec, end_addr in GROUPS:
        group_dir = os.path.join(ROOT, 'asm', 'nonmatching', group)
        manifest = build(group_dir, git_spec, end_addr)
        out_path = os.path.join(ROOT, 'asm', 'nonmatching', f'{group}.sizes.json')
        with open(out_path, 'w') as f:
            json.dump(manifest, f, indent=0, sort_keys=True)
        print(f"{group}: {len(manifest)} files, {sum(manifest.values())} bytes -> {out_path}")


if __name__ == '__main__':
    main()
