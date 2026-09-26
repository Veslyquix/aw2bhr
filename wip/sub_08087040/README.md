# sub_08087040

0x08087040, 120 bytes, THUMB, parked.

Best score so far: 55.8% (preprocessed form, not included).

## What it does

Draws four pairs of sprites in a row with PutSprite: for i from 0 to 3, one sprite at y 0 and one at y 16, at x = 0x97 + 24 * i, using the sprite data gUnknown_0848B690 and gUnknown_0848B6A8 with tile numbers stepping by 8.

## How close it is

Compiles 4 bytes short (116 against 120), 23% of bytes match; the score means little because the difference starts in the opening lines and shifts everything after it. The original keeps one of the three stepping coordinates on the stack and loads the sprite-data pointer last before each call; the draft keeps everything in registers.

## What is left

First, name the sprite data directly: 0x081D9440 and 0x081D9444 are this function's own compiler-made address words (they hold the addresses of the already-declared sprite blobs gUnknown_0848B690 and gUnknown_0848B6A8), so pass those arrays to PutSprite and drop the two pointer locals, as fixed several drafts of the same kind. If a gap remains, look for the extra live value that makes the original keep one coordinate on the stack.

## Already tried

- Naming gUnknown_081D9440/44 directly as pointer variables: an extra data word and a double load per use, and the loop counter no longer counts down.
- Accumulators instead of coordinates computed from the counter, or one x value with x + 4: fewer live values, moves the wrong way.
- volatile on the pointer objects or on the loads: no fix.
- Binding the sprite word to a local before each call: reorders the whole body.
- A descending counter in the source: its set-up lands first, where the original's comes last.
- Swapping the declaration order of the two pointer locals: no change.
- Automatic permuter, 900 seconds over two runs: no match; the 55.8% best.c it left reads locals before assigning them and is not a real candidate.

## Files

- `sub_08087040.c`: the current draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Best so far

116 bytes (-4), 23.3% identical, first difference at +0xa. NOTE work/sub_08087040/best.c holds a permuter artefact scored 55.8% at size 120 which is NOT a real candidate -- it reads two locals before either is assigned and reaches 120 bytes through undefined behaviour. 23.3% is the honest state. Wave 46 W46-J re-ran the draft to confirm this; do not quote 55.8% as this function's score and reset best.c before any further permuter run.

### What still differs

ONE coupled fact worth 4 bytes. The ROM spends `sub sp, #8` and keeps the 0x54 x-giv SPILLED at [sp, #4] (`movs r0,#84; str r0,[sp,#4]` in the preheader, `ldr r0,[sp,#4]` at each use, `ldr r0,[sp,#4]; adds r0,#8; str r0,[sp,#4]` at the bottom). That leaves r7 free as a low scratch, so the ROM emits `mov r7, sl; ldr r3, [r7]` LAST in each call's argument setup, after r0/r1/r2. The candidate fits all seven live values in registers (`sub sp, #4`, 0x54 in r7, `adds r7, #8`), needs no callee-saved low scratch, and gcc therefore schedules the `ldr r3` to the FRONT of each iteration where r0-r3 are free. Spill and load position are one decision, not two. Also cosmetic and downstream of it: the 0x2000 is built in r7 in the ROM and r0 here.

### Why it is close

Every structural choice is forced by controlled probe and the instruction stream is otherwise complete: the preheader is in the ROM's exact order (p, q, 0x2000, 0x54, 0x50, 0x97, counter), all three coordinates are strength-reduction givs, the reversed counter and its `subs/cmp/bge` are exact, both call bodies and both pool words are exact. The mechanism is understood: FOUR of the seven live values demand LOW registers (the counter and all three givs are updated with `adds rN,#imm8` / `subs rN,#1`) and there are exactly four low callee-saved registers, so a FIFTH low demand -- the reload scratch for the high-register reads -- is what tips the ROM into spilling one giv. What is missing is an EIGHTH live value; nothing in the ROM's instruction stream accounts for one, so it is probably a source local this reading folds away.

### Already ruled out

Waves 44, 46 (W46-C) and 46 (W46-J): accumulators instead of givs; `x` / `x + 4` instead of two x givs (fewer live values, moves the wrong way); volatile on the pointer objects and on the deref; binding the OAM word to a local before each call (reorders the whole body); naming gUnknown_081D9440/44 directly rather than binding their addresses to `u16 **` locals (agbcc routes the symbol through force_const_mem and emits a .rodata word plus a DOUBLE indirection per use, where the ROM has a single `ldr r3, [r7]` off a plain `.4byte` TEXT pool word); a source-level descending loop (a source init would sit FIRST in the preheader, ahead of the LICM-hoisted 0x2000, and the ROM has no for-init in the preheader at all); and swapping the declaration order of the two pointer locals. DECOMP-PERMUTER WAS RUN AND FAILED: 900 seconds over two runs, 4 threads. That is a fair test of the brief's "the permuter is not useless on register allocation" rule and it came out NEGATIVE here even though the residual looks exactly like the advertised case (slot-wrong, stream otherwise right).

### Settled

W46-J's only contribution is verification: the draft was re-run from scratch and scores 23.3% at 116 bytes, confirming W46-C's analysis and establishing that the 55.8% carried in best.json and quoted in the wave-46 brief is a permuter artefact. No new lever was found. The next reader should attack the missing eighth live value directly and should not re-run the permuter without resetting best.c first.

### Why it is parked

Two independent agents (W46-C, W46-J) reached the same 4-byte spill residual with the same source shape; the permuter has been run and failed.

</details>
