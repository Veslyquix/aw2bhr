#!/usr/bin/env python3
"""Generate progress/memory-map.svg -- the README's picture of the ROM.

progress/index.html is the detailed map: one rectangle per function, tooltips,
per-band table. GitHub will not render it in a README, so this produces the
same picture reduced to something a README can embed with a plain image tag --
one row per 32 KB address band, each row a stacked bar of the four states the
function index tracks.

Deliberate choices, both of which are the point of the file:

  * The numbers are the INDEX metric -- data/functions.json, every function in
    the ROM's code region, matched bytes over total bytes. That is the figure
    `tools/preflight.py` calls "index metric". progress_map.py's byte total is
    larger because it also counts src/proc.c and src/title-screen.c, which were
    never assembly; quoting that as progress would overstate it, so the public
    picture uses the conservative one.

  * The four states are reported separately and never added together. `parked`
    is compiler output we have not matched yet and `asm-resident` is assembly
    that was never compiler output at all -- neither is progress, the ROM still
    builds both from asm/, and a single combined percentage would say otherwise.

The output must survive GitHub's SVG sanitiser, which strips anything active,
and must be legible on both the light and the dark theme. So: no <script>, no
<style>, no external references, presentation attributes only, and a palette of
mid-tones that carry against a white page and a near-black one alike. Nothing
here may depend on prefers-color-scheme -- an embedded image sees the operating
system's setting, not the one GitHub is rendering with, and the two disagree
often enough that a theme-adaptive palette is worse than a fixed one.

Usage:
    python tools/memory_map.py [--out progress/memory-map.svg]
"""

import argparse
import json
import os
import sys
from collections import defaultdict

import awlib

OUT = os.path.join("progress", "memory-map.svg")
BAND = 32 * 1024                      # one row per 32 KB of address space

WIDTH = 860
ROW_H = 24
BAR_H = 13

# Columns, in user units. The band label is monospace so the addresses line up
# as a column of digits rather than drifting.
X_ADDR = 4
X_BAR = 104
W_BAR = 470
X_PCT = 638                           # right edge of the per-band percentage
X_BYTES = WIDTH - 4                   # right edge of the byte counts

MONO = "ui-monospace, SFMono-Regular, Menlo, Consolas, monospace"
SANS = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"

# Mid-tones only. Pure black or white text vanishes into one theme or the
# other; #7d848c sits close to the crossover point and holds about 4.2:1
# against white and against #0d1117, which is the best a single fixed colour
# can do for both. The fills are chosen to stay distinct in lightness as well
# as hue, so the bar still reads without colour.
INK = "#727982"                       # primary labels
INK_2 = "#828992"                     # secondary labels
RULE = "#9aa1a9"                      # hairlines and the bar outline

STATES = [
    # key, colour, legend label
    ("matched", "#2f9e57", "matched — built from C, proven by make compare"),
    ("parked", "#c9922e", "parked — compiler output, not matched yet"),
    ("asm-resident", "#5f8fbf", "asm-resident — never compiler output"),
    ("asm", "#9099a1", "not started"),
]
FILL = dict((k, c) for k, c, _ in STATES)
ORDER = [k for k, _, _ in STATES]


# ---------------------------------------------------------------- data

def load_index():
    """data/functions.json -- a LIST of records, one per function."""
    path = os.path.join(awlib.DATA_DIR, "functions.json")
    if not os.path.exists(path):
        print("error: data/functions.json missing -- run tools/index_functions.py")
        return None
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


def bucket(records):
    """(bands, totals) -- bytes per state, per 32 KB band and overall."""
    bands = defaultdict(lambda: defaultdict(int))
    totals = defaultdict(int)
    for r in records:
        state = r.get("status", "asm")
        if state not in FILL:
            state = "asm"
        base = r["addr"] - (r["addr"] % BAND)
        bands[base][state] += r["size"]
        totals[state] += r["size"]
    return bands, totals


# ---------------------------------------------------------------- render

def esc(text):
    return (text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"))


def text(x, y, s, size=12, fill=INK, family=SANS, weight=None, anchor=None):
    bits = ['<text x="%.1f" y="%.1f" font-family="%s" font-size="%s" fill="%s"'
            % (x, y, family, size, fill)]
    if weight:
        bits.append(' font-weight="%s"' % weight)
    if anchor:
        bits.append(' text-anchor="%s"' % anchor)
    bits.append('>%s</text>' % esc(s))
    return "".join(bits)


def segments(counts, x, y, width, height, denom):
    """A stacked bar for one band, in ORDER, scaled so `denom` fills `width`."""
    out = []
    cx = x
    for key in ORDER:
        n = counts.get(key, 0)
        if n <= 0:
            continue
        w = width * n / denom if denom else 0
        # Sub-pixel slivers would disappear entirely at GitHub's rendered
        # width; a hairline is a truthful floor, not a rounding error.
        w = max(w, 0.7)
        out.append('<rect x="%.2f" y="%.1f" width="%.2f" height="%.1f" fill="%s"/>'
                   % (cx, y, w, height, FILL[key]))
        cx += w
    return "".join(out), cx


def commas(n):
    return "{:,}".format(n)


def build(out_rel):
    records = load_index()
    if records is None:
        return 1

    bands, totals = bucket(records)
    tot_bytes = sum(totals.values())
    tot_funcs = len(records)
    matched_b = totals["matched"]
    matched_n = sum(1 for r in records if r.get("status") == "matched")
    pct = matched_b / tot_bytes * 100 if tot_bytes else 0

    order = sorted(bands)
    lo = min(r["addr"] for r in records)
    hi = max(r["addr"] + r["size"] for r in records)

    y_bands = 190
    height = y_bands + len(order) * ROW_H + 40
    # A function is attributed to the band its ENTRY address falls in, so one
    # that straddles a boundary carries all of its bytes into the earlier band
    # and a band can hold slightly more than 32 KB. Scaling to the fullest band
    # rather than to 32,768 keeps every bar inside the column without having to
    # clamp -- and clamping would be a lie about where the code is.
    widest = max(sum(c.values()) for c in bands.values())

    p = ['<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d" '
         'viewBox="0 0 %d %d" role="img" aria-label="%s">'
         % (WIDTH, height, WIDTH, height,
            esc("Advance Wars 2: Black Hole Rising decompilation progress by ROM "
                "address: %.2f%% of code bytes matched" % pct))]

    # ---- heading
    p.append(text(X_ADDR, 22,
                  "Advance Wars 2: Black Hole Rising — ROM code map",
                  size=17, weight="600", fill=INK))
    p.append(text(X_ADDR, 42,
                  "%s of %s code bytes decompiled and byte-matched  ·  "
                  "%s of %s functions  ·  0x%08X–0x%08X"
                  % (commas(matched_b), commas(tot_bytes), commas(matched_n),
                     commas(tot_funcs), lo, hi),
                  size=12, fill=INK_2))

    # ---- overall bar
    p.append('<rect x="%d" y="56" width="%d" height="20" fill="none" '
             'stroke="%s" stroke-width="1"/>'
             % (X_ADDR, WIDTH - 2 * X_ADDR, RULE))
    body, _ = segments(totals, X_ADDR, 56, WIDTH - 2 * X_ADDR, 20, tot_bytes)
    p.append(body)
    p.append(text(X_ADDR, 94, "%.2f%%" % pct, size=26, weight="700",
                  fill=FILL["matched"]))
    p.append(text(X_ADDR + 92, 94, "of the code region is matched C",
                  size=12.5, fill=INK_2))

    # ---- legend
    ly = 118
    lx = X_ADDR
    for key, colour, label in STATES:
        p.append('<rect x="%.1f" y="%.1f" width="10" height="10" rx="2" '
                 'fill="%s"/>' % (lx, ly, colour))
        p.append(text(lx + 15, ly + 9, label, size=11.5, fill=INK_2))
        # Rough advance width for 11.5px text; the legend is one row and the
        # labels are fixed, so measuring is not worth a font dependency.
        lx += 15 + len(label) * 5.55 + 16

    p.append(text(X_ADDR, ly + 32,
                  "parked and asm-resident are drawn separately because "
                  "neither is progress — the ROM still builds both from "
                  "assembly.", size=11.5, fill=INK_2))

    # ---- column headings
    hy = y_bands - 12
    p.append(text(X_ADDR, hy, "address band", size=10.5, fill=INK_2,
                  family=MONO))
    p.append(text(X_BAR, hy, "code in each 32 KB band", size=10.5, fill=INK_2))
    p.append(text(X_PCT, hy, "matched", size=10.5, fill=INK_2, anchor="end"))
    p.append(text(X_BYTES, hy, "bytes matched / in band", size=10.5,
                  fill=INK_2, anchor="end"))
    p.append('<line x1="%d" y1="%.1f" x2="%d" y2="%.1f" stroke="%s" '
             'stroke-width="1" opacity="0.6"/>'
             % (X_ADDR, hy + 5, X_BYTES, hy + 5, RULE))

    # ---- one row per band
    for i, base in enumerate(order):
        counts = bands[base]
        band_b = sum(counts.values())
        band_m = counts.get("matched", 0)
        bpct = band_m / band_b * 100 if band_b else 0
        y = y_bands + i * ROW_H
        by = y + (ROW_H - BAR_H) / 2 - 6

        p.append(text(X_ADDR, y + 8, "0x%08X" % base, size=11.5, fill=INK,
                      family=MONO))
        # Bar width tracks how much indexed code the band holds, so the short
        # final band and the gaps between functions stay visible instead of
        # being normalised away.
        w = W_BAR * band_b / widest
        p.append('<rect x="%d" y="%.1f" width="%.2f" height="%d" fill="none" '
                 'stroke="%s" stroke-width="0.8" opacity="0.75"/>'
                 % (X_BAR, by, w, BAR_H, RULE))
        body, _ = segments(counts, X_BAR, by, w, BAR_H, band_b)
        p.append(body)

        p.append(text(X_PCT, y + 8, "%.1f%%" % bpct, size=11.5, weight="600",
                      fill=INK, anchor="end"))
        p.append(text(X_BYTES, y + 8, "%s / %s" % (commas(band_m),
                                                   commas(band_b)),
                      size=11.5, fill=INK_2, anchor="end", family=MONO))

    # ---- footer
    p.append(text(X_ADDR, height - 14,
                  "Generated by tools/memory_map.py from data/functions.json "
                  "— do not edit by hand. Full interactive map: "
                  "progress/index.html",
                  size=11, fill=INK_2))
    p.append('</svg>')

    doc = "\n".join(p) + "\n"
    path = os.path.join(awlib.REPO, out_rel.replace("/", os.sep))
    awlib.write_text(path, doc)
    print("wrote %s  (%s bands, %s bytes)"
          % (out_rel, len(order), commas(len(doc.encode("utf-8")))))
    for key in ORDER:
        print("  %-13s %9s bytes  %6.2f%%"
              % (key, commas(totals[key]),
                 totals[key] / tot_bytes * 100 if tot_bytes else 0))
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-o", "--out", default=OUT)
    args = ap.parse_args()
    return build(args.out.replace("\\", "/"))


if __name__ == "__main__":
    sys.exit(main())
