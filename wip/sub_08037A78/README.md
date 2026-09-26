# sub_08037A78

0x08037A78, 268 bytes, THUMB, parked.

Best score so far: 27.6%, -4 bytes.

## Files

- `sub_08037A78.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 264/268 (-4), 27.6%. Body, increments and tails are byte-exact; residual remains in two loop preheaders. A rotated do/while obtains the ROM's 20-byte frame but reloads P2 in the body and breaks the exact tail, so the original fixpoint is retained.
