# sub_08009310

0x08009310, 476 bytes, THUMB, parked.

Best score so far: 93.9% (best.c).

## Files

- `sub_08009310.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

WAVE 79 (W79-E): SIZE-EXACT at 476 bytes and THE ENTIRE INSTRUCTION STREAM IS NOW THE ROM'S -- every instruction, in the ROM's order, with the ROM's operands, including the ROM's `_080093BE: b <return 0>` trampoline. 36 of 476 bytes differ (92.4%). The printed score is LOWER than wave 37's 93.9% and the draft is BETTER: the score is positional and this draft diverges earlier (+0x20, a scratch register in the prologue) while wave 37's draft was missing an instruction. Read the diff, not the percentage.

### What still differs

REGISTER NUMBERS ONLY, plus the order of the two tail blocks. (1) the default arm's value is r1 where the ROM has r6; as a knock-on `n` takes r7 and the gUnknown_08499590 force-addr pseudo takes r6, where the ROM has them the other way round. (2) the two shared exit blocks are emitted in the opposite order -- candidate `bgt -> return 1` with `return 0` falling through, ROM `ble -> return 0` with `return 1` falling through -- which is also what swaps 0x1c8/0x1d4 through both jump tables and every `b`/`beq` in the body.

### Why it is close

WAVE 37'S KNOT IS HALF SOLVED. Wave 37 recorded 'wanting the copy and wanting the merge blocked are the same knob pulled in opposite directions'. They are not. Writing the default arm's result into the FUNCTION-SCOPE `d` -- the local the two `sub_08008D14` arms already use, so it is referenced from three basic blocks and is a GLOBAL allocno -- gives BOTH the ROM's `adds rN, r0, #0` copy AND the blocked cross-jump (the tail tests `n`, the arm tests `d`, so rtx_equal_p fails). That third spelling reproduces the ROM's instruction stream exactly. What is left is that a pseudo only reaches a CALLEE-SAVED register in global_alloc if it is LIVE ACROSS A CALL; `n` is (set at _080093CE, read at _080094D4, across two `bl`s) and `d` never is, in any of its three blocks, so global_alloc hands `d` the call-clobbered r1. THE TENSION IS NOW PRECISELY STATED: to BLOCK THE MERGE the arm's pseudo must differ from the tail's; to WIN r6 the arm's pseudo must be live across a call; and `n` is the only local in this function that is live across a call.

### Already ruled out

- WAVE 79 (W79-E): arm writes the function-scope `n`. Registers come out EXACTLY right (r6 for the arm and for n, r7 for the pool pseudo, matching the ROM everywhere) and cross-jumping folds the arm's cmp/ble/b/b into a single `b`, 4 bytes short. Confirms wave 37 against the current draft.
- WAVE 79 (W79-E): arm writes `n` then `break;`, with a `return 0;` placed after the switch, to give the arm's `ble` a DIFFERENT label -- the hypothesis being that the ROM's _080093BE trampoline is a separate source-level `return 0` at the end of the `if (terrain == 7 || ...)` block. Jump-threaded away; output byte-identical to the plain `n` spelling. THE TRAMPOLINE IS NOT A SEPARATE SOURCE `return 0`.
- WAVE 79 (W79-E): THE TAIL BLOCK ORDER IS AN INDEPENDENT THIRD FACT, not a consequence of the arm's spelling. All three arm spellings (k, d, n) emit the tail as `bgt -> return 1`. Source polarity does not reach it: the draft's tail already IS `if (n > 0) return 1; return 0;`, whose natural expansion is the ROM's layout, and gcc inverts it anyway. Do not spend another probe on the W56-L polarity lever here.
- WAVE 37: a block-local `int k` in the arm -- local allocno, gets r0, loses the copy.
- WAVE 37: tail written as `if (n <= 0) return 0; return 1;` -- worse, gcc then places the `return 1` block inline at 0x9c.
- WAVE 37: `n = 0x16; break;` in the 2/4/6 arm -- the store is jump-threaded away entirely.
- W83-D: SEVEN-PROFILE SWEEP completed (all six temporary profiles run on the wave-79 draft): configured == default == 36 of 476 (92.4%), first diff +0x20 -- the wave-79 measurement is current. old_agbcc 42 of 476 (91.2%); no-force/o1/o1-no-force/old-agbcc-no-force all emit 480 vs 476. No toolchain lever; the toolchain axis is now genuinely ruled out at all seven configurations.

### Settled

- WAVE 79: THE GENERAL RULE, recorded in docs/agbcc-codegen.md -- a DIFFERENT multi-basic-block local is the lever that gives you the copy AND blocks the cross-jump, but it buys a call-clobbered register unless that local is also live across a call. Cross-jump blocking and callee-saved allocation are two INDEPENDENT properties of the same pseudo and a spelling must satisfy both.
- LOAD-BEARING, do not undo: `d = sub_08008D14(x,y); if (d & 6)` must be a bound local; the 2/4/6 membership test must be ONE `||` with a single `n = 0x16` store (the comma operators exist only because locals cannot be assigned inside a `||` operand); the 0/8/9 arm has NO store at all, all three of its success paths are `return 1`.
- Needs "rodata": ["0x0808D814"] on promotion; that word is agbcc's -fforce-addr copy of &gUnknown_08499590, not a global.

### Why it is parked

Wave 79 W79-E. Instruction stream exact; residual is one allocno's hard register and the tail block order. Resume only with a lever that makes a non-`n` local live across a call at zero instruction cost, or that raises a global allocno's priority without a call crossing.
