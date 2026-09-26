# sub_0805634C

0x0805634C, 364 bytes, THUMB, parked.

Best score so far: 38.2% (best.c).

## Files

- `sub_0805634C.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 70 at 360/364 (-4). First loop and all semantics are settled; the second loop needs two addresses emitted as bare symbol plus runtime constant before the varying offset. Separate p=base; p+=K statements prove that spelling for +0x1a and +6, but before-loop placement spills the adjusted pointers while body placement const-propagates back to base+K. Existing direct/member/pointer forms are documented in the draft; the remaining axis is lifetime/CSE, not transcription.
