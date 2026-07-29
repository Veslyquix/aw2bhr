#!/usr/bin/env python3
"""Classify a function's data_refs into real globals and agbcc `.LC` pool words.

Wave 15 established that the number of `-fforce-addr` literal-pool words a
large function carries is what predicts the cost of matching it -- monotone
across seven functions, where size, callee count, new-symbol count and the
index's own `difficulty` field all order it wrong, two of them backwards:

    .LC words | outcome
    0         | matched (three of four on the first try)
    1         | +8 bytes
    2         | -8 bytes
    2, needing 3 distinct read-site spellings | -28 bytes

The catch this tool exists for: `data_refs` in data/functions.json cannot tell a
shared global from a shared pool word, because the splitter invents a
`gUnknown_<addr>` symbol for both. Wave 15's large batch was chosen believing it
was `.LC`-free and three of its four functions carried pool words for globals
nobody had looked at.

The screen is fan-in == 1 AND run-density >= 4 on the 4-byte grid. NEITHER HALF
IS SUFFICIENT and this is never a verdict, only a prioritisation:

  * density alone misclassifies real tables -- gUnknown_08499590 sits at
    density 12 with fan-in 327, because genuinely popular globals cluster too.
  * fan-in alone would park the proc-script wrappers, the cheapest family in
    the tree.

Validated against 14 hand-checked controls (8 known pool words, 6 known
globals); known blocks include 0x08091350-0x0809138C, 0x0816D938-0x0816D9BC and
0x0816D9E0+. Run the screen rather than trusting any address list, this one
included.

    python tools/lc_screen.py                 # summarise the straight-line band
    python tools/lc_screen.py sub_0800AA30    # classify one function's refs
"""
import json
import os
import re
import sys
import collections

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
_ADDR = re.compile(r"^gUnknown_0([0-9A-F]{7})$")

# A pool word is referenced by exactly one function...
FANIN_MAX = 1
# ...and sits in a run of consecutive 4-byte slots that are also referenced.
DENSITY_MIN = 4
# Half-width of the window swept over the 4-byte grid, in slots.
WINDOW = 8


def load(path=None):
    path = path or os.path.join(ROOT, "data", "functions.json")
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


def sym_addr(sym):
    """Address encoded in a splitter-invented symbol name, or None."""
    m = _ADDR.match(sym)
    return int(m.group(1), 16) if m else None


class Screen:
    def __init__(self, functions):
        self.fanin = collections.Counter()
        self.refs = set()
        for f in functions:
            for r in set(f.get("data_refs", ())):
                self.fanin[r] += 1
                a = sym_addr(r)
                if a is not None:
                    self.refs.add(a)

    def density(self, addr):
        return sum(1 for k in range(-WINDOW, WINDOW + 1)
                   if (addr + 4 * k) in self.refs)

    def is_pool_word(self, sym):
        addr = sym_addr(sym)
        if addr is None:
            return False
        return (self.fanin[sym] <= FANIN_MAX
                and self.density(addr) >= DENSITY_MIN)

    def split(self, fn):
        """(pool_words, real_globals) for one function record."""
        pool, real = [], []
        for r in sorted(set(fn.get("data_refs", ()))):
            (pool if self.is_pool_word(r) else real).append(r)
        return pool, real


def main(argv):
    fns = load()
    scr = Screen(fns)
    by_name = {f["name"]: f for f in fns}

    if argv:
        for name in argv:
            f = by_name.get(name)
            if f is None:
                print("%-16s ?? not in index" % name)
                continue
            pool, real = scr.split(f)
            print("%s  %dB  %d .LC word(s)"
                  % (name, f["size"], len(pool)))
            for r in pool:
                print("   .LC   %-22s fanin=%-4d density=%d"
                      % (r, scr.fanin[r], scr.density(sym_addr(r))))
            for r in real:
                a = sym_addr(r)
                print("   glob  %-22s fanin=%-4d density=%s"
                      % (r, scr.fanin[r],
                         scr.density(a) if a is not None else "-"))
        return 0

    band = [f for f in fns
            if f["status"] == "asm" and f["mode"] == "THUMB"
            and f["backward_branches"] == 0 and f["size"] >= 256]
    clean = [f for f in band if not scr.split(f)[0]]
    dirty = [f for f in band if scr.split(f)[0]]
    fmt = "  %-9s %4d funcs %7d bytes"
    print("straight-line band >=256B: %d funcs, %d bytes"
          % (len(band), sum(f["size"] for f in band)))
    print(fmt % (".LC-free", len(clean), sum(f["size"] for f in clean)))
    print(fmt % ("has .LC", len(dirty), sum(f["size"] for f in dirty)))
    print("\ncheapest-first (.LC-free, largest first):")
    for f in sorted(clean, key=lambda x: -x["size"])[:25]:
        print("  %-16s %4dB calls=%-2d globals=%-2d %s"
              % (f["name"], f["size"], len(f["calls"]),
                 len(scr.split(f)[1]), f["src"]))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
