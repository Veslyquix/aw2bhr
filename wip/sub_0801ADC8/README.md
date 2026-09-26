# sub_0801ADC8

0x0801ADC8, 556 bytes, THUMB, parked.

Best score so far: 64.6% (best.c).

## What it does

Tidies the save slots in flash memory. It clears every slot's bit 3 in gUnknown_0200CC38.unk20 (apparently a 'keep' flag), then asks FindNewestCompleteSave (sub_0801B120) for a complete save with id 0xFF: if there is none it writes a fresh one with sub_0801A7D8, otherwise it sets bit 3 on that save's parts. It then wipes the unkept slots whose tag (unk00) is 0, calling sub_0801B5E8 up to four times until sub_0801B018 no longer reads the slot back as valid, and marks every other unkept slot as free (0xFF).

## How close it is

Compiles to the right size (556 bytes); 197 bytes differ. The instructions are nearly all right; what differs is register choice and block order in the two copies of the wipe-and-retry loop.

## What is left

Find a way of writing the two identical wipe-and-retry loops that makes the compiler pick the original's registers and block order. The flag update that was missing, `(unk20 | 8 | v) & 0xEF` with v a zero held in a register, is already solved by declaring v as `int`.

## Already tried

- Declaring the zero operand as `u8 v = 0`: the compiler drops the OR and the code is 4 bytes short.
- Other ways of writing that zero (setting it before a call, in both arms of an if, inside an earlier loop, as `0 & global`, or as `(v & 0x10)` / `(v * 0x10)`): all drop the OR.
- Leaving v uninitialised: the compiler combines `v | 8` once before the loop, which the original does not do.
- A zero-filled local array indexed by the loop counter: the OR survives in the right shape, but it adds a load.

## Files

- `sub_0801ADC8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at exact size 556/556, 64.6%. The retained int zero restores the otherwise missing OR operand; remaining differences are duplicated-retry allocation/block placement. Earlier u8, uninitialised, array, global-derived and arithmetic-zero spellings are ruled out.

</details>
