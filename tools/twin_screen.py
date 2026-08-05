#!/usr/bin/env python3
"""Rank unmatched functions by mnemonic-stream similarity to a MATCHED function.

Wave 45 measured two equally-supplied address-locality blocks -- both
`undeclared callees: 0`, both with 40+ matched neighbours -- landing 4/6 and
1/6.  The block that paid was the one whose targets had a >=0.70
mnemonic-stream twin that was already MATCHED; the block that did not had a
maximum pairwise similarity of 0.24.  Block vocabulary was identical.

So this screens on the thing that actually predicted the outcome: for every
unmatched function, the most similar ALREADY-MATCHED function anywhere in the
ROM, and the ratio.  A target with a matched twin is a transcription job.  A
target without one is an authoring job, and authoring jobs are what burn a
context window at 250+ bytes per function.

This is a refinement of wave 20's "screen on proximity to a matched exemplar,
not on size" -- wave 20 established that exemplar STATUS is what makes a match
cheap, but scored proximity by shared-callee overlap, which is a vocabulary
proxy.  Shape similarity measures it directly.

Usage:
  python tools/twin_screen.py                      # whole ROM, ranked
  python tools/twin_screen.py --min-ratio 0.70     # only the transcription jobs
  python tools/twin_screen.py --block 0x08026000   # one block
  python tools/twin_screen.py --names sub_08026290 sub_080265D0
  python tools/twin_screen.py --self-test
"""
import argparse
import difflib
import glob
import json
import os
import re
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Instruction lines we never count: directives, comments, labels, pool words.
_SKIP_PREFIX = ('.', '@', 'thumb_func', 'arm_func', 'non_word_aligned')


def _mnemonics(body):
    """Reduce an assembly body to its mnemonic stream.

    Operands are deliberately dropped.  Two instantiations of one idiom differ
    in registers, constants and pool symbols but agree on mnemonics, which is
    exactly the equivalence we want -- comparing operands would rediscover
    byte-identity, which `overlap_screen.py` already reports.
    """
    out = []
    for line in body.split('\n'):
        line = line.strip()
        if not line or line.startswith(_SKIP_PREFIX):
            continue
        if line.endswith(':') or re.match(r'^\S+:\s*@', line):
            continue
        tok = line.split()[0]
        if tok.startswith('_') or tok.endswith(':'):
            continue
        out.append(tok)
    return out


def load_streams():
    """name -> mnemonic stream, for every thumb function in asm/."""
    streams = {}
    pat = re.compile(
        r'^\s*thumb_func_start (\S+)\s*\n(.*?)(?=^\s*thumb_func_start |\Z)',
        re.S | re.M)
    for path in sorted(glob.glob(os.path.join(REPO, 'asm', '**', '*.s'),
                                 recursive=True)):
        with open(path, encoding='utf-8', errors='replace') as fh:
            text = fh.read()
        for m in pat.finditer(text):
            streams[m.group(1)] = _mnemonics(m.group(2))
    return streams


def load_status():
    with open(os.path.join(REPO, 'data', 'functions.json'), encoding='utf-8') as fh:
        data = json.load(fh)
    if isinstance(data, dict):
        data = data.get('functions', data)
    rows = data if isinstance(data, list) else list(data.values())
    return {r['name']: r for r in rows}


def best_twin(name, streams, matched_names, size_band=0.60, quick=True):
    """Most similar MATCHED function to `name`, and the ratio.

    `size_band` prunes candidates whose stream length differs by more than the
    band -- a 20-instruction function and a 200-instruction one cannot be an
    idiom pair, and skipping them is what keeps this O(n) enough to run.
    """
    a = streams.get(name)
    if not a:
        return None, 0.0
    lo, hi = len(a) * (1 - size_band), len(a) * (1 + size_band)
    best, best_r = None, 0.0
    for other in matched_names:
        b = streams.get(other)
        if not b or not (lo <= len(b) <= hi):
            continue
        sm = difflib.SequenceMatcher(None, a, b)
        # real_quick_ratio/quick_ratio are cheap upper bounds; skip anything
        # that cannot beat the incumbent before paying for the real diff.
        if quick and (sm.real_quick_ratio() <= best_r or sm.quick_ratio() <= best_r):
            continue
        r = sm.ratio()
        if r > best_r:
            best, best_r = other, r
    return best, best_r


def self_test(streams, status):
    """Assertions that fail loudly if the screen stops measuring what it claims."""
    ok = True

    def check(label, cond, detail=''):
        nonlocal ok
        print('  [%s] %s%s' % ('PASS' if cond else 'FAIL', label,
                               '' if cond else '  -- ' + detail))
        if not cond:
            ok = False

    check('asm parsed', len(streams) > 4000, 'only %d functions' % len(streams))

    # The wave-45 observation this tool exists to encode. sub_08045B30 and
    # sub_08045C18 are the confirmed idiom pair (B30 matched first, C18 at
    # 89.4% against it); they must score high. The 0x08035/36 block's members
    # must not.
    a = streams.get('sub_08045B30')
    b = streams.get('sub_08045C18')
    check('known idiom pair scores >= 0.70',
          bool(a and b) and difflib.SequenceMatcher(None, a, b).ratio() >= 0.70)

    c = streams.get('sub_080359A4')
    d = streams.get('sub_080364F4')
    check('known non-pair scores < 0.55',
          bool(c and d) and difflib.SequenceMatcher(None, c, d).ratio() < 0.55)

    # A matched function must find itself excluded, not returned as its own twin.
    matched = [n for n, r in status.items() if r.get('status') == 'matched']
    if matched:
        probe = matched[0]
        twin, _ = best_twin(probe, streams,
                            [n for n in matched if n != probe])
        check('function is not its own twin', twin != probe)

    # The size band must not silently drop everything.
    unmatched = [n for n, r in status.items()
                 if r.get('status') != 'matched' and n in streams]
    hits = sum(1 for n in unmatched[:40]
               if best_twin(n, streams, matched)[1] > 0)
    check('size band still admits candidates', hits > 0,
          'no twin found for any of 40 probes')
    return ok


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--min-ratio', type=float, default=0.0)
    ap.add_argument('--block')
    ap.add_argument('--names', nargs='+')
    ap.add_argument('--min-size', type=int, default=24)
    ap.add_argument('--limit', type=int, default=60)
    ap.add_argument('--self-test', action='store_true')
    args = ap.parse_args()

    streams = load_streams()
    status = load_status()

    if args.self_test:
        print('=== twin_screen self-test ===')
        sys.exit(0 if self_test(streams, status) else 1)

    matched = [n for n, r in status.items() if r.get('status') == 'matched']

    if args.names:
        targets = args.names
    else:
        targets = [n for n, r in status.items()
                   if r.get('status') != 'matched'
                   and n in streams
                   and (r.get('size') or 0) >= args.min_size]
        if args.block:
            base = int(args.block, 16)
            targets = [n for n in targets
                       if base <= int(status[n]['addr'] if isinstance(
                           status[n].get('addr'), int) else
                           int(n.split('_')[1], 16)) < base + 0x1000]

    rows = []
    for n in targets:
        twin, r = best_twin(n, streams, matched)
        if r >= args.min_ratio:
            rows.append((r, n, twin, status.get(n, {}).get('size', 0)))
    rows.sort(reverse=True)

    print('targets: %d   with a matched twin >= %.2f: %d'
          % (len(targets), args.min_ratio, len(rows)))
    print('%-8s %-16s %6s  %s' % ('ratio', 'function', 'bytes', 'matched twin'))
    for r, n, twin, size in rows[:args.limit]:
        tag = '  <-- transcription job' if r >= 0.70 else ''
        print('%-8.3f %-16s %5dB  %-16s%s' % (r, n, size, twin or '-', tag))
    if len(rows) > args.limit:
        print('(+%d more not shown; raise --limit)' % (len(rows) - args.limit))


if __name__ == '__main__':
    main()
