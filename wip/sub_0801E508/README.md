# sub_0801E508

0x0801E508, 976 bytes, THUMB, parked.

Best score so far: 22.6%, -28 bytes.

## What it does

Copies a sprite's list of OAM entries into the OAM buffer, rotating and scaling each entry's position about (a2, a3) using the scale and angle in affine record gUnknown_0200F720[a5]. Returns 1 without writing if the entries would not fit, otherwise 0.

## How close it is

Compiles 28 bytes too short (948 against 976). Every float, sin/cos and library call is now in the original's order; the shortfall is in registers and the stack frame: the original keeps more values live at once, in a larger frame, and copies them between high and low registers repeatedly.

## What is left

Find a way of writing it that keeps as many values live as the original does (the object pointer `e` in a high register and a 0x24-byte frame instead of 0x20), so that the extra register copies appear.

## Already tried

- Writing each coordinate as one inline expression: the compiler moved both trig calls ahead of the size lookup and shared sin and cos between the x and y parts; 44 bytes short. The current explicit temporaries fixed the call order and gained 16 bytes.
- Putting every float term in its own statement, with the size lookups computed first, `a4` kept alive and a separate loop counter: 76 bytes short, worse, because values then live for even less time.
- Reading the affine record's halfwords unsigned instead of through `s16 *e`: adds an unsigned-correction float add that the original does not have.

## Files

- `sub_0801E508.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 948/976 (-28), 22.6%. Explicit arithmetic temporaries now preserve every observable soft-float, trig and libgcc call in ROM order. Remaining deficit is frame/register allocation, not arithmetic semantics or call association.

</details>
