# sub_08057164

0x08057164, 268 bytes, THUMB, parked.

Best score so far: 22.4%, -4 bytes (best.c).

## Files

- `sub_08057164.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 70 at exact size 268/268. All statements and branches are present; the residual is strength_reduce retaining an address GIV for gUnknown_0855203C where ROM keeps an element-index IV. A bound table pointer and Wave 70's explicit idx counter plus record-pointer walk still form the address GIV. The new source counter does recover the desired +1 element IV, proving the remaining problem is the second GIV decision rather than loop semantics.
