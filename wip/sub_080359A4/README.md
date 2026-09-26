# sub_080359A4

0x080359A4, 324 bytes, THUMB, parked.

Best score so far: 45.1%, -4 bytes.

## Files

- `sub_080359A4.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 320/324 (-4), 45.1%, improved from 308 bytes using a private-slot local and fixed-ip y. Semantic body and indirection are settled; remaining four bytes are pointer allocation/copy placement. Broader private-slot lifetime probes regress the register rotation. WAVE 81 (D): profile sweep complete -- o1/o1-no-force worse (21.6%, +8 bytes), old-agbcc(-no-force) 40.7%, default/no-force both 45.1% (320/324); no configuration lever on this function.
