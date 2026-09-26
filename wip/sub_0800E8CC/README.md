# sub_0800E8CC

0x0800E8CC, 296 bytes, THUMB, parked.

Best score so far: 92.2% (best.c).

## Files

- `sub_0800E8CC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

92.23% identical, exact 296/296 bytes, 23 differing bytes, first difference at +0x4e (wave 73, W73-E). Was 83.11%. The active draft work/sub_0800E8CC/sub_0800E8CC.c IS the permuter result and must not be tidied; its header lists every kept mutation.

### What still differs

Instruction order and size are settled. The residual is one coupled allocation cycle: candidate r0/r2 and r9 correspond to the ROM's opposite r0/r2 choice and sb. Moving any one pseudo changes the others; no semantic or control-flow block is missing.

### Why it is close

All calls, branches, map accesses, pool words and argument copies are present in the ROM's order. The configured candidate is size-exact and the disagreement is confined to register fields.

### Already ruled out

- Declaration order, commuted row addressing, a split load temporary, pointer advance, separate row/off scheduling and the first struct view -- all retained or worsened the same r0/r2/r9-to-sb cycle.
- Aggregate-member and wrapper-bound row pointers -- byte-identical to the readable 83.11% draft.
- Direct aggregate indexing -- adds map-base copies and regresses both size and shape.
- Wave 73 (W73-E): THE WAVE-65 INSTRUCTION `do not repeat it from this same allocation state` IS REFUTED, and this is the single largest gain in the batch. Two chained decomp-permuter runs, each started from the previous best.c per the wave-59 method, went 83.11% -> 91.22% -> 92.23%, all size-exact. The wave-65 run was ONE run; a permuter run is a property of the STARTING POINT, not of the function. The kept mutations are all semantically inert: a DEAD `(cells = rows)` assignment inside the second block's index expression, `new_var2 = t * 2` bound out of that same expression, and `new_var = sub_0800119C(x, t, 4); r |= new_var << 1;` splitting the call result off the shift in the y+1 block. Unlike its sibling sub_0800E9F4's mutated best.c, this one is semantically CLEAN and has been installed as the draft. Chained run 3 from the 92.23% best.c was FLAT (`no candidate scored better than the starting point`, 8,391 iterations), so this function is now genuinely sampled out on this axis at three runs -- which is what an honest `permuter exhausted` note looks like, as against the wave-65 one that was written after a single run.
- No compiler override is configured or evidenced for this function; the residual occurs under the canonical configured profile.
- Wave 77 (W77-L): configured re-verdict unchanged at 296/296, 23 differing bytes, first difference at +0x4e -- the recorded residual still holds exactly. Binding the 0x417A displacement to ONE shared `int k = 0x417A;` local used by all five blocks, to give the constant a single 5-reference pseudo that could win the ROM's sb, is CATASTROPHIC: 261 of 296 differ (11.8%), size-exact. gcc const-propagates the local and the loss is elsewhere. The ROM's sb holding 0x417A is an allocator outcome, not a source-visible binding.

### Settled

- The four call-argument copies are source-visible and come from explicit per-block `off` locals.
- The remaining cycle is allocation, not a hidden map-layout or source-CFG question.
- Wave 73 (W73-E): the residual after two permuter runs is still a register-allocation cycle -- the ROM uses sb for the 0x417A constant and keeps t*2 in r2 with the row address/index in r0 in the first two blocks, where the draft has them swapped. 23 bytes, first difference at +0x4e. Chained run 3 is the obvious next move and it costs nothing.

### Why it is parked

Two focused waves and a permuter run leave a size-exact, instruction-order-correct candidate with one coupled register-allocation cycle. Resume only with a new allocator-priority mechanism, not another spelling sweep.

### Park kind

EXACT-SIZE REGISTER-ALLOCATION NEAR-MISS
