# sub_08057BDC

0x08057BDC, 360 bytes, THUMB, parked.

Best score so far: 61.9% (best.c).

## What it does

Per-frame update of the two-side display. For the first eight frames it slides a widening slice of tiles between two tilemap buffers; then, for each side whose shown value has not reached its target, it steps the value toward the target and redraws that side.

## How close it is

Compiles 4 bytes short of 360. Everything up to the second loop is identical; in the second loop the compiler keeps a different table address in a register across iterations than the ROM does, and that also reorders the last nine constants in the pool.

## What is left

Stop the compiler keeping gUnknown_08551A04's address in a register for the second loop (it is the only one of the three addresses used twice per pass), so that it keeps gUnknown_085D6A48 and gUnknown_03004582 there instead, as the ROM does.

## Already tried

- Binding the row table gUnknown_085D6A48 to a local before the second loop: the compiler substitutes the global straight back; no change.
- Also binding gUnknown_03004582 to a row-pointer local: the compiler turns it into a pointer stepped by 16 each pass, which the ROM does not have in this loop.
- Dummy self-assignments of the gUnknown_08551A04 pointer and of what it points to (`+= 0`): gUnknown_08551A04 still wins the register.
- Dead uses of locals: bring the size back to 360 (this is what best.c holds, 61.9%) but keep the wrong register choice and disturb the first loop.

## Files

- `sub_08057BDC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 70 at 356/360 (-4). Everything before loop 2 is byte-exact. ROM hoists gUnknown_085D6A48 and gUnknown_03004582 while rematerialising gUnknown_08551A04; candidate does the reverse. Pointer bindings, pointer/pointee self-use barriers and dead-local uses are ruled out: the latter recover size but preserve the wrong hoist and perturb loop 1. Residual is one LICM priority choice.

</details>
