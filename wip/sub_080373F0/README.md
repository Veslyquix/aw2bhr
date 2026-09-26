# sub_080373F0

0x080373F0, 88 bytes, THUMB, parked.

Best score so far: 73.9%.

## Files

- `sub_080373F0.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

73.9% identical, SIZE-EXACT and instruction MULTISET exact

### What still differs

Basic-block layout only. Three source-level `return 0`s compile to three identical `movs r0,#0; b <epilogue>` blocks; cross-jumping keeps exactly ONE and redirects the other two. The residual is entirely WHICH copy it keeps. The ROM keeps the MIDDLE one. Register allocation, pool contents and instruction order within every block are already correct, so there is nothing for a one-register or one-constant lever to move.

### Why it is close

Nothing about the C is wrong in the ordinary sense -- no wrong shape, no wrong type, no missing statement, no misread idiom. Size is exact and the multiset of emitted instructions is exact. Only the surviving cross-jump target differs.

### Already ruled out

- decomp-permuter -- 300 s, 19,619 iterations from the 73.9% draft: ceiling 73.9%, no byte match, best three candidates 73.9 / 40.9 / 61.4. Wave 37's 'order-wrong and slot-wrong are precisely its cases' means INSTRUCTION order within a block, not which block survives cross-jumping. This was the ideal case on paper (size-exact, multiset-exact, permuter never previously tried) and it produced nothing.
- Nine wave-43 spellings -- all put the surviving copy LAST.
- One wave-51 spelling -- put it FIRST.
- Register-allocation levers generally -- allocation is already byte-correct; there is no residual for them to act on.
- WAVE 81 (W81-C): temporary-profile sweep on the unchanged draft -- configured 73.9% is the best; no-force 73.9% identical, o1/o1-no-force 28.4%, old-agbcc/old-agbcc-no-force 71.6%. The toolchain axis is measured and closed here too.

### Settled

- The surviving copy is the one entered by FALL-THROUGH; the other two are branch-only and therefore deletable outright. No spelling found so far makes the MIDDLE site the fall-through-entered one, and that -- not the number or order of the returns -- is the thing a candidate has to control.
- A size-exact, multiset-exact near-miss can still be unreachable by every allocation lever. Classify the residual before spending a budget: this is a fourth residual kind (basic-block layout), alongside shape, type and allocation/constant-placement.

### Why it is parked

Wave 57 (W57-E). Residual is cross-jumping block selection, not source shape, types or allocation. Needs a spelling that makes the middle `return 0` the fall-through-entered block; the permuter provably cannot reach it.
