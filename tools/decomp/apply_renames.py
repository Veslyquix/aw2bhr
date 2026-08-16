#!/usr/bin/env python3
"""Apply a list of "OLDNAME NEWNAME" rename pairs (whitespace-separated, one per line)
to every given file, whole-word matches only. Used when a symbol gets renamed upstream
(a real name discovered for a former sub_XXXXXXXX/gUnknown_XXXXXXXX) and needs propagating
across every asm file that still references the old name by bl/ldr/etc -- particularly
relevant now that asm/nonmatching/{design,proc} hold thousands of individual files, so a
plain sed loop across them all is the practical way to keep everything consistent.

Usage: apply_renames.py renames.txt file1 [file2 ...]
       apply_renames.py renames.txt --glob 'asm/nonmatching/**/*.s'
"""
import glob
import re
import sys


def load_renames(path):
    renames = []
    with open(path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            old, new = line.split()
            renames.append((re.compile(r'\b' + re.escape(old) + r'\b'), new))
    return renames


def main():
    renames_path = sys.argv[1]
    rest = sys.argv[2:]
    if rest and rest[0] == '--glob':
        files = glob.glob(rest[1], recursive=True)
    else:
        files = rest

    renames = load_renames(renames_path)

    changed = 0
    for path in files:
        with open(path) as f:
            text = f.read()
        new_text = text
        for pat, new in renames:
            new_text = pat.sub(new, new_text)
        if new_text != text:
            with open(path, 'w') as f:
                f.write(new_text)
            changed += 1
    print(f"{changed}/{len(files)} files modified")


if __name__ == '__main__':
    main()
