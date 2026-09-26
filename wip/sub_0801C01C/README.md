# sub_0801C01C

0x0801C01C, 116 bytes, THUMB, parked.

Best score so far: 27.6%, -8 bytes (best.c).

## Files

- `sub_0801C01C.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 108/116 (-8), 27.6%, improved from -40. A mutable in-place u64 shift reproduces the ROM's unique zero<<16 DImode path and high-half expression. Remaining eight bytes are r8/sl/r9 lifetime allocation; direct locals, literal zero and alternative DImode casts fold away.
