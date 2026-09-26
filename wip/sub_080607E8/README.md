# sub_080607E8

0x080607E8, 172 bytes, THUMB, parked.

Best score so far: 54.6%, -8 bytes.

## Files

- `sub_080607E8.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

164 bytes (-8), 54.7% identical (was 32.0% before wave 77). THE HOIST IS FIXED; the residual is now THREE INSTRUCTIONS.

### What still differs

WAVE 77 (W77-J) CLOSED DEFECT (1). A PURE GOTO LOOP -- `i = 0; _loop: {body} i++; if (i <= 2) goto _loop;` with NO for/while/do construct -- is invisible to loop.c, so LICM never runs on it, and the candidate now emits the ROM's in-loop synthesis `mov r3,rBAND / lsl r0,r3,#1 / add r0,rBAND / add r0,r0,r7 / add r1,r1,r0` AND the ROM's high-register mask shuffle, exactly. Defect (2) went with it: `unk09 = 0` is still cse'd onto the known-zero c, so that knock-on was NOT caused by the hoist and the old entry's explanation of it is refuted. THE REMAINING -8 BYTES ARE THREE INSTRUCTIONS, all in the sub_08025CC8 call block: (a) the ROM sign-extends the SECOND argument, `mov r2,r8 / lsls r1,r2,#0x10 / asrs r1,r1,#0x10`, where the candidate emits a bare `mov r1,rB` -- combine proves the narrowing redundant because b = (u8 load) + 4 has >= 17 sign-bit copies, and the ROM's compiler did not; (b) the ROM materialises `movs r0,#0` for `u->unk09 = 0` where the candidate reuses r6, the register holding c, which the `c == 0` guard proved zero. Everything else is byte-exact. Band and b hold swapped high registers (candidate band=r8/b=r9, ROM band=sb/b=r8), which follows from the missing instructions rather than being independent.

### Why it is close

The shape is fully derived and exactly ONE compiler decision is wrong. The lever is known and half-demonstrated: casting the table to a 3-byte-row STRUCT (`((struct Row3 *)base)[band].v[i]`) stops the hoist dead and reproduces the ROM's sb allocation AND its mask shuffle exactly, first try -- but agbcc pads `struct { u8 v[3]; }` to 4, so the stride comes out `lsls #2` and the association becomes `(base + band * 4) + i` instead of the ROM's `base + (band * 3 + i)`. What that measures is the underlying rule: agbcc's LICM hoists a TWO-instruction invariant (the *3 synthesis, lsl + add) but leaves a ONE-instruction one (the *4 shift) in the loop. So the job is a spelling that keeps a 3-byte stride while making the multiply part of an addressing tree rather than a standalone MULT_EXPR in the index -- or a way to get agbcc to emit the *3 as one instruction.

### Already ruled out

- SEVEN index spellings, all reassociating to the identical tree and ALL hoisting: `[band * 3 + i]`, `[i + band * 3]`, `[band * 2 + band + i]`, `[(band << 1) + band + i]`, `*(base + band * 3 + i)`, `((u8 (*)[3])base)[band][i]`, and `((struct T *)base)->rows[band][i]` (the struct-wrapped-array lever from the .rodata chapter). The struct wrapper only flipped the operand order of one `add`.
- u8 / int for band (u8 band also breaks the `ldrh` of gUnknown_03004080 down to a `ldrb`), for c, and for d -- d must stay u8, because the third sub_08025CC8 argument is a bare `adds r2, r5, #0` with no sign extension, which an int would need.
- the `continue` form against the nested-if form; `0x1f & g` against `g & 0x1f`; merging the two guards into one `&&`.
- Register pressure as the cause: the ROM and every candidate use exactly seven callee-saved registers and the identical push list, so the hoist is not agbcc running out of registers.
- WAVE 77 (W77-J): A PACKED 3-BYTE ROW STRUCT DOES give the 3-byte stride the entry asked for -- `struct Row3 { u8 v[3]; } __attribute__((packed));` is size 3, so `((struct Row3 *)base)[band].v[i]` emits `lsl #1 / add` and not `lsl #2` -- AND IT STILL HOISTS (164 B, 34.3%). That settles the mechanism the old entry only half-measured: the unpadded struct did not stop the hoist because it was a struct, it stopped it because the padded *4 stride collapsed to ONE insn. Any two-insn invariant is a scan_loop movable and gets hoisted, whatever the source spelling. The seven index spellings and the struct wrapper were never going to work; only taking the loop away from loop.c does.
- WAVE 77 (W77-J): on the surviving second-argument narrowing -- `u16 b` in place of `int b` is BYTE-IDENTICAL here (164 B, 54.7%, not one byte moved), so agbcc's local promotion does not make a u16-to-s16 conversion visible the way it does for a parameter. Splitting the definition into two sets (`b = p->unk01; b += 4;`) DOES cost 4 bytes back (168 B, -4) but pays for them elsewhere: b drops out of the high registers into r7 and the loop counter's allocation changes with it, net 30.2%. The narrowing and the register split are one fact, not two.

### Notes

The gUnknown_08499590 access is settled and must not be re-litigated: the file-local `struct Map7E8` cast reproduces the ROM's `adds r0,r1,r3(=0x417A); adds r0,r0,r2` and `adds r1,#0x12; adds r1,r1,r0` associations exactly, per the wave-34 rule in include/unknown-globals.h. Byte arithmetic on the u8 * does not. WAVE 77: the goto-loop form is now load-bearing and must not be tidied back into a `for`. W73-D's test for the goto lever -- does the body need a giv? -- is NEGATIVE here: the ROM rematerialises every address from band and i each iteration and carries no strength-reduced giv at all, which is why the lever that is mutually exclusive with a giv on sub_0806412C is free on this function.
