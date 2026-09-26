# sub_080620FC

0x080620FC, 564 bytes, THUMB, parked.

Best score so far: 72.7% (best.c).

## Files

- `sub_080620FC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

568/564 (+4), 29.3% identical, first difference +0xa (positional; the hand draft, configured). best.c 72.7% is a chained-permuter variant carrying a semantically DIVERGENT `off` edit -- do not lift from it. old-agbcc: size-exact, 42.7%.

### What still differs

ONE surplus spill slot: `sub sp,#36` against the ROM's `#32`, which renumbers every `[sp,#N]`. The spilled value is `a1 * 0x20` ([sp,#0x18]), which the ROM keeps in sl and recomputes at the loop latch. Head: ROM `mov r8,r0 / movs r7,#0` vs draft `mov r9,r0 / movs r6,#0`. Inner block census -- ROM: i r4, j*2 r5, j r6, 0x417A r7, n r8, &gUnknown_030033EC sb, a1*0x20 sl, &gUnknown_08499590 ip, p r2, off r3 (scratch, no call inside). Draft: p r4, off r5, i r6, 0x417A r7, j*2 r3, &G r8, n r9, &g sl, j ip, a1*0x20 spilled. So the draft parks the two binding locals p/off in r4/r5 and j in ip where the ROM has j in r6 and p/off in scratch; the callee-saved deficit is what spills a1*0x20 and rotates the `_080622B8` tail.

### Why it is close

Control flow, every constant, both record spellings, the a1*0x20 / a1*0x3e0 CSE and the -1 store are all read out and exact (work/sub_080620FC/NOTES.md). Seven chained permuter runs climbed 29.3 -> 72.7 without a match.

### Already ruled out

- Wave 60 (W60-F): dropping the redundant `off` binding in the innermost block does not move the frame size.
- Wave 77 (W77-D): the W77-A array-vs-`(u8 *)base + n * sizeof` lever does not apply -- the pool readout shows every body base is a plain literal re-materialised at each use.
- Wave 79 (orchestrator): all seven compiler profiles, zero matches; old-agbcc is size-exact at 42.7%.
- WAVE 80 (W80-D): removing the `p` and `off` binding locals (keeping `t`, `rows`, `cells` for the ROM's (p + c) + t grouping, which a raw sum cannot produce -- see sub_0803D558) still spills a1*0x20 (`sub sp,#36`) and rotates the rest: n -> sl, j -> r9, 0x417A -> r8, p -> r5, rows -> r4, cells -> r3. Not a lever. The three written-out record offsets are RIGHT: the ROM CSEs `n*8 + a1*0x3e0` in r3 across the three stores and reloads gUnknown_030033EC each time, which is exactly what the written-out form gives.

### Settled

- `rows = p + 0x417a; *(u16 *)(rows + t)` is load-bearing: the ROM's `adds r0,r2,r7; adds r0,r0,r5` grouping needs the statement boundary (EXPAND_SUM reassociation puts the constant last in any single expression).

### Why it is parked

Residual kind 3: one surplus callee-saved value from the binding locals' scoping, with the ROM's j-in-a-low-register / p-and-off-in-scratch census not reproduced by any scoping tried. The permuter chain is not exhausted but its best.c is semantically invalid.
