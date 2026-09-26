# sub_0801C01C

0x0801C01C, 116 bytes, THUMB, parked.

Best score so far: 27.6%, -8 bytes (best.c).

## What it does

Draws one sprite through PutSpriteExt at screen position (a1, a2). It takes an 8-byte OAM template a4 by value, ORs the 9-bit X into its upper half-word (OAM attribute 1) and the 8-bit Y into its lower half-word (attribute 0), passes the template's second word as attribute 2 and a3 as the sprite data pointer, and passes a5 through as the first argument.

## How close it is

Compiles 8 bytes too short (108 against 116). The arithmetic and the call are right; the missing bytes are register moves: the original parks the shifted template word in a high register and moves it back before the call, and reads attribute 2 earlier, while the draft keeps everything in low registers.

## What is left

Find a way of writing it that keeps the shifted template word alive in a high register across the other calculations, as the original does. The odd 64-bit shift of a zero upper half, which the original clearly contains, is already reproduced by the in-place `u64 pair` local.

## Already tried

- Writing the attribute calculations with plain 32-bit locals: the compiler drops the original's 64-bit shift and the code was 40 bytes short.
- Using a literal zero or other casts to a 64-bit type instead of shifting the `u64` local in place: the 64-bit shift is again optimised away.
- The permuter on an earlier draft (over 160 saved results): no match.

## Files

- `sub_0801C01C.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 108/116 (-8), 27.6%, improved from -40. A mutable in-place u64 shift reproduces the ROM's unique zero<<16 DImode path and high-half expression. Remaining eight bytes are r8/sl/r9 lifetime allocation; direct locals, literal zero and alternative DImode casts fold away.

</details>
