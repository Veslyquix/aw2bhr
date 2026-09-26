# sub_0801F4B4

0x0801F4B4, 572 bytes, THUMB, parked.

Best score so far: 58.7%, -8 bytes (best.c).

## What it does

Runs the movement-range flood fill for a unit starting at cell (a1, a2). It fills the cost map with 0xFF, loads the move-cost table for unit type a3 and seeds a queue with the start cell at cost 0; then it repeatedly swaps two queues of 4-byte {x, y, direction, cost} records (at offsets 0x2c and 0x5a4 of the work area gUnknown_084999C8) and, for each record, tries a step in every direction except straight back (sub_0801F6F0), stopping when a pass finds the read queue empty. a4 and a5 are only stored into the work area here.

## How close it is

Compiles 4 bytes too short (568 of 572). 58.6% of bytes are identical, a number that means little because the size difference shifts everything after it. Control flow, the switch, the calls and the constants all line up.

## What is left

At two places, where the two queue-swap branches meet and at the bottom of the inner loop, the original copies the address of the read cursor gUnknown_0300409C into a second register; our build reads it directly. Find source that makes the compiler make those two copies.

## Already tried

- Holding `&gUnknown_0300409C` in a pointer local, for the whole outer loop or only after the queue swap: the queue step compiles worse and the switch gets shorter; the two copies do not appear.
- A pointer-to-pointer local set after the queue swap: 564 bytes, 4 more bytes short.
- Pinning that local to the register the original uses: the compiler still loads through it instead of copying.
- Writing the inner loop as `while` instead of `do/while`: no improvement.
- A long permuter run (about 25,800 attempts): no improvement.

## Files

- `sub_0801F4B4.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 71 at 568/572 (-4), 58.6%. ROM has two isolated copies of the force-address pointer around the swap-loop merge; whole-loop, after-merge, fixed-r1 and pointer-to-pointer bindings fold or regress. Prior long permuter and loop-form probes are negative.

</details>
