# sub_0802216C

0x0802216C, 560 bytes, THUMB, parked.

Best score so far: 39.5%, -8 bytes.

## Files

- `sub_0802216C.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 552/560 (-8), 39.5%. Fixed-r8 base binding correctly groups repeated 0x400 uses, but a2 still spills instead of occupying sl, leaving the frame and t/r allocation wrong. Declaration order and ordinary scalar base locals are byte-neutral.
