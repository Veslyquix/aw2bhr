# sub_08046030

0x08046030, 1556 bytes, THUMB, parked.

Best score so far: 42.7%, +4 bytes (best.c).

## Files

- `sub_08046030.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 1548/1556 (-8), 41.6%, pool 57/57, first real difference +0x188. Fixed block-local allocnos reproduce desired r6/r5/r4 but schedule initialization outside the first call; assembler-symbol aliases force the missing reload while incorrectly splitting literal-pool identity. Baseline restored.
