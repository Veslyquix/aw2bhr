# sub_0801A7D8

0x0801A7D8, 1056 bytes, THUMB, parked.

Best score so far: 23.2%, +12 bytes (best.c).

## Files

- `sub_0801A7D8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 1068/1056 (+12), 20.0%. A narrow block-local u8 tag improved +16 to +12; the remaining 0x02002000 address-hub choice and spill cascade survive. Switch/retry CFG, folded-address forms, direct narrow OR, and wider tag spellings are settled in the draft comment.
