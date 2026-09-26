# sub_08022618

0x08022618, 400 bytes, THUMB, parked.

Best score so far: 31.0% (best.c).

## Files

- `sub_08022618.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

396 of 400 bytes, 4 SHORT, 11.8% identical, first difference at +0xa (wave 15, C; improved wave 79, W79-F). Straight-line, 2 `.LC` pool words (gUnknown_080909A8 -> &gUnknown_08499580, gUnknown_080909AC -> &gUnknown_085D5ABC), both spelled with A2's `pp = &<word>`; `pp` stays in sl as the ROM has it. Every statement, the || chain, the four 2x2 tile stores and the two Div clamps are identified. WAVE 79 (W79-F) RE-MEASURED AND IMPROVED IT FROM -8/10.0% TO -4/11.8%. Note the 31.0% this entry used to quote is best.c's, not the draft's. THE FIX: `id`'s zero-extension survives in the ROM because the pseudo is SET IN MORE THAN ONE BASIC BLOCK, not because of any cast spelling. Reusing one s16 for `id` and then for `flags` (legal -- id is dead after `rec = &gUnknown_08499594[id]`) recovers 4 of the 8 bytes. Eight spellings measured, all -8 except that one: u16 id single-set is -12 (everything folds, including an explicit (s16) at the use), s16 id single-set is -8, `int id` with (u16)/(s16) casts is -8, `int id = (u16)q[off]` is -8, `s16 id = (u16)q[off]` is -8, and MANUFACTURED second stores (`id = id;`, `id &= 0xff;`, `id = 0;` ahead of the real store) are all bit-identical to single-set because flow deletes them before combine. THE REMAINING 4 BYTES are the price of that fix: the merged pseudo now spans two blocks and spills `by` to a 4-byte stack slot (`sub sp,#4; str r0,[sp,#0]`) that the ROM does not have. The ROM holds x=r5, y=r4, ax=sl, by=sb, id/flags=r7, id<<16=r6, rec=r8. So the right answer is a second definition of `id` that does NOT lengthen its live range -- some variable already assigned in another block that I did not identify. POOL WORDS ARE NOT A RESIDUAL HERE, and this entry's old `four uses is enough` claim is in the wrong units: counted in target.s and the candidate .s, all four globals are named EXACTLY ONCE in BOTH, while the draft has three source-level *pp dereferences. Ruled out: old_agbcc (identical size); ax/by as dead entry parameters (identical output); 300 s of decomp-permuter; declaration order of the merged variable (both slots, identical 396/11.8%). Draft in work/sub_08022618/sub_08022618.c.
