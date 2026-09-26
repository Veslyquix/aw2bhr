# sub_0801E508

0x0801E508, 976 bytes, THUMB, parked.

Best score so far: 22.6%, -28 bytes.

## Files

- `sub_0801E508.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 948/976 (-28), 22.6%. Explicit arithmetic temporaries now preserve every observable soft-float, trig and libgcc call in ROM order. Remaining deficit is frame/register allocation, not arithmetic semantics or call association.
