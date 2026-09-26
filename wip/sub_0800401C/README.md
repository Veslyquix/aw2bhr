# sub_0800401C

0x0800401C, 172 bytes, THUMB, parked.

Best score so far: 82.0% (best.c).

## Files

- `sub_0800401C.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

19.8% identical, candidate 176 bytes (+4). The percentage is positional and meaningless here -- the instruction stream is correct end to end.

### What still differs

ONE REGISTER-ALLOCATION CHOICE and the three caller-save insns it drags in. ROM allocates r8=w, sb=h, sl=tt, r4=rx, r5=x, r6=y, r7=ry, [sp]=cx, [sp,#4]=the hoisted y+1. The draft allocates r8=w, sb=tt, sl=y+1, the same r4-r7, [sp]=cx, and leaves h in r3 (call-clobbered), so reload inserts str r3,[sp,#4] before both bl sub_08003F44 sites and ldr r3,[sp,#4] at their join. Both versions want 8 long-lived values and have 7 registers; the ROM spills y + 1, the draft spills h. Nothing about the statements differs.

### Why it is close

Every statement, both loops, the corner test, the five-parameter frame and the pool are the ROM's.

### Already ruled out

- Wave 52: binding the stack-passed 5th parameter to a local (tt = t;) is a real and necessary lever -- without it agbcc leaves t in memory, reloads it at each call site, and has a spare register to LICM-hoist &gUnknown_08499590 into sl, which the ROM does not do.
- Wave 52: binding hh = h (and ww = w) is byte-identical -- agbcc copy-propagates the binding straight back to the incoming r3, so hh never becomes a distinct allocno. Binding locals cannot move h.
- Wave 57: binding ny = y + 1; at the TOP of the outer body, which lengthens its live range and so should LOWER its global.c priority, does NOT move it -- ny still takes sl, h still stays in r3, and reload emits the same three caller-save insns. It is also strictly worse on placement. Live-range lengthening is not the axis.
- Wave 57: THE PERMUTER IS NOT AVAILABLE FOR THIS FUNCTION. mcp permute fails with Error executing tool permute: 'exit_code' (a KeyError in the wrapper, not a permuter result) AND strands raw header-expanded output in work/sub_0800401C/sub_0800401C.c, overwriting the draft. That is the wave-17 permute.py abnormal-exit bug, which the docs and the wave brief both record as FIXED. It is not fixed, or it has regressed. Copy work/<fn>/<fn>.c somewhere before running permute on anything.
- Wave 59 (W59-A): NOT RE-ATTEMPTED, and one correction. The wave-59 brief's headline fact for this function -- that asrs r0, r3, #1 is >> 1 and not / 2 -- was ALREADY APPLIED in the wave-52 draft, which spells both as h >> 1 and w >> 1. There was nothing to collect there.

### Notes

Next attempt should go after y + 1, not after h: find a spelling of the outer-loop increment whose pseudo has a LONGER live range (priority is roughly log2(n_refs) * frequency / live_length, so longer = lower = spilled), or that is not hoisted into the inner preheader at all. Note y + 1 has only 2 refs against h's 5, so it is h's LIVE LENGTH that is losing, and shortening that is the other direction.

### Wave 87

WAVE 87 (W87-D): 19.8%/176 (+4) -> 43.6%/180 (+8), first difference +0x13, draft REPLACED (wave-52/57 draft in w87-start.c) because the new one gets six of eight long-lived values into the ROM's registers where the old got three. W80-C `do { } while (0)` allocno-priority lever CONFIRMED and it COMPOSES: `do { sub_08003F44(x, y, tt); } while (0);` at BOTH call sites moves h from r3 to the ROM's sb; a wrapper around the whole inner `for` swaps x/rx into the ROM's r5/r4; both together = the new draft. Byte-neutral placements: around the `x = cx - (w >> 1); if (x < 0) x = 0;` block, around `y++`, around `tt = t`. Worse: `tt = t;` inside the outer body (tt takes r8, w demoted, ry spilled). The park's residual statement is out of date: h is fixed; the draft now spills tt where the ROM spills y+1 (global.c hands the three hi registers to w, h, y+1; the ROM to w, h, tt). Wave 57's `ny = y + 1;` re-measured on the new draft: 31.4% -- it does not lower y+1's priority, it RELOCATES THE HOIST from the inner-loop preheader (ROM position) to the outer one: an explicit local for a LICM-hoistable value pins it to the statement's position (rule kept). Next: raise tt above y+1 in allocno_compare without moving the hoist -- both have floor_log2(n_refs) == 1 (tt 3 refs, y+1 2), so the tie breaks elsewhere; a fourth reference to tt, or a shorter tt live range without moving `ldr r0,[sp,#40]`. The ROM loads tt into sl in the PROLOGUE, so live length alone is not the discriminator.
