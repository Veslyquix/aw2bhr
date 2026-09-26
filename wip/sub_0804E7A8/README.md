# sub_0804E7A8

0x0804E7A8, 328 bytes, THUMB, parked.

Best score so far: 94.2% (best.c).

## Files

- `sub_0804E7A8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft

## What has been tried

From `data/parked.json`.

### Best so far

91.2% -- 328 of 328, SIZE EXACT, 29 differing bytes, first at +0x10. A 94.2% / 19-byte draft also exists at work/sub_0804E7A8/wave79-94pct-s16locals.c; the 91.2% draft kept as the active one is STRICTLY BETTER UNDERSTOOD -- it has the documented s16-conversion residual SOLVED and only a two-register swap left. Score is positional: 91.2% is lower only because the swap starts at +0x10 instead of +0xf2.

### What still differs

ONE SWAP OF TWO CALLEE-SAVED REGISTERS and nothing else. The ROM puts the `&gUnknown_03001FBC` address pseudo in sl and `w = sub_0804BDD8(...)` in r9; the candidate puts the address in r9 and w in sl. Everything downstream (`mov r3,sl` vs `mov r3,r9`, `mov r0,r9` vs `mov r0,sl`, which register the two tail `ldrh` scratches land in, and the position of argument 1s setup relative to the two subtractions) follows from that one choice. The pool word still relocates against `gUnknown_085D6C88 + 0xc` where the ROM writes `gUnknown_085D6C94 + 0` -- SAME ADDRESS, NOT A DIFFERENCE, do not chase it.

### Why it is close

WAVE 79 (W79-A) SOLVED THE DOCUMENTED RESIDUAL. The old residual -- the ROM emitting `lsls rN,#16` beside each tail subtraction and deferring both `asrs` past the gUnknown_03001FBC load -- was NOT a spelling of the locals; the locals were the CAUSE. It is what agbcc does when the two computed arguments are passed INLINE to a callee prototyped with narrow parameters (`void sub_080155C0(s16, s16, s16)`), which is exactly how the matched sibling src/decomp/c_0804FCA4.c writes the identical call. expand_call computes each argument in its DECLARED HImode -- that is the `lsl` -- and load_register_parameters re-extends it into the promoted SImode argument register AFTER every argument has been evaluated -- that is the deferred `asr`. Routing the values through `s16 x, y;` locals keeps `lsl;asr` adjacent at the use and can never produce the ROM split. The instruction stream is now the ROMs.

### Already ruled out

- PRE-79 and now SUPERSEDED: s16 locals, u16 locals, int locals, short locals, `(s16)` casts at the call site, reversed assignment order, separate declarations, an `idx` local for the first argument, and do/while(0) around each assignment / both assignments / the call. All were measured against the OLD residual and all kept the values in LOCALS, which is what produced it.
- WAVE 79: `int x, y;` with an explicit `(s16)` cast on the ASSIGNMENT (x = (s16)(entry->x - *p1);) is BYTE-IDENTICAL to plain `s16 x, y;` -- the cast at the def folds into the use, so it does not reach the split either.
- WAVE 79, all measured against the inline-argument draft and all WORSE: `row = gUnknown_02028E5C[c];` as its own statement (89.6%); moving p1/p2 above sub_08056E9C, i.e. the matched siblings own statement order (+4 bytes, 22.6%); `int w` instead of `u16 w` (-4 bytes, 40.9%); moving p1/p2 down to just before `entry` (-8 bytes, 32.6%); moving `w = sub_0804BDD8(...)` down to just before its use (-4 bytes, 36.9%); p1[0]/p2[0] instead of *p1/*p2 (byte-identical, 91.2%).
- WAVE 79 REGISTER PINNING -- the lever that closed three of this batchs five functions -- DOES NOT REACH THIS ONE: register u16 w asm("r9") regresses to -4 bytes / 40.9% because w is a u16 whose narrowing can then no longer fold, and a pinned register u16 *pfbc asm("sl") bound to &gUnknown_03001FBC costs 4 bytes (89.9%). The address pseudo is created by CSE and has no local to pin, which is precisely the condition under which the lever fails.

### Settled

- THE CODEGEN RULE, now written into docs/agbcc-codegen.md: a narrow-prototyped callees computed argument passed INLINE splits its conversion in two -- lsl #16 where the value is computed, asr #16 after ALL arguments have been evaluated. Passing the same value through a narrow LOCAL keeps the pair adjacent at the use. That is a source construct, not an allocation accident, and it is decidable by reading where the asr sits.
- The type model is confirmed and untouched: the struct-array spelling of gUnknown_085D6C88, the byte-offset-sum spelling of `entry`, the `row` binding inside its own subscript, u16 w, and the s16 prototype of sub_080155C0.
- What is left is the wave-77 "nothing behind it" class: two long-lived pseudos tie and swap two callee-saved hard registers. Any remaining lever has to change the SET of simultaneously live values across sub_0804BDD8 -- not the spelling of any statement already in the draft.

### Why it is parked

Wave 79 (W79-A). Structural residual solved by adopting the matched sibling sub_0804FCA4s inline-argument spelling; what remains is a bare sl<->r9 swap of the gUnknown_03001FBC address pseudo against w. Next attempt should change register PRESSURE (one more or one fewer simultaneously live value across sub_0804BDD8), not the spelling of the call.

### Wave 87

WAVE 87 (W87-D): three measurements, all negative, draft unchanged (91.2%, 328/328, first difference +0x10). (a) W83 live-range-split lever: `u16 w2 = w;` immediately after the call, and again after the `if (t == 0x1C)` block (a conditional bl between def and copy) -- BOTH byte-identical to baseline, although `w` DIES at the copy, so W86-B's published bound ('acts only where the original pseudo dies at the copy') is NECESSARY, NOT SUFFICIENT. Read c_08040EF4.c lines 56-81: there BOTH halves of the split span a call (y's half spans `bl Div`, new_var's half spans Div and three more bl's) -- the additional condition. (b) Unnamed twin sub_080501DC (c_08050134.c): the region it would replace ALREADY matches the ROM byte for byte (the subscript FORCE_REGs the array base first, as the ROM does) -- transplant only into a region that DIFFERS; check the diff before transplanting. (c) Sharper reading of the residual: the largest hunk is NOT the sl/r9 swap but the tail's ARGUMENT EVALUATION ORDER (ROM: arg2 subs/lsls, arg3 subs/lsls, then `mov r3,sl` + ldrsh for arg1, asrs, asrs, bl; candidate evaluates arg1 first because its scratch is r3), with the scratch registers differing with it. Next named step: attack the argument ORDER -- find a spelling of argument 1 (gUnknown_03001FBC) that makes expand_call evaluate it LAST; the register swap may follow from that, and every wave since 79 assumed the reverse causality.
