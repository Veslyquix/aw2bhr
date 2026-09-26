# sub_0801FAC4

0x0801FAC4, 540 bytes, THUMB, parked.

Best score so far: 65.9% (best.c).

## What it does

Paints a widening triangle of cells with value a5 into the current map plane (through the row table gUnknown_03003340), starting at cell (a1, a2) and reaching a4 steps in direction a3 (0 down, 1 up, 2 left, 3 right). Step k of the triangle is 2k-1 cells wide, centred on the start cell, and every row or column is clipped to the map's width and height.

## How close it is

Compiles 4 bytes too short (536 of 540). 36.3% of bytes are identical, which means little because the missing bytes shift everything after them. The logic, the case order (1, 0, 2, 3) and the two-statement start calculation are settled.

## What is left

The original keeps two loop values in two separate stack slots (the fixed bound and the stepping value); our build shares one slot between them. Find source that gives the compiler two slots without growing the code.

## Already tried

- A separate bound variable scoped to cases 0, 2 and 3: the stack frame reaches the original's 8 bytes, but the code grows to 548 (8 too long) and the registers diverge in those cases.
- The same bound variable in case 0 only, at case or function scope: still one slot, and the case's registers change.
- Wrapping each case loop so it cannot run zero times: no change.
- Merging loop variables: no improvement.
- Permuter, about 25,500 attempts: no improvement.

## Files

- `sub_0801FAC4.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 536/540 (-4), 36.3%. ROM uses two stack slots for loop invariant/stepped bounds while the draft coalesces to one. Zero-trip loops and explicit scoped bounds, including case-0-only placement, are ruled out; the latter grows to 548 or remains one-slot.

</details>
