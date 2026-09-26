# sub_08057BDC

0x08057BDC, 360 bytes, THUMB, parked.

Best score so far: 61.9% (best.c).

## Files

- `sub_08057BDC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 70 at 356/360 (-4). Everything before loop 2 is byte-exact. ROM hoists gUnknown_085D6A48 and gUnknown_03004582 while rematerialising gUnknown_08551A04; candidate does the reverse. Pointer bindings, pointer/pointee self-use barriers and dead-local uses are ruled out: the latter recover size but preserve the wrong hoist and perturb loop 1. Residual is one LICM priority choice.
