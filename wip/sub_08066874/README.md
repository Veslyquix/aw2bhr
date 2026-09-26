# sub_08066874

0x08066874, 428 bytes, THUMB, parked.

Best score so far: 93.9% (best.c).

## Files

- `sub_08066874.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

93.9% identical, SIZE-EXACT 428/428, 26 bytes, first difference +0x7 (configured). Waves 77 (W77-C, permuter win 81.8 -> 93.9) and 86 (W86-B). Status was `asm` (never parked) until wave 86.

### What still differs

One allocation fact with three symptoms: in the cross-jumped seven-statement arm the ROM re-derives gUnknown_08580934 from the -fforce-addr pool word's ADDRESS in r8 (`mov r1,r8; ldr r0,[r1]; ldr r0,[r0]`, 6 B) while the draft keeps the word's CONTENT in callee-saved r5 across `bl sub_0806377C` (`ldr r0,[r5]`, 2 B), then pays `adds r7,r1,#0` and `lsls r0,r6,#24`. The three cancel, so the size is exact.

### Why it is close

Twin sub_08066A20 (src/decomp/c_08066A20.c, the other arm of sub_08066B40's dispatch) is matched. The `if ((new_var = cnt) != 0)` NARROW binding is a permuter win and load-bearing (int folds it away, back to 81.8%).

### Already ruled out

- W77-C: dropping `state` and naming gUnknown_08580934 in the last loop (424/428, 44.2%); assigning `state` inside the cnt==0 arm (44.9%) or just before the last loop (80.6%); a second narrow binding on the unk31==1 / unk08==2 tests (byte-identical). Permuter: three runs, ~30,000 iterations after the win, ceiling unmoved at score 465.
- W86-B: (1) the cross-jump arm-count lever (W80-C) does not apply -- the ROM's tail at _08066904 is entered from exactly TWO arms (a `b` from the unk31 test plus fall-through from cmp r5,#0/beq) and the draft already writes it twice; (2) declaration order of the locals is byte-neutral in every figure; (3) the honest ROM-shaped source (state dropped, plain int test) is worse and localises the coupling. The W83 live-range-split lever does not apply (the copy source stays live).
- W81-E: all seven profiles measured, no flip.

### Why it is parked

What the ROM actually does (W86-B): r8 = &gUnknown_0816E150 (the pool word's own address) for the whole function; [r8] = &gUnknown_08580934 is re-derived PER BLOCK and never carried across a call -- r3/r7 in loop 1, r2 (call-clobbered) at the dispatch, r6 in loop 2, r5 after bl sub_0806666C. The goal is not 'make r5 dead across the call' but 'stop [r8] being callee-saved at the DISPATCH block'. Never measured, and where to start: `struct Unk08580934 **state = &gUnknown_08580934;` with `(*state)->unk70[i]` -- the ROM's state analogue is the address-of-the-pointer (r6 is a copy of the dispatch's r2 and does `ldr r1,[r6]` afresh each iteration). Full record: work/sub_08066874/sub_08066874.c header and W86-notes.md.

### Wave 87

WAVE 87 (W87-D): the `struct Unk08580934 **state = &gUnknown_08580934;` / `(*state)->` spelling (the draft header's one untried shape) is REFUTED -- 440/428 (+12), strictly worse (one compile_probe + one try_match, draft restored). It DID move `cnt` to the ROM's r5 (the +0x7 first difference was a real consequence of the indirection level) but costs an extra `ldr r0,[r7]` at the last loop, because the ROM's last-loop base is a CSE OF THE BOUND'S OWN LOAD (`ldr r0,[r5] / ldrb r2,[r0,#8] / ... / adds r1,r0,#0`, no reload) -- a `**` local can never produce that. Re-read of the state: the honest source (state dropped, plain `cnt != 0`, wave 77's 424 B / 44.2%) is the RIGHT SHAPE 4 bytes short in exactly one place; the 93.9% figure is a +2/+2/-4 cancellation and is actively misleading. The single remaining question, stated correctly: starting from the honest source, make the cross-jumped arm at _08066904 re-derive gUnknown_08580934 from r8 in TWO loads after `bl sub_0806377C` -- the ROM's dispatch block puts address-of-pointer and pointer in CALL-CLOBBERED r2/r1 and lets them die at the call, the draft gives that value a callee-saved register because one cse pseudo spans the call. Next: from the 424 B source, give the two written-out arm copies definitions that DISAGREE BY VALUE (W81-C, ~line 49379) so no single pseudo is live across the call. Do NOT measure from the 93.9% draft. Remove `**state` from the open list. Configured, 428/428, 93.9%, unchanged.
