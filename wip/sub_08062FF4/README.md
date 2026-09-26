# sub_08062FF4

0x08062FF4, 1008 bytes, THUMB, parked.

Best score so far: not measured.

## What it does

MultiBootMain from Nintendo's AGB SDK: one step of the multiboot (send-a-game-over-the-link-cable) state machine for the MultiBootParam at mp. Depending on the current state it probes the connected machines through the SIOMULTI registers, runs the handshake or sends the next data word, and returns 0 or a status or error code.

## How close it is

Compiles 8 bytes short of 1008, with all 14 constants present in the ROM's order. The 22.3% byte score means little: the entry block is identical, and the first difference is only a branch target moved by the shortfall further down.

## What is left

Locate the missing bytes in the switch body: the case 0xd1 loop is itself 2 bytes too long (it reloads an address the ROM keeps in a register), so the rest of the body is 10 bytes short. The published SDK source of MultiBootMain is the best guide to the original block shapes; the default case's register swap costs no size and can wait.

## Already tried

- Letting the compiler rotate the two case-0 loops: 56 bytes short. Writing their first iteration out by hand, as the original did, recovered 44 (kept).
- A literal 3 instead of the variable i in the hand-written SIOMULTI read: the address folds to a different constant.
- The probe loop as `while (--i != 0)`: the compiler moves a constant out of the loop and a pool word is lost; a goto loop fixes it (kept).
- Spelling all four `return 0` sites as `goto ret0`: byte-identical to converting two of them. Only the position of the trailing `return 0` block matters (kept at the end, worth 8 bytes).

## Files

- `sub_08062FF4.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

PARKED Wave 70 at 996/1008 (-12 section), with code only one instruction (-2) short and pool 13/14. This is the SDK MultiBootMain shape; both case-0 loops are source-peeled and settled. Wave 70 localized the net deficit entirely to return/block layout and corrected the prior NOTES claim: ROM also contains the d1 asrs/ands/cmp/beq sequence, so it is not candidate-only. Preserve the peeled loops and established MultiBootParam layout.

WAVE 88 (W88-A then W88-D): 996 (-12) -> 1000 (-8), 14.4% -> 22.3% under `configured`, pool now 14/14 in the ROM's exact order. CONFIRMED: the missing pool word was the case-0 probe loop, a GOTO loop (invariant rebuilt in body, un-rotated top test); the park's '-12, one instruction short' was two compensating errors. REFUTED (W88-D, byte-neutral): converting every `return 0` to `goto ret0` -- cross-jumping is post-reload and merges every return tail regardless of spelling; W88-A's +8 came from the trailing block's POSITION and that lever is spent in one edit. 'First difference at +0x14' is a MISREAD: it is a branch whose target shifted; the entry block is byte-identical. The real -10 sits in `case 0xd1` (ROM holds the SIOMULTI address across the do-loop; candidate spends an extra pool load, +2 there) and the `default:` prologue is a pure allocno permutation with no size in it. Evidence: work/sub_08062FF4/W88-notes.md.

</details>
