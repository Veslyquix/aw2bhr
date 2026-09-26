# sub_0806F41C

0x0806F41C, 308 bytes, THUMB, parked.

Best score so far: 15.6%, +4 bytes.

## Files

- `sub_0806F41C.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 78 at 312/308 (+4 section, +8 code), 15.6%. Raw integer proc+0x38 spelling is byte-identical; volatile post-branch views emit ldrb/shifts and retain the old address instead of ROM recomputation. Residual is post-branch address lifetime.
