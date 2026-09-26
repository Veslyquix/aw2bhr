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
    python tools/verify_batch.py list.txt --rank       # plus a table, closest first

Each line carries trymatch's own verdict (its final TRYMATCH line), so nobody
has to re-parse trymatch's prose to rank a batch (wave 90 did, for 102 drafts):

    OK   sub_A
    FAIL(1) sub_B MISMATCH      97.26%  size+0   first+0x14
    FAIL(1) sub_C COMPILE-FAIL  :: work/sub_C/sub_C.c:50: `gUnknown_08499598' undeclared
    FAIL(2) sub_D NO-DRAFT
    FAIL(124) sub_E ERROR       :: trymatch timed out after 600s

COMPILE-FAIL and MISMATCH are both exit 1 from trymatch and are completely
different diagnoses: a draft that does not compile has no score at all, and a
header rename can break dozens at once (wave 90: 46 of 101). The summary counts
them separately and says so loudly.

Exit codes -- gate on these, never on the text:
    0   every listed function was tested and every one matched
    1   every listed function was tested; at least one did not match
    3   reconciliation failed -- some function was never tested; trust NOTHING
"""
import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import trymatch  # noqa: E402  (parse_result only; nothing is compiled in-process)


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


def first_error(text):
    """The first compiler diagnostic in trymatch's COMPILE FAILED block."""
    for ln in text.splitlines():
        s = ln.strip()
        if re.search(r':\d+: ', s) and 'In function' not in s \
                and 'warnings being treated as errors' not in s:
            return s
    return ''


def describe(fn, rc, out, tail_n):
    """One log line for one trymatch run, plus its parsed verdict."""
    r = trymatch.parse_result(out) or {'state': 'ERROR', 'fn': fn}
    st = r['state']
    if rc == 0:
        return 'OK   %s' % fn, r
    if st == 'MISMATCH':
        line = 'FAIL(%d) %s %-13s %6.2f%%  size%-+4d first+0x%x' % (
            rc, fn, st, r.get('pct', 0.0), r.get('size', 0), r.get('first', 0))
    elif st == 'COMPILE-FAIL':
        line = 'FAIL(%d) %s %-13s :: %s' % (rc, fn, st, first_error(out)[:200])
    elif st == 'NO-DRAFT':
        line = 'FAIL(%d) %s %s' % (rc, fn, st)
    else:
        tail = ' '.join(out.strip().splitlines()[-tail_n:])
        line = 'FAIL(%d) %s %-13s :: %s' % (rc, fn, st, tail[:160])
    return line, r


def self_test():
    """The line format and the parse, on canned trymatch output."""
    ok = True
    cases = [
        (0, 'MATCH -- byte-for-byte identical\nTRYMATCH MATCH sub_A\n', 'OK   sub_A'),
        (1, '  bytes: 8 of 292 differ\nTRYMATCH MISMATCH sub_B pct=97.26 size=+0 first=+0x14\n',
         'FAIL(1) sub_B MISMATCH       97.26%  size+0   first+0x14'),
        (1, "COMPILE FAILED\n  work/sub_C/sub_C.c: In function `sub_C':\n"
            "  work/sub_C/sub_C.c:50: `gX' undeclared (first use in this function)\n"
            'TRYMATCH COMPILE-FAIL sub_C\n',
         "FAIL(1) sub_C COMPILE-FAIL  :: work/sub_C/sub_C.c:50: `gX' undeclared "
         "(first use in this function)"),
        (2, 'error: work/sub_D/sub_D.c missing\nTRYMATCH NO-DRAFT sub_D\n', 'FAIL(2) sub_D NO-DRAFT'),
        (1, 'Traceback (most recent call last):\n  boom\n', None),
    ]
    for rc, out, want in cases:
        fn = re.search(r'sub_\w', out).group(0) if 'sub_' in out else 'sub_E'
        line, r = describe(fn, rc, out, 4)
        good = (line == want) if want else (r['state'] == 'ERROR' and line.startswith('FAIL(1) sub_E ERROR'))
        print('[self-test] %-60s %s' % (line[:60], 'PASS' if good else 'FAIL (got %r)' % line))
        ok &= good
    print('[self-test] %s' % ('PASS' if ok else 'FAIL'))
    return 0 if ok else 1


def main(argv):
    p = argparse.ArgumentParser(
        description='Exit-code sweep over a batch of functions.')
    p.add_argument('list', nargs='?', help='file of function names')
    p.add_argument('--names', nargs='+', help='names given inline instead')
    p.add_argument('--log', help='write OK/FAIL lines here as well')
    p.add_argument('--tail', type=int, default=4,
                   help='trymatch output lines to keep for an unparseable failure')
    p.add_argument('--rank', action='store_true',
                   help='also print every non-match, closest first')
    p.add_argument('--timeout', type=int, default=600,
                   help='seconds per trymatch run (default 600)')
    p.add_argument('--self-test', action='store_true')
    args = p.parse_args(argv)
    if args.self_test:
        return self_test()

    if bool(args.list) == bool(args.names):
        p.error('give a list file OR --names, not both/neither')
    names = read_list(args.list) if args.list else list(dict.fromkeys(args.names))
    if not names:
        print('empty list -- nothing verified, nothing passed')
        return 3

    log_lines, ok, results = [], 0, []
    for fn in names:
        try:
            proc = subprocess.run(
                [sys.executable, os.path.join(HERE, 'trymatch.py'), fn],
                cwd=REPO, capture_output=True, text=True, timeout=args.timeout,
                stdin=subprocess.DEVNULL)
            rc, out = proc.returncode, proc.stdout + proc.stderr
        except subprocess.TimeoutExpired:
            # Used to escape as an exception and kill the sweep before its
            # reconciliation -- the one output this tool exists to guarantee.
            rc, out = 124, 'trymatch timed out after %ds' % args.timeout
        line, r = describe(fn, rc, out, args.tail)
        if rc == 0:
            ok += 1
        results.append((fn, rc, r))
        print(line, flush=True)
        log_lines.append(line)

    if args.log:
        with open(args.log, 'w', encoding='utf-8', newline='\n') as fh:
            fh.write('\n'.join(log_lines) + '\n')

    n = len(names)
    counts = {}
    for _, rc, r in results:
        st = 'MATCH' if rc == 0 else r['state']
        counts[st] = counts.get(st, 0) + 1
    print('verified %d of %d' % (ok, n))
    print('states: %s' % ', '.join('%d %s' % (v, k) for k, v in sorted(counts.items())))
    if counts.get('COMPILE-FAIL'):
        print('*** %d draft(s) DO NOT COMPILE -- they have no score; fix or port '
              'them before reading any percentage (tools/port_rename.py after a '
              'header rename) ***' % counts['COMPILE-FAIL'])
    if args.rank:
        order = {'MISMATCH': 0, 'COMPILE-FAIL': 1, 'NO-DRAFT': 2}
        rows = sorted((r for r in results if r[1] != 0),
                      key=lambda t: (order.get(t[2]['state'], 3), -t[2].get('pct', 0.0),
                                     abs(t[2].get('size', 0))))
        print('\nrank  function          state          pct     size')
        for k, (fn, rc, r) in enumerate(rows, 1):
            print('%4d  %-16s  %-13s %s' % (
                k, fn, r['state'],
                '%6.2f%%  %+d' % (r['pct'], r['size']) if r['state'] == 'MISMATCH' else ''))
    if len(log_lines) != n:
        print('*** LIST/LOG MISMATCH (%d logged vs %d listed) -- some '
              'function was NEVER TESTED ***' % (len(log_lines), n))
        return 3
    print('reconciled: %d log lines == %d listed functions' % (len(log_lines), n))
    return 0 if ok == n else 1


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
