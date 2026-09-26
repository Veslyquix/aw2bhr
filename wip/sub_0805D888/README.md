# sub_0805D888

0x0805D888, 508 bytes, THUMB, parked.

Best score so far: 52.2% (best.c).

## Files

- `sub_0805D888.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

52.2% identical, 508 against 508, size-exact (wave 77 W77-C draft with empty-asm barriers at the body call).

### What still differs

ROM frame 20 / draft 16. The ROM spills bestX to sp+4 and spends sl on the 0x1f mask hoisted into the INNER loop preheader (one pseudo; all three `ands` read it via `mov r0, sl`); the draft keeps bestX in sl and rematerialises `movs r0, #31` per site. The ROM's y-loop entry guard compares bestY's spill slot (`ldr r3, [sp, #8]; cmp r3, r0`) -- cse replacing y (known 0) with its 0-class representative.

### Already ruled out

- s16 x, y loop counters (W49); five cast spellings at the body call (W66); separate s16 copies (W62 +44; re-probed W80: s16 copies still emit the ashift/ashiftrt pair -- extendhisi2 expands as two shift insns, so loop.c still sees `(ashift biv 16)` and reduces it)
- explicit fixed mask/row-offset registers (W76, 544)
- shared update block `v = ...; if (v > best) goto update;` -- WRONG SHAPE: the three compares merge into one block the ROM does not have; the three inline compares are settled source (W80-E)
- inline found block / copies at the goto site / fx-fy at the label: all still CSE-merge the exit conversion with the body's (W80-E)
- old-agbcc and o1 profiles (W62)

### Why it is parked

One construct left to find: a spelling of the found: exit call whose (s16)x / (s16)y cannot be CSE-merged with the body call's conversions while still reading the raw loop counters (the ROM recomputes the shifts from r4/r6 at the exit). Everything else -- frame, guard operand, mask-vs-bestX allocation -- follows mechanically once the two givs are gone. The barrier draft stays the byte-closest candidate (52.2%, size-exact) but blocks the permuter.

### Park kind

ORDINARY NEAR-MISS -- size-exact, one register-pressure residual, mechanised block by block in wave 80 (W80-E).

### Wave 80 finding

THE BARRIER IS MASKING A CORRECT LAYOUT (W80-E, all by compile_probe). Deleting the asm barrier and calling sub_0804236C(x, y) directly reproduces every structural feature of the ROM at once -- frame slot order (bestX sp+4, bestY sp+8, flag sp+12, e sp+16), the bestY-slot guard compare, the update blocks -- EXCEPT that loop.c strength-reduces (x << 16) (into sl) and (y << 16) (spilled), adding two frame slots (28) and displacing the mask. The givs survive because the found: block's (s16) conversions are CSE-merged with the body call's; the `mov ip, sl` / `mov r9, rN` pair after the call in the barrier-free build is loop.c's not-replaceable copy for exactly that merged use, and the exit block then reads the copies. The ROM's found block instead recomputes `lsls rN, #16; asrs` from raw r4/r6, so the original source keeps the exit conversion OUT of cse's reach from the body. No spelling probed does that: int fx/fy at the label, fx/fy copies at the goto site, the found call written inline in the loop, and s16 sx/sy copies at the body call ALL still merge (four compile_probes, wave 80).

### Wave 86

WAVE 86 (W86-D, constant-twin axis): twin c_0805E440.c (three shared callees) supplies NO new construct -- it does the OPPOSITE of what this park needs: it calls sub_0804236C(x, y) and sub_0805D648(x, y, 10, 0, 0) from inside one loop with plain int counters and its header states the x<<16 in r8 IS strength_reduce's giv for the s16 conversion, i.e. it wants the CSE-merged givs this function must avoid. No probe spent. Configured, 508/508, 52.2%, unchanged.
