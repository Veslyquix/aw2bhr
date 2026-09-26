# sub_0802216C

0x0802216C, 560 bytes, THUMB, parked.

Best score so far: 39.5%, -8 bytes.

## What it does

Writes a 2x2 block of background tilemap entries at dst (the map is 32 entries wide, so dst[0x20] is the row below). a3 is an army's first unit slot (0x00, 0x40, 0x80 or 0xC0, or 0x100 for the army whose turn it is), so (a3 >> 6) + 1 is the army number; the top two tiles are a per-army base tile (gUnknown_0809097C) plus a graphic index from sub_080261A4(army, a2), and the bottom two show one of several alternative tiles chosen by sub_0802706C and the flags a4, a5, a7, a8 and a6. When a3 is 0 or 0x80 the block is drawn mirrored, with the horizontal-flip bit 0x400 set; what the picture is (probably a unit icon with status marks) is not confirmed.

## How close it is

Compiles 8 bytes too short (552 of 560). 39.5% of bytes are identical, which means little because of the shift. Every statement is present and in the original's order; the rest is which values sit in which registers, plus one extra stack slot.

## What is left

Three register choices are tied together: the original keeps a2 in a register instead of on the stack, keeps 0x400 in its own register, and gives t and r the opposite registers to ours. The permuter has no recorded run on this draft and is the next thing to try.

## Already tried

- Swapping the declaration order of t and r: identical output.
- Holding 0x400 in an ordinary local: the compiler folds it back into constants; no change.
- Pinning that local to the register the original uses: the constant is now set up once and shared, as in the original, but a2 is still stored on the stack and another value moves register.

## Files

- `sub_0802216C.c`: the current draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 552/560 (-8), 39.5%. Fixed-r8 base binding correctly groups repeated 0x400 uses, but a2 still spills instead of occupying sl, leaving the frame and t/r allocation wrong. Declaration order and ordinary scalar base locals are byte-neutral.

</details>
