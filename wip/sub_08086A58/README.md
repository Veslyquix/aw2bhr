# sub_08086A58

0x08086A58, 416 bytes, THUMB, parked.

Best score so far: 97.6% (best.c).

## Files

- `sub_08086A58.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

WAVE 85: 97.6% identical, SIZE-EXACT 416/416, 10 differing bytes, first difference at +0x22 (re-measured by exit code after the wave-85 session). Was 13.9% / -24 at park time; the W85-D2 giv lever took it to 95.2% and the W85 f-flag spelling to 97.6%.

### What still differs

ONE strength_reduce GIV-SELECTION choice, with four symptoms. The ROM's giv for the y coordinate is `i * 2` (r8, `movs r0,#2; add r8,r0`) and it recomputes `b + 5 + that` and the (s16) shift pair at BOTH call sites. The draft reduces the whole `(s16)(b + 5 + i * 2)` instead -- one giv holding `(b+5) << 16` stepped by 0x20000, with `asr r1,r6,#0x10` at each use. That costs a register: `b` is then live only in the preheaders and at sub_08087548, so it spills to [sp,#8] (frame 0xc against the ROM's 8), `n` lands in r8 instead of r7 and the counter in r7 instead of r6, and in the else arm the freed high register r9 holds the .LC2 address across the loop where the ROM re-loads =gUnknown_08499578 inside it.

### Why it is close

Structure, control flow, both loop bodies, both call sites and every pool word are right. Argument 2's signedness, the gUnknown_081D9438 pool-word reading, the list-pointer idiom and the ternary's arm order are all settled and reproduce exactly.

### Already ruled out

- Wave 54: argument 2 is `int`, not the `u32` include/unknown-functions.h carried since wave 44 -- all three tests are SIGNED branches and u32 also blocks check_dbra_loop so neither counted loop reverses. Header retyped, both callers re-verified by exit code.
- Wave 54: gUnknown_081D9438 is NOT an object, it is a -fforce-addr .rodata pool word holding 0x08499578. Naming gUnknown_08499578 honestly reproduces the ROM's ldr/ldr/ldr triple and the plain double load in both loops.
- Wave 54: the list pointer must be `(u8 *)&gUnknown_02027F74` bumped by 4 in a statement of ITS OWN; as one expression agbcc folds it to a single pool word gUnknown_02027F74+0x4 where the ROM has a runtime `adds r0,#4`.
- Wave 54: the `f` flag is `(x != 0) ? 0 : 1`, NOT `(x == 0) ? 1 : 0` -- agbcc presets the ELSE arm's value and conditionally overwrites, so the ROM's movs r5,#1 / cmp / beq / movs r5,#0 reads out as a ternary whose ELSE value is 1.
- Wave 54, against the giv itself, all byte-identical to the draft: binding `j = i * 2;` in a statement of its own inside the loop; assigning through an s16 local at each call site with a FRESH name per site (agbcc folds the HImode store away and re-derives the same <<16 giv, so a HImode pseudo is NOT a barrier to strength_reduce); parenthesising the invariant addend.
- Wave 59 (W59-G): re-verified by exit code, still -24 / 13.9%. Classification only, no attempt spent -- see note.
- W85-D2: the giv lever from c_08086BF8 -- `int k = i * 2;` as a BLOCK-LOCAL inside each arm, `y = b + 5;` its own statement, `z = k + y;` -- landed: 13.9 -> 95.2. Function scope does not reduce.
- W85, f-flag SHAPE SOLVED: bind the call result to a local (`u8 c = sub_0803CB24(q[a+i]);`) then `f = 1; if (c != 0) f = 0;` -- the preset must come AFTER the call/narrowing. This reproduces the ROM's movs r5,#1 / cmp / beq / movs r5,#0 exactly and took 95.2 -> 97.6. The W54 line above is REFUTED: that ?: spelling presets the THEN arm (measured), as do the plain `(x == 0)` comparison and `(x == 0) ? 1 : 0` (both fold to preset-0/bne), and `f = 1; if (x != 0) f = 0;` without the local puts the preset BEFORE the bl (92.8%).
- W85, q-hoist axis DEAD (measured twice, with two different f-spellings): moving `q = (u8 *)&gUnknown_02027F74; q += 4;` before the loop DOES reproduce the ROM's ldr/movs#0/adds#4 preheader order, but it flips the k-giv from r8 to r7 and displaces n (measured 95.2 -> lower; with the c-local f spelling, 41.6 / -8). The two orders trade against each other; not reachable together from this spelling set.
- W85 residual after all this: 10 bytes -- the loop-1 preheader order (ldr before movs#0) with its sl-copy scratch cascade (mov r3 vs r1), and the latch step scratch (movs r0,#2 vs movs r3,#2). Allocno-order class. A 300s permute run from the 97.6% base was killed by the MCP client timeout at ~5 min with no scored candidate; re-run full-length before reasoning from it.

### Notes

THIRD PARKED INSTANCE OF ONE AXIS. This is the same giv-selection axis as sub_0800CAA0 (candidate carries a giv the ROM does not, the ROM rematerialising instead), pointing the same way. Both documented levers for giv selection -- a statement of its own, and a narrower type at the use -- were already measured here and are byte-neutral. There is no untried spelling in front of this function; what it needs is a mechanism for suppressing strength_reduce on ONE candidate giv while leaving another alive, and no wave has found one. The permuter's documented cases are slot- and order-wrong allocation, which this is not. Treat it as evidence for that gap rather than as a target.

### Wave 86

WAVE 86 (W86-A): the wave-85 permuter run re-run FULL LENGTH from the 97.6% base (w85-97p6-baseline.c): 300 s, 4 threads, 14,087 iterations, ended on its own deadline -- ONE candidate harvested (score 155) and it verifies at 93.0% (29 of 416), WORSE than the base. This converts wave 85's 'killed by the MCP client timeout' into a real negative. No chained second run (nothing above the ceiling to chain from). Configured profile, 416/416, 10 bytes, first difference +0x22, unchanged. Residual stands as allocno-order class (loop-1 preheader ldr-before-movs#0 with its sl-copy scratch cascade, and the latch step scratch).
