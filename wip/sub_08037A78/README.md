# sub_08037A78

0x08037A78, 268 bytes, THUMB, parked.

Best score so far: 27.6%, -4 bytes.

## What it does

For every map cell whose byte in the map's per-cell plane at offset 0x12 is non-zero (sub_0803CFA4 treats that byte as a unit id), merges a small tile into the buffer a1. The tile is chosen by the unit's army colour (gUnknown_030040F8, then gUnknown_08582E74, tile data in gUnknown_080A0F38); four halfwords of the destination are ANDed with the mask gUnknown_0849D534 and then ORed with the tile, at a position taken from the per-column and per-row offset tables gUnknown_03004010 and gUnknown_030032E0. What screen this draws is not confirmed.

## How close it is

Compiles 4 bytes short (264 of 268 bytes); 27.6% of bytes line up. Everything from the tile merge to the end, including both loop tests, is byte-exact; the whole difference is in the setup before each of the two loops.

## What is left

The original loads the map pointer as part of the outer loop's first test and saves it to the stack only after that test, and its inner loop's first test runs before the second pointer load; every spelling tried puts the load before the test. Not yet on record: making the load part of the loop condition itself (an assignment inside the condition).

## Already tried

- Using the map global directly with no local: the compiler cannot move the load out of the loop and reloads it in every inner iteration.
- One map-pointer local instead of two: 20.9%, worse than the two-local draft.
- Rotating the loop into a do/while: gets the original's 20-byte frame but reloads the pointer in the loop body and breaks the exact tail.
- Putting `map + 0x12` in its own local before the inner loop: 24-byte frame (original 20), more spills.
- Writing the stores through a two-halfword struct so they cannot alias the global: byte-identical.
- The automatic permuter for 45 minutes from the size-exact variant: no structural progress.

## Files

- `sub_08037A78.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 264/268 (-4), 27.6%. Body, increments and tails are byte-exact; residual remains in two loop preheaders. A rotated do/while obtains the ROM's 20-byte frame but reloads P2 in the body and breaks the exact tail, so the original fixpoint is retained. WAVE 61: permuter 2700s / 4 threads from the size-exact draft (32.5%). Best returned was 31.0% size-exact, i.e. slightly WORSE, with an excursion to 248 bytes (-20) at 13.4%. Restored unchanged. No structural movement.

</details>
