# Notes for `src/design.c`

Source: [`src/design.c`](../../src/design.c). These comments were moved verbatim from the C file; line numbers refer to the version before extraction.

## Note 1 — original line 385

````c
/* The `ldrsh` fixes gUnknown_0200B224[].unk00 as a signed halfword; the `lsls
 * #2` on gActiveMap->selectionIndex fixes the element stride at 4.
 */
````

## Note 2 — original line 390

````c
/* A linear search over the byte pairs at gUnknown_084859E0: key, value, with
 * 0xFF terminating the table and 0xE returned when the key is absent.
 *
 * The `result` local is what puts the 0xE ahead of the loop -- both exits
 * arrive at one `bx lr` with the value already in r0, so this cannot be spelled
 * as two returns. The table pointer is initialised FIRST: source order is what
 * puts the pool `ldr` ahead of the `movs`, and swapping the two statements
 * swaps the two instructions (measured, wave 42).
 *
 * The key test comes first and the terminator test is the loop's exit
 * condition, so the shape is `for (;;)` with both breaks. A `while (p[0] !=
 * key)` header emits the 0xFF compare first and costs an extra `adds r0, r3,
 * #0` on the not-found path. */
````

## Note 3 — original line 421

````c
/* Look up an id in gUnknown_0200B224 and return its index, or -1.
 *
 * gActiveMap->editMode selects both the mask and the entry count: 0x1F over
 * 17 entries, or 0x3F over 20. The two arms are structurally identical but the
 * ROM carries both bodies -- they share only the `return i` block and the -1
 * tail, which agbcc cross-jumps on its own.
 *
 * unk07 is the plain `s8` member: the `ldrb; lsls #0x18; asrs #0x18` here is
 * what agbcc emits for it when the base pointer is already in a register, and
 * is not evidence of a cast (src/decomp/c_08002EC8.c reads the same member and
 * gets the reg+reg `ldrsb` form instead).
 *
 * The `ldrh` on the s16 unk00 is the mask narrowing the load: only the low 5 or
 * 6 bits survive, so agbcc drops the sign extension. */
````

## Note 4 — original line 459

````c
/* Wave 37 (W37-E). Matched. PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D70C"]
 * 0x0808D70C holds &gActiveMap -- an -fforce-addr address constant. Note
 * the function reaches the SAME global both ways: through that forced address
 * at the top and through a plain `ldr =gActiveMap` pool word from the
 * second switch onwards. One source spelling, two codegen forms.
 *
 * Three things cost attempts here, all worth reusing:
 *
 * 1. `idx` MUST be a local. gActiveMap->cursorMoveScale is ordinary memory, so cse
 *    drops it at every `bl`; the four Div arguments each recomputed
 *    `(0x100 - unk68) >> 4` from scratch, +60 bytes. gSinLut is `const`, so its
 *    reads ARE preserved across the calls and need no local -- the cos<<4 CSE
 *    that lands in sl falls out on its own.
 * 2. The `& 0xFF` belongs INSIDE the gSinLut subscript, not in idx's own
 *    statement. As its own statement it emits `movs #255; ands` before the
 *    `ldr =gSinLut`; the ROM has the pool load first. Same size, wrong bytes.
 * 3. `switch` case bodies come out in SOURCE label order. The shared
 *    `case 0: case 0x1E:` arm sits THIRD in the ROM, after 0xA and 0x14 --
 *    putting it first (the natural reading order) was +4 bytes of extra
 *    branches.
 *
 * m1..m4 are four separate locals on purpose: one `u16 m` reused at the four
 * sites has a live range spanning the whole tail, and agbcc spills it -- +4
 * bytes of frame and one more callee-saved register, which pushes sx/sy off
 * r6/r5. Where the value is only TESTED in one arm of a nested if, pass a
 * literal 0 rather than the variable (the m2 site): passing the variable adds
 * an `adds r4, r0, #0` copy, while `0` lets cse pick the register the compare
 * just proved zero -- which is r7 (b) on one side and r4 (m) on the other,
 * exactly as the ROM has it. */
````

## Note 5 — original line 660

````c
/* Wave 57 (W57-A). sub_08002510's state machine (src/decomp/c_08002510.c) on a
 * DIFFERENT lane of the same record: unk64/unk60 here are unk5a/unk5c there,
 * with the same 0 -> 0xA -> 0x14 -> 0x1E -> 0x32 -> 0x3C -> 0x46 -> 0x50 ladder
 * split across two switches and the same `v += (K - v) >> 3` easing.  Reading
 * that exemplar before this assembly is what made it a two-probe match.
 * PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D710"]
 * 0x0808D710 holds &gActiveMap (dereferenced in baserom.gba), its own
 * -fforce-addr copy beside sub_08002510's 0x0808D714, so the honest
 * `gActiveMap` spelling is what produces the ROM's
 * `ldr rN,=<pool>; ldr rM,[rN]; ldr rP,[rM]` triple.
 *
 * a1 is declared and never read, exactly as in sub_08002510.
 *
 * `a2 &= 0xFF` IS LOAD-BEARING and is not the same code as `v = a2 & 0xFF`.
 * The ROM passes the masked value to sub_0802BD54's u16 parameter as
 * `lsls #0x10; lsrs #0x10`, and that truncation is redundant on a value known
 * to fit in 8 bits -- combine deletes it via nonzero_bits, which is only
 * tracked for a pseudo with ONE set.  Masking the parameter in place gives it
 * two sets (the incoming copy and the AND), nonzero_bits goes unknown, and the
 * pair survives.  A separate `int v = a2 & 0xFF;` is a single-set pseudo and
 * folds the pair away -- measured both ways with compile_probe, and it is the
 * only difference between a 632-byte match and a 628-byte miss.  sub_08002510
 * never discriminated this because it passes its `v` only to DrawOamObject's
 * int parameter.
 *
 * 0xFD80 is unsigned because the ROM's pool word is `.4byte 0x0000FD80`, while
 * -800 / -640 are full negative ints (`0xFFFFFCE0` / `0xFFFFFD80`).
 * unk12 stays u8 with an (s8) cast at each use, per its header comment. */
````

## Note 6 — original line 777

````c
/* Wave 37 (W37-E). Matched first attempt. PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D714"]
 * 0x0808D714 holds &gActiveMap (dereferenced in baserom.gba), so this is
 * an -fforce-addr address constant and the honest `gActiveMap` spelling
 * is what produces the ROM's `ldr rN,=<pool>; ldr rM,[rN]; ldr rP,[rM]` triple.
 * Do not invent a `gUnknown_0808D714` global for it.
 *
 * This is sub_080030BC's state machine (src/decomp/c_080030BC.c) run on a
 * SINGLE lane: unk5a / unk5c here are unk72[i] / unk82[i] there, with the same
 * 0 -> 0xA -> 0x14 -> 0x1E -> 0x32 -> 0x3C -> 0x46 -> 0x50 ladder split across
 * two switches and the same `v += (K - v) >> 3` easing. Reading that exemplar
 * before this assembly is what made it a one-attempt match.
 *
 * a1 is declared and never read -- exactly like sub_080030BC's a2/a3.
 * 0xFD80 is unsigned because the ROM's pool word is `.4byte 0x0000FD80`, while
 * -928 / -480 are full negative ints (`0xFFFFFC60` / `0xFFFFFE20`). */
````

## Note 7 — original line 863

````c
/* Loads one of eleven OBJ graphics sets into OBJ VRAM and then hands the
 * resulting sprite to sub_0801BD00.
 *
 * a4 is a kind code. Its low five bits select the loader family; the value 8
 * there means "one of the five sized variants", which the switch turns into
 * sub_0803F6BC's second argument, and anything else is passed through with
 * variant 1 and shifts the sprite down eight pixels. */
````

## Note 8 — original line 915

````c
/* The sibling of sub_0800272C one table along: loads a unit's OBJ graphics and
 * palette and hands the sprite to sub_0801BD00. a4's low six bits are the unit
 * kind; 0x19 takes a wholly different loader and a different sprite mode.
 *
 * `pal` must be a single-assignment local, NOT a folded 0x6000 in the ternary.
 * agbcc synthesises the constant 0x6000 as `mov #0xC0; lsl #7` (its split takes
 * the SMALLEST shift), but the ROM has `mov r0,#6; lsl r3,r0,#0xc` -- a real
 * ashift whose input is rematerialised into a scratch. That is what a
 * single-def constant local gets: its def is in another basic block so combine
 * never folds the shift, local-alloc gives it reg_equiv_constant instead of a
 * hard register, and reload reloads the 6 into r0 at the use. */
````

## Note 9 — original line 983

````c
/* Draws one CO-power / terrain-window sprite, loading its graphic into OBJ
 * VRAM first when a6 says to.  a1 selects the army: 0 uses the fixed VRAM slot
 * at 0x06014BC0, anything else the per-army slot eight tiles further along.
 *
 * FOUND BY THE PERMUTER (wave 61) after this function had been parked since
 * wave 52 as "compiler output we cannot spell".  TWO THINGS BELOW ARE
 * LOAD-BEARING AND MUST NOT BE TIDIED AWAY -- both were re-checked with
 * trymatch after each edit:
 *
 *   1. `idxBase` HOLDS 0x28C IN A VARIABLE, assigned before the `if (a6)`.
 *      That is the fold barrier.  Written as a literal, agbcc collapses
 *      ((a1 - 1) * 8 + 0x28C) * 32 + 0x06010000 to `lsls r6,#8` plus a
 *      0x06015080 pool word; held in a variable it emits the ROM's own
 *      unfolded `movs #0xa3; lsls #2; adds; lsls #5; ldr =0x06010000; adds`.
 *      Waves 52, 57 and 59 ruled out statement splits, block boundaries,
 *      reference counts and all six compiler profiles looking for this; a
 *      variable-held constant is what it turned out to be.
 *
 *   2. `t = (a1 - 1) * 8;` LOOKS DEAD AND IS NOT.  Nothing reads t afterwards,
 *      but deleting the store loses the match, and so does reusing t as the
 *      index in place of recomputing (a1 - 1) * 8 in the expression (196
 *      bytes).  The store is doing register-allocation work, so the source
 *      really does compute that product twice.
 *
 * t is read for gUnknown_08489190[t] in both arms BEFORE it is overwritten,
 * so the reuse is legitimate and the source argument is the diamond's.
 */
````

## Note 10 — original line 1160

````c
/* A 0x460-byte VRAM push and one call. 0x460 is `movs #0x8c; lsls #3`, agbcc's
 * way of building an even constant above 255 without a pool word. */
````

## Note 11 — original line 1175

````c
/* F018: `push {lr}; bl a; bl b; bl c; pop {r0}; bx r0`.
 * THREE INDEPENDENT STATEMENTS, not a nest. Nothing moves r0 between the `bl`s,
 * which by itself does not separate `c(b(a()))` from three calls -- both leave
 * r0 alone. What settles it is the callees: all three take no arguments (none
 * of them reads r0-r3 before writing it) and all three end `pop {r0}`, i.e.
 * void, so there is no value to nest. src/decomp/c_08048558.c is the matched
 * exemplar of the same shape. */
````

## Note 12 — original line 1188

````c
/* Bit 5 of the flag word gates a two-way choice on unk07.
 *
 * unk07 is read `movs r0, #7; ldrsb r0, [r2, r0]` -- the reg+reg form agbcc
 * rewrites a plain s8 member load into, and the same tell that settled unk06 in
 * sub_08000664. The pointer is loaded once and held: nothing here writes
 * through it, so there is no aliasing reload.
 *
 * Wave 31 declared this `void (void)` from its call sites in sub_08000DC0
 * before its body had been read; the body agrees -- no argument register is
 * read, and the epilogue is `pop {r0}; bx r0`. */
````

## Note 13 — original line 1209

````c
/* One call whose second argument is 0xAB or 0xAA depending on unk07, and whose
 * first is always 0xAA.
 *
 * An if/ELSE, not `v = 0xAA;` followed by a guarded overwrite: both spellings
 * preset r1 to 0xAA and conditionally replace it, but the plain assignment puts
 * that `movs r1, #0xaa` ahead of the pool load, where the ROM has it after the
 * field has been read.
 *
 * The two 0xAA are NOT shared: agbcc does not CSE a `movs` of a small constant
 * across a branch -- the same observation as src/decomp/c_0802D168.c's two
 * `movs r0, #1`. */
````

## Note 14 — original line 1231

````c
/* Draws the 5x4 grid of unit icons from a 20-halfword template copied onto the
 * stack. `k` walks the template flat while `i` and `j` place the cell: `x`
 * steps 0x14 across a row from 0x4C, `y` steps 0x19 down from 0x13.
 *
 * `gUnknown_08485CC8[i + 1]` is why `adds r6, #1` sits in the middle of the
 * body rather than at the bottom -- the same idiom the matched sub_08003640
 * uses on gUnknown_08485C9C, and it is what makes the counter run 1..4 while
 * the coordinate givs run from the i = 0 origin.
 *
 * The `lsls #0x10` hoisted into the outer loop with only the `lsrs #0x10` left
 * at the call is LICM on the u16 conversion sub_0802BD54's second parameter
 * forces; it must not be authored. */
````

## Note 15 — original line 1265

````c
/* Loads the four unit-slot graphics named by a 4-byte template on the stack.
 *
 * `gUnknown_08485C9C[i + 1]` is the same spelling the matched sub_08003640
 * (src/decomp/c_08003640.c) uses on the same table, and it is what puts
 * `adds r4, #1` between the two array reads: the template is indexed with the
 * pre-increment value and the tile table with the post-increment one. */
````

## Note 16 — original line 1284

````c
/* Editor army-panel state, still in the original contiguous design object. */
````
