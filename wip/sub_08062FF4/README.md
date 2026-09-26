# sub_08062FF4

0x08062FF4, 1008 bytes, THUMB, parked.

Best score so far: 22.3%, -8 bytes.

## Files

- `sub_08062FF4.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 70 at 996/1008 (-12 section), with code only one instruction (-2) short and pool 13/14. This is the SDK MultiBootMain shape; both case-0 loops are source-peeled and settled. Wave 70 localized the net deficit entirely to return/block layout and corrected the prior NOTES claim: ROM also contains the d1 asrs/ands/cmp/beq sequence, so it is not candidate-only. Preserve the peeled loops and established MultiBootParam layout.

WAVE 88 (W88-A then W88-D): 996 (-12) -> 1000 (-8), 14.4% -> 22.3% under `configured`, pool now 14/14 in the ROM's exact order. CONFIRMED: the missing pool word was the case-0 probe loop, a GOTO loop (invariant rebuilt in body, un-rotated top test); the park's '-12, one instruction short' was two compensating errors. REFUTED (W88-D, byte-neutral): converting every `return 0` to `goto ret0` -- cross-jumping is post-reload and merges every return tail regardless of spelling; W88-A's +8 came from the trailing block's POSITION and that lever is spent in one edit. 'First difference at +0x14' is a MISREAD: it is a branch whose target shifted; the entry block is byte-identical. The real -10 sits in `case 0xd1` (ROM holds the SIOMULTI address across the do-loop; candidate spends an extra pool load, +2 there) and the `default:` prologue is a pure allocno permutation with no size in it. Evidence: work/sub_08062FF4/W88-notes.md.
