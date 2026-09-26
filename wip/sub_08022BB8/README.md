# sub_08022BB8

0x08022BB8, 540 bytes, THUMB, parked.

Best score so far: not measured.

## What it does

Draws a small marker sprite near screen position (x, y) for kinds 4, 5 and 6; other kinds draw nothing. Its position offset (gUnknown_080909B8) cycles with the game clock in a 33-frame, three-phase cycle, and one of four animations is chosen by whether x is past 0xCF and y past 0x8F or 0x7F, so the marker stays on screen. The sprite goes out through sub_0801C01C with tile 0x365 and palette 1.

## How close it is

Compiles 24 bytes too short (516 of 540). 21.1% of bytes are identical, which means little because the missing bytes shift everything after them. Every statement, table and branch is in place.

## What is left

In each of the three cases the original keeps x << 16 and y << 16 in separate saved registers and converts back to the signed coordinate at each use; our build reuses the parameter registers, so six 2-byte copies and their knock-on effects are missing. One idea in the oldest notes has no recorded result: check whether sub_0801C01C's first two parameters are really int rather than u16.

## Already tried

- Declaring the parameters s16 with plain adds, or u16 with (s16) casts at each use: both drop the second conversion; only the order of the add changes.
- Holding x << 16 and y << 16 in locals in each case (the current draft): improved 508 to 516 bytes, but the compiler puts the locals in the now-unused parameter registers instead of copying them.
- Other parameter widths, casts and simple local bindings: no help.

## Files

- `sub_08022BB8.c`: the current draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 516/540 (-24), 21.1%. Per-arm shifted x/y pseudos are retained, but agbcc coalesces them into dead parameter registers instead of emitting the ROM's saved-register copies. Parameter widths, casts and simple bindings are ruled out; selector CFG is settled.

</details>
