# sub_08061308

0x08061308, 864 bytes, THUMB, parked.

Best score so far: 45.6%, -4 bytes (preprocessed form, not included).

## Files

- `sub_08061308.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 78 at 844/864 (-20 section, -12 code), 13.5%. Branch-local function-pointer bindings split the references but overshoot to 872; a volatile function-pointer view is byte-identical. Residual is the r7/r8 allocation swap and duplicate pool words.
