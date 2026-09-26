# sub_0803E6C4

0x0803E6C4, 160 bytes, THUMB, parked.

Best score so far: 90.6% (preprocessed form, not included).

## Files

- `sub_0803E6C4.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

90.6% -- 160 bytes, candidate 156 (-4), first difference at +0xa. TWO agents (W38-C, W38-F); the second was given the diagnosis below and did not move it. The original opens `adds r3,r2,#0` (copy param3 to a fresh register) then `adds r2,r1,#3` (param2+3 into a DIFFERENT register), keeping both incoming parameters live and putting +3 in a fresh local; the candidate does `adds r1,#3` in place. Everything downstream -- the pool-word register choice, the [pc,#104] vs [pc,#100] offsets, the -4 bytes -- follows from that one decision, so do not chase the pool separately. Wave 37 refuted the fixed 'reuse rather than a fresh name' rule (it inverts; decide by the exit test); The exit test here is `cmp <value>, r0; bge` against [[global]]->unk02. Both orderings were tried. Not tried: the toolchain axis. WAVE 38. WAVE 81 (W81-C): the toolchain axis is now measured -- default/no-force/old-agbcc/old-agbcc-no-force all reproduce 156 vs 160 at 16.9% identically, o1/o1-no-force go +8 bytes at 20.0%. No profile helps; that lead is closed.

WAVE87: WAVE 87 (W87-C, unnamed-twin axis): twin sub_0803E594 (src/decomp/c_0803E594.c) CONTAINS the construct family (its match header's fact #1: parameters are the saved copies, locals the loop variables) -- a genuine positive on the W86 screen -- but the transplant (`int z = a3;` used at the call) is BYTE-IDENTICAL: cse substitutes the parameter and no copy exists. The twin's copies are real because its locals are MUTATED and the parameters RE-READ in later preheaders; here a1 is read-only, a3 read-only at the call, a2 killed at once by `row = a2 + 3`. Second hypothesis, the W80-A rule as the brief stated it ('a parameter MODIFIED anywhere is copied out at entry; read `adds r3,r2,#0` at +0x0 backwards as a modified param'): REFUTED -- `a3 = 0;` as the function's last statement is byte-identical; assign_parms emits the copy unconditionally and COALESCING decides whether it survives, i.e. only when the parameter's own pseudo is still live past the point the overwriting value is produced (doc chapter). Residual precisely: the ONE missing instruction is `adds r3,r2,#0` (a3's entry copy) + 2 bytes alignment; the loop nest is instruction-exact. Classification unchanged (wave 79): which pseudo wins r1 -- the guard's force-addr constant or the row counter -- with no source distinction; toolchain (79/81), twin (87) and W80-A (87) axes all closed. Do not give this another budget without a NEW mechanism, and not another 'bind a1/a3 to a local'. Configured, 156/160 (-4), 16.9%, unchanged, 0 try_match.
