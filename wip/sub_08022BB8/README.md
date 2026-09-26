# sub_08022BB8

0x08022BB8, 540 bytes, THUMB, parked.

Best score so far: 21.1%, -24 bytes.

## Files

- `sub_08022BB8.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at 516/540 (-24), 21.1%. Per-arm shifted x/y pseudos are retained, but agbcc coalesces them into dead parameter registers instead of emitting the ROM's saved-register copies. Parameter widths, casts and simple bindings are ruled out; selector CFG is settled.
