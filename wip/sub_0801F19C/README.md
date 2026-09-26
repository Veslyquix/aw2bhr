# sub_0801F19C

0x0801F19C, 80 bytes, THUMB, parked.

Best score so far: 51.2% (best.c).

## Files

- `sub_0801F19C.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

82 bytes of code + 2 bytes of pool-alignment pad, so trymatch reports 84 (+4), 45.0% identical (wave 77, W77-K). THE PREVIOUS 76-byte / 51.2% DRAFT IS IN best.c. THE NEW DRAFT SCORES LOWER AND IS CLOSER: the old one was TWO instructions SHORT of the ROM, this one is ONE instruction LONG. Read the instruction count, not the score.

### What still differs

ONE INSTRUCTION, and it is `i`'s register. The ROM keeps i in r1 from `adds r1,r0,#0` after sub_0801F3D4 straight through to sub_0801F444's second argument, for free; the draft puts i in r2 and pays `adds r1,r2,#0` before the call. THE RECORDED -4 IS GONE: the draft now emits the ROM's result-parking copy `adds r2,r0,#0`, loads 0x3ff into r0 as the ROM does, and restores with `adds r0,r2,#0`.

### Why it is close

Everything from the prologue through `bl sub_0801F444` is byte-identical, including the r6/r8/r5/r4 assignment of a1/a2/a3/n, the gUnknown_0848B780 product and both call sequences. The statement structure is confirmed by the promoted caller src/decomp/c_0801F1EC.c, which fixes this function's arity and widths at its call site.

### Already ruled out

- WAVE 77 (W77-K): THE -4 IS SOLVED, BY A DEAD IN-EXPRESSION ASSIGNMENT ON THE CALL RESULT -- `CpuFastSet((void *)(i = (int)sub_0801F444(a1, i)), ...)`. This produces both halves of the residual at once: the park copy AND the 0x3ff mask winning r0. The previous entry's mechanism was exactly right ('the result never becomes a pseudo at all -- it flows from one hard r0 to the next via a copy suggestion, so r0 is simply unavailable when the constant is allocated'); what it lacked was the construct that forces the pseudo. A plain result local does not, because regmove coalesces it (wave 39, still true). This is W73-D's sub_08073480 lever applied to a CALL RESULT rather than to a multiply, and it is the first time that lever has transferred outside 0x08073.
- WAVE 77 (W77-K): WHY THE LEVER DOES NOT CLOSE IT, AND WHAT THE NEXT AGENT NEEDS. Reusing `i` merges i's two live ranges into ONE pseudo, and that pseudo cannot be r1 -- r1 carries the CpuFastSet destination while the parked value is live. So the ROM's park is a DIFFERENT pseudo from `i` (it sits in r3, a scratch), which means the original source had a variable there that this function does not otherwise contain. Nothing else in scope is dead at that point: a2, a3 and n are all read afterwards. Parking into `a1` changes the frame (a1 leaves r6, a2 leaves r8, push becomes {r4,r5,r6,r7,lr}); parking into `a3` or `n` collapses the mask computation. All three measured this wave.
- WAVE 77 (W77-K): assigning the DESTINATION in-expression to `i` (`(void *)(i = (int)((u8 *)a2 + (a3 & 0x3FF) * 32))`) DOES break the a2 coalescing and reproduces the ROM's non-destructive `mov r2,r8; adds r1,r2,r5` in place of the draft's `add r8,r5; mov r1,r8` -- but it puts the destination in r2 and still pays the same extra copy. Combining it with the source park (destination into a3) loses the r8 frame entirely. And `(void *)((int)a2 + (a3 & 0x3FF) * 32)` is BYTE-IDENTICAL to the pointer spelling, replicating the wave-39 integer-space result in this new context.
- WAVE 77 (W77-K): LOCAL DECLARATION ORDER IS BYTE-NEUTRAL IN agbcc. Measured on the sibling sub_0801F234 with all four permutations of its four locals, and replicated independently on sub_08052BBC. Pseudo creation order from declarations does not reach register allocation. Do not spend a probe permuting declarations, here or anywhere.
- THE `lsls #5; lsrs #2` -> `lsls #3` FOLD IS NOT WHAT COSTS THE BYTES HERE, and three waves of drafts plus the docs/agbcc-codegen.md section "`nonzero_bits` range analysis is ONE residual wearing three faces" all say it is. Counted instruction by instruction: the ROM's `ands rX,rC; lsls rD,rX,#5; lsrs rD,rD,#2` is 3 insns and the folded `ands rX,rC; lsls rX,rX,#3; adds rD,rX,#0` is also 3 -- the saved shift is spent on a copy, because the folded form computes the count into a callee-saved register and must move it to the argument register while the ROM's two-shift form writes the first shift straight into it. Defeating nonzero_bits would therefore not close either function. Doc corrected in wave 39.
- Binding sub_0801F444's result to its own local before the CpuFastSet statement (`src = sub_0801F444(a, i); CpuFastSet(src, ...)`) -- BYTE-IDENTICAL to the nested form. gcc coalesces the copy, so this does not create the pseudo that would let the mask constant win r0. This was the obvious reading of the ROM's `adds r3,r0,#0` and it is wrong.
- Integer-space address arithmetic on the CpuFastSet destination (`(void *)((int)base + (v & 0x3FF) * 32)`) -- BYTE-IDENTICAL. This is the wave-39 lever that closed sub_0801FD9C, and it does nothing here: it only flips a commutative add whose operands are both non-constant registers, and these destination adds already have the ROM's operand order.
- old_agbcc with -fprologue-bugfix removed -- still -4 and WORSE at 42.5%, and it reverses the two gUnknown_0848B780 byte loads (+1 before +0) where the ROM and default agbcc both do +0 then +1. The toolchain is not the axis; probed by monkeypatching agbenv._OVERRIDES, leaving data/compiler-overrides.json untouched.
- Every spelling of the count arithmetic -- retracted twice already (waves 33 and 36) and now shown to be byte-neutral anyway. Do not re-measure it.
- Wave 38 (W38-D) separately refuted the `reg_n_sets` / second-assignment route to defeating nonzero_bits.

### Settled

- `adds r1, r0, #0` after `bl sub_0801F3D4` is NOT a dead copy, which the wave-39 assignment brief asserted. It is sub_0801F444's SECOND ARGUMENT: nothing writes r1 between that copy and `bl sub_0801F444`, so the value is live across all the intervening gUnknown_0848B780 address arithmetic. include/unknown-functions.h already records the call as `sub_0801F444(a1, sub_0801F3D4(a1))`.
- The -4 is ONE fact, not two. Earlier drafts listed the shift fold and the result parking as separate 2-byte residuals; the fold is byte-neutral and the parking pair is the entire difference.
- `u32 n` -- the count shifts with `lsrs`, not `asrs`.
- Statement order is forced and correct: sub_0801F3D4 first, then the product, then the CpuFastSet whose first argument holds the sub_0801F444 call. gcc evaluates the call-bearing argument first, which is why the product must be its own statement ahead of it.

### Why it is parked

Register allocation, not source semantics -- but the allocation fact is now ONE instruction rather than two, and it is named: `i`'s pseudo carries both the loop index and the parked call result, so it cannot be r1. Park with sub_0801F234, which now shares the LEVER as well as the residual. Draft at work/sub_0801F19C/sub_0801F19C.c.

### Wave 81

WAVE 81 (D): variant measured -- parking into a FRESH dead variable q inside the first argument reproduces i's ROM allocation EXACTLY (i straight to r1 after sub_0801F3D4, pool word to r2, no adds r1,r2,#0 arg copy), proving the merged-i pseudo was what displaced i out of r1; but regmove deletes q's park entirely (result never becomes a pseudo), losing both the post-call park copy and the restore, landing 76 bytes (-4) at 51.2% -- an exact tie with the old best.c from the opposite direction. Conclusion firm in a second context: the park target must carry an ALREADY-LIVE range, freshness defeats the W73-D lever. Renaming i->p byte-neutral.

### Wave 86

WAVE 86 (W86-F): not probed; its sibling sub_0801F234's wave-86 entry applies (the twin lever needs an already-live dead parameter and neither sibling has one; statement order of independent statements is byte-neutral for allocno numbering). Configured, 82/80 (+2), 51.2%, unchanged.
