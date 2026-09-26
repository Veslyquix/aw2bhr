# sub_0801ADC8

0x0801ADC8, 556 bytes, THUMB, parked.

Best score so far: 64.6% (best.c).

## Files

- `sub_0801ADC8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at exact size 556/556, 64.6%. The retained int zero restores the otherwise missing OR operand; remaining differences are duplicated-retry allocation/block placement. Earlier u8, uninitialised, array, global-derived and arithmetic-zero spellings are ruled out.
