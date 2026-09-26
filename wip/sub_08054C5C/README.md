# sub_08054C5C

0x08054C5C, 560 bytes, THUMB, parked.

Best score so far: 93.4%.

## Files

- `sub_08054C5C.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 80 (W80-C), unchanged at exact size 560/560, 92.5% (configured), 42 differing bytes, first difference +0x13. Wave 80 measured the wave-78 `t = i` copy: it is a SIZE COSTUME -- without it the candidate is 568/560 (+8) but gets i into r6 and computes `&b[1]` from sp as the ROM does (the copy form derives it as `adds r0, #2` off `&b[0]`, which is what pays for the copy). The `((0, gUnknown_085D6A48))` comma anchor is byte-neutral (identical output with and without). True residual: the priority order of the `&d[0]` pseudo vs gUnknown_03004580 (ROM r8/r7, no-copy form r7/r8) and which of gUnknown_085D6A48 / _085D6A52 keeps r9 across the loop (ROM: A48; every draft form: A52) -- an allocno ordering with no construct found. Earlier: scoped setup/result locals and row/base bindings worsen the exact frame and allocation; the permuter's 93.2% assignment-in-condition candidate changes loop semantics and is rejected. ||| W83-D: THE WAVE-16 ZERO-TRIP DO/WHILE PROMOTION IS NEGATIVE HERE. Wrapping a zero-trip loop around ONLY the a[t] statement (to push gUnknown_085D6A48's pseudo past gUnknown_085D6A52's into sb as the ROM has it) scores 22.1% at 564/560 (+4), first difference +0xc IN THE PREHEADER: the promotion takes the whole a[t] address chain with it, including gUnknown_03004582's inner reference, and disturbs the stack-base spills. It promotes more than its target -- unlike c_0804D290 where the anchored expression owned one base only. Wave-80 fixpoint restored after the probe. SEVEN-PROFILE SWEEP: default == configured 42/560 (92.5%); no-force 548, o1 552, o1-no-force 548, old-agbcc-no-force 544 (all size-mismatched); old-agbcc 31.4%. No toolchain lever.

WAVE90: WAVE 90 (W90-A): 92.5% -> 93.4% (37 of 560, size-exact, first difference +0x13): permuter undirected run found `t = sub_08055058(a[side], b[side], c[side], i = d[side ^ 1]);` (the dead loop counter reused as an argument temp -- semantics-preserving; draft = w90-perm1-934.c). Chained undirected run 16,819 it: best permuter score 2300 is 69.3% by bytes (rejected). Run 3 DIRECTED (w90-directed.perm.txt: PERM_LINESWAP over the declarations + PERM_RANDOMIZE over the setup loop) 13,564 it from the 93.4% base: nothing better than 2420. Residual unchanged from W80: counter born in r3 and copied to r7 (the wave-78 `t = i` size costume; ROM r6), the sp+10 spill derived `adds r0,#2` off sp+8 instead of from sp, table base r6/sb=gUnknown_085D6A52 vs ROM r7/sb=gUnknown_085D6A48. Notes: work/sub_08054C5C/NOTES.md.
