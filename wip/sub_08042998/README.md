# sub_08042998

0x08042998, 472 bytes, THUMB, parked.

Best score so far: 14.2%, -28 bytes.

## Files

- `sub_08042998.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

444 of 472 bytes, 28 SHORT, 14.2% identical, first difference at +0x2 (wave 15, C; re-measured wave 79, W79-F). Straight-line, 2 `.LC` pool words (gUnknown_08091364 -> &gUnknown_030040D8, gUnknown_08091368 -> &gUnknown_085D5ABC) needing THREE different read-site spellings in one function (`**pp`, `w = *pp` then `*w`, `(*pp2)[i]`). Semantics complete: the bitfield model is struct Unk08499594's, derived from this function. WAVE 79 (W79-F) REFUTED THIS ENTRY'S OWN DIAGNOSIS OF ITS 4-BYTE ITEM. Counted directly: target.s names gUnknown_08091364 ONCE and gUnknown_08091368 ONCE, and the CANDIDATE DOES TOO. There is no double emission and no const-propagation to defeat, so `two uses is under the threshold` was never the mechanism. What differs is register pressure: the ROM parks &gUnknown_08091364 in r8 AND &gUnknown_08091368 in sb at the same time (`mov r8,r1` at the first **pp, `mov sb,r2` at the first (*pp2)[...]) and pushes TWO high registers; the draft holds pp2 in r8 and pp in r7 and pushes ONE. The +0x2 push-mask difference is the LAST symptom, not the cause. IMPROVEMENT KEPT (13.6% -> 14.2%, size unchanged): a `(anchor = &gUnknown_08499594, gUnknown_08499590)` comma on the first statement. The ROM's first body instruction is `ldr r4, =gUnknown_08499594`, ahead of gUnknown_08499590's; the anchor creates that pseudo first and the pool now orders 08499594, 08499590, 03003100, 0x417a, 0x051a exactly as the ROM does. 12 of the 28 short bytes are still the un-cross-jumped unk04_7 clamp: the two arms end with the same three instructions in SWAPPED registers (`ldr r1,=0xFFFFF87F; ands r1,r6; orrs r1,r0; strh r1,[r5,#4]` against `ldr r0,=0xFFFFF87F; ands r0,r6; orrs r0,r1; strh r0,[r5,#4]`), and the swap is forced by the cap arm's RELOAD `ldrb r0,[r0,#0xb]` rather than reusing the compare's value; agbcc CSEs that reload whether the field is read inline or through a local. THIS IS AN INSTRUCTION-COUNT RESIDUAL, NOT AN ALLOCATION ONE -- 14 instructions of work the ROM does and agbcc here does not. Do not spend a budget on allocation levers until the count is right. Ruled out: old_agbcc (identical size); moving `pp2 = &gUnknown_08091368;` down to just before the first clamp (9.1%, size unchanged). Draft in work/sub_08042998/sub_08042998.c.
