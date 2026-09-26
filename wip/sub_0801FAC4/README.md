# sub_0801FAC4

0x0801FAC4, 540 bytes, THUMB, parked.

Best score so far: 65.9% (best.c).

## Files

- `sub_0801FAC4.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 536/540 (-4), 36.3%. ROM uses two stack slots for loop invariant/stepped bounds while the draft coalesces to one. Zero-trip loops and explicit scoped bounds, including case-0-only placement, are ruled out; the latter grows to 548 or remains one-slot.
