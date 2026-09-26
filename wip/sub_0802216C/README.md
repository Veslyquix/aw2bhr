# sub_0802216C

0x0802216C, 560 bytes, THUMB, parked.

Best score so far: 39.5%, -8 bytes.

## What it does

Writes a 2x2 block of background tilemap entries for one army: a per-army base tile plus a graphic from sub_080261A4 on top, and status tiles chosen by flags below. Two of the army slots are drawn mirrored. What the picture shows (probably a unit icon with status marks) is not confirmed.

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
