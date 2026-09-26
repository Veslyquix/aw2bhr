# sub_0806AB9C

0x0806AB9C, 360 bytes, THUMB, parked.

Best score so far: 41.9%, -8 bytes.

## What it does

Per-frame draw of a scrolling group of sprites for a proc. The group's y is half the proc's halfword counter unk44: it draws unk48 sprites from the codes in unk2f[], one sprite at x 0x3a, up to three icons 16 pixels apart from x 0x6a for the unk2c[] entries that are not -1, and one sprite from the 16-byte table gUnknown_085816F0[unk4c], each only when its y is on screen. Then it decrements the counter and calls Proc_Break once y is below -0x7c.

## How close it is

Compiles 8 bytes short of 360, 41.9% of bytes in place. The difference is in the third loop (the three icons): the ROM holds x shifted left 16 bits, computed once per pass and shared by the 0x1ff mask and the increment, which frees a register for the 0x1ff constant and gives it an 8-byte stack frame instead of the draft's 4.

## What is left

Find a spelling where the value masked with 0x1ff is a 16-bit truncation the compiler cannot prove unnecessary, so that it computes the shifted x once and shares it between the mask and the increment.

## Already tried

- u16 x with `x & 0x1ff`, int x with u16 casts, and an extra `x = (u16)x` in the loop: the compiler drops the truncation; no change (352 bytes).
- s16 x: the increment then uses a signed shift, which is wrong.
- No mask at all: 344 bytes (16 short), so the mask is real.
- The truncation written as an explicit shift pair: 348 bytes; computing x from i with no running value: 348 bytes.
- `x += 0x10` moved into the for-increment: byte-identical.
- A wide running value plus a separate u16 copy: gets the 8-byte frame but not the shared shifted value; the other way round keeps the 4-byte frame.

## Files

- `sub_0806AB9C.c`: the current draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 78 at 352/360 (-8), 41.9%. Separate narrow snapshots and live wide accumulators recover either the eight-byte frame pressure or the shifted truncation sequence, never both. Residual is the third-loop PRE and mask/preheader allocation.

</details>
