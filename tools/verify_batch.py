#!/usr/bin/env python3
"""The section-5 verification sweep as a tool, so no wave re-derives the bash.

Every wave the orchestrator must verify each agent-claimed function by EXIT
CODE (0 = match), reconcile the log line count against the list, and never
gate on message text. The hand-written loop that did this carried three traps,
each of which has silently produced a wrong-but-plausible result at least once:

  CRLF        Python text-mode writes CRLF on Windows; `comm`/`awk` against
              such a list silently matches nothing. Wave 33's orchestrator got
              a confident "0 functions missing" over a list where 23 were.
  last line   a list written by '\\n'.join() has no trailing newline, and plain
              `while read` drops the LAST entry. Wave 21 printed `24 / 25` and
              `(no failures)` -- which reads exactly like success.
  pipe status `$? ` after `cmd | tail` is TAIL's status. Wave 33 read a failing
              compile as exit 0 this way, in the same session that knew the
              trap from the build step.

This tool absorbs all three: it strips CR and BOM, never drops a final
unterminated line, invokes trymatch.py directly (no shell, no pipe), and
reconciles log-vs-list itself.

    python tools/verify_batch.py list.txt              # names, one per line
    python tools/verify_batch.py --names sub_A sub_B   # inline
    python tools/verify_batch.py list.txt --log out.log

Exit codes -- gate on these, never on the text:
    0   every listed function was tested and every one matched
    1   every listed function was tested; at least one did not match
    3   reconciliation failed -- some function was never tested; trust NOTHING
"""
import argparse
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)


def read_list(path):
    """Names from a file: CR and BOM stripped, blanks dropped, order-stable
    dedupe. Whitespace splits, so a space-separated single line also works."""
    with open(path, encoding='utf-8-sig', errors='replace', newline='') as fh:
        text = fh.read()
    seen, names = set(), []
    for tok in text.replace('\r', '\n').split():
        if tok and tok not in seen:
            seen.add(tok)
            names.append(tok)
    return names


def main(argv):
    p = argparse.ArgumentParser(
        description='Exit-code sweep over a batch of functions.')
    p.add_argument('list', nargs='?', help='file of function names')
    p.add_argument('--names', nargs='+', help='names given inline instead')
    p.add_argument('--log', help='write OK/FAIL lines here as well')
    p.add_argument('--tail', type=int, default=4,
                   help='trymatch output lines to keep per failure')
    args = p.parse_args(argv)

    if bool(args.list) == bool(args.names):
        p.error('give a list file OR --names, not both/neither')
    names = read_list(args.list) if args.list else list(dict.fromkeys(args.names))
    if not names:
        print('empty list -- nothing verified, nothing passed')
        return 3

    log_lines, ok = [], 0
    for fn in names:
        proc = subprocess.run(
            [sys.executable, os.path.join(HERE, 'trymatch.py'), fn],
            cwd=REPO, capture_output=True, text=True, timeout=600,
            stdin=subprocess.DEVNULL)
        if proc.returncode == 0:
            ok += 1
            line = 'OK   %s' % fn
        else:
            tail = ' '.join(
                (proc.stdout + proc.stderr).strip().splitlines()[-args.tail:])
            line = 'FAIL(%d) %s :: %s' % (proc.returncode, fn, tail[:160])
        print(line, flush=True)
        log_lines.append(line)

    if args.log:
        with open(args.log, 'w', encoding='utf-8', newline='\n') as fh:
            fh.write('\n'.join(log_lines) + '\n')

    n = len(names)
    print('verified %d of %d' % (ok, n))
    if len(log_lines) != n:
        print('*** LIST/LOG MISMATCH (%d logged vs %d listed) -- some '
              'function was NEVER TESTED ***' % (len(log_lines), n))
        return 3
    print('reconciled: %d log lines == %d listed functions' % (len(log_lines), n))
    return 0 if ok == n else 1


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
