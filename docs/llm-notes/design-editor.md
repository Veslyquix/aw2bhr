# Notes for `src/design-editor.c`

Source: [`src/design-editor.c`](../../src/design-editor.c). These comments were moved verbatim from the C file; line numbers refer to the version before extraction.

## Note 1 — original line 5

````c
/* Design-room code at 0x08003640..0x08004723; grouped at a literal-pool boundary. */
````

## Note 2 — original line 24

````c
/* A five-entry sprite load list, the same idiom as src/decomp/c_0800376C.c. */
````

## Note 3 — original line 34

````c
/* MATCHED, first draft. A font/graphics load list: one sub_0801F150 followed by
 * fourteen sub_0801F234 ids. sub_080037AC is the same function again, byte for
 * byte, which is why both were taken together. The same idiom is already
 * matched in src/decomp/c_080339B0.c and c_08065990.c. */
````

## Note 4 — original line 63

````c
/* MATCHED. Byte-for-byte the same function as sub_08003704 -- same blob, same
 * fourteen ids, same order. */
````

## Note 5 — original line 97

````c
/* MATCHED, wave 36 (W36-I). PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D784"]
 * in this function's data/promoted.json entry. 0x0808D784 is agbcc's own
 * -fforce-addr word holding &gActiveMap (dereferenced in baserom.gba),
 * not a global of the original source, so the honest spelling is used here.
 *
 * unk42 is s16, and this function is what proves it: `movs r0,#0;
 * ldrsh r3,[r1,r0]` and then compares against -2, -3 and -10.
 *
 * `v = *q; v = <ternary on v>;` is deliberate. Folding the load into the
 * ternary (`v = *q >= -2 ? -2 : *q + 1;`) permutes r0/r3 through both arms and
 * drops the ROM's `adds r3, r0, #0` copy at the merge -- 47.7% instead of a
 * match. The `s16 *q` local is what keeps the `strh` on the pointer the arms
 * built rather than reloading the global before the store. */
````

## Note 6 — original line 158

````c
/* Family F001 forwarder, 12 bytes:
 *     push {lr}
 *     bl   <callee>
 *     pop  {r0}
 *     bx   r0
 * The `pop {r0}` fixes THIS function as void: it overwrites whatever
 * the callee returned, so nothing about the callee is visible from
 * here. Everything below was read off the callee's own body instead.
 *
 * The callee reads no argument register before writing it, so there
 * is no parameter to pass through either.
 */
````

## Note 7 — original line 201

````c
/* F002: `push {lr}; ldr r0,=g; movs r1,#0; bl sub_080152EC; pop {r0}; bx r0`.
 * One statement, result discarded -- `pop {r0}` makes the wrapper void.
 * sub_080152EC's first parameter is `const void *`, which takes the
 * `const u8 []` blob with no cast; a plain `void *` would discard the const and
 * -Werror turns that into an error. src/decomp/c_0802BF80.c is the matched
 * exemplar for this shape. */
````

## Note 8 — original line 212

````c
/* F002: `push {lr}; ldr r0,=g; movs r1,#0; bl sub_080152EC; pop {r0}; bx r0`.
 * One statement, result discarded -- `pop {r0}` makes the wrapper void.
 * sub_080152EC's first parameter is `const void *`, which takes the
 * `const u8 []` blob with no cast; a plain `void *` would discard the const and
 * -Werror turns that into an error. src/decomp/c_0802BF80.c is the matched
 * exemplar for this shape. */
````

## Note 9 — original line 223

````c
/* Display/blend shadow setup. Every 030030E0 access here is ldrb/strb, so this
 * function has NO raw-halfword write at all -- the two target groups are
 * eleven single-bit `.bits` assignments that agbcc merges into one
 * read-modify-write per byte. `effect = 3` is the all-ones case, so it drops
 * the AND (store_fixed_bit_field's all_one) and emits a bare `orr #0xc0`.
 *
 * The `~1` mask built for target1_enable_bg0 = 0 survives in r1 and is reused
 * for target2_enable_bg0 = 0 at byte 1; that reuse is what pins the two clears
 * as the first statement of each group. */
````

## Note 10 — original line 261

````c
/* The parameterised sibling of sub_080039E4: same prologue call, same blend
 * groups with different constants, then the four u8 globals take arguments
 * rather than literals.
 *
 * All four parameters are `int`. The prologue masks nothing (`mov sl,r0;
 * adds r7,r1,#0; mov sb,r2; str r3,[sp]`), and PROMOTE_MODE would have forced
 * a shift pair or an `ands` on any u8/u16 parameter -- so the `strb` at each
 * use is the narrowing into the u8 global, not a parameter width.
 *
 * `gUnknown_03001FFC = v = 0;` is load-bearing and is the whole 4 bytes. The
 * ROM keeps ONE zero pseudo in r4 spanning 03001FFC, 03002B28 and the
 * `gUnknown_030030DC` halfword clear; written as three separate `0` literals
 * the third zero is rematerialised, the allocator re-shuffles, and the
 * candidate comes out 4 bytes SHORT (232) because #2 then wins the callee-saved
 * register the ROM spends on the zero. Same lever as c_08037260.c.
 *
 * The DC halfword clear was probed BOTH ways -- `.raw = v` and
 * `*(u16 *)&gUnknown_030030DC = v` -- and they are byte-identical here despite
 * a live zero being the value stored. See the wave-23 blend-shadow section of
 * docs/agbcc-codegen.md. */
````

## Note 11 — original line 331

````c
/* MATCHED, wave 40 (W40-A). Needs its .rodata pool word placed:
 *   "rodata": ["0x0808D788"]
 * -- the ROM word there holds &gActiveMap, so writing the global's name
 * honestly is correct and trymatch reports only the symbol-naming artefact.
 *
 * Resets the map header to 30 x 20, rebuilds the +0x417A row-offset table, and
 * then picks a fill routine from the L/R key pair. Two notes worth keeping:
 *   - the row-offset loop has NO entry guard because the `strh #0x14` two
 *     statements earlier is CSE'd into the guard's load, folding `0 < 20` away.
 *     It is an ordinary `for`, not a do/while.
 *   - the key word is gpKeySt->held (offset 0), NOT ->held (offset 4). unk00
 *     is the mask hardware.h already documents as carrying 0x200 (L) and
 *     0x100 (R), which is exactly the 0x300 tested here. */
````

## Note 12 — original line 440

````c
/* MATCHED, wave 36 (W36-I), after five waves parked at 93.7%. PROMOTION NEEDS
 * THE POOL WORD PLACED:
 *     "rodata": ["0x0808D794"]
 * (two references, both to the same word, which holds &gUnknown_08499590.)
 *
 * THE OLD PARK NOTE WAS WRONG and this replaces it. It described the residual
 * as "a pure register permutation ... nothing in the C distinguishes them" and
 * listed the axes it had ruled out -- all of them about `u8 *` arithmetic on
 * the map (`cells` locals, `*(p + K + idx)`, a permuter run). The axis that
 * mattered was not in the list because it did not exist yet when the note was
 * written: the planes must be reached as MEMBERS of a struct cast onto
 * gUnknown_08499590 (W34-F's rule), and the cast must stay INLINE rather than
 * being bound to a `map` local. A local keeps the pseudo live to the end of
 * its scope, so agbcc preserves the base (`mov rT,ip; adds rD,rBase,rT`) where
 * the ROM advances it (`add rBase,ip`) -- that pair IS the advance-vs-preserve
 * difference the old note called indistinguishable.
 *
 * The last 24 bytes were scope, not allocation luck: `int idx;` at function
 * scope is one allocno shared by four disjoint blocks and lands in r3 where
 * the ROM uses r1/r0. Block-scope declarations in the two case-7 arms that
 * need the `+1`/`-1` sequenced (`idx = row; idx++; idx += x;`, which also
 * stops `x + 1` being CSEd with the call argument) plus plain inline
 * expressions in the two case-1 arms is what matches. Mixing the two styles is
 * what the register numbers read out, not an inconsistency.
 *
 * `ands r2, r4` in the case-1 arm is `x & 1` with agbcc substituting the
 * switch register, which cse knows equals 1 after `cmp r2,#1; beq`. */
````

## Note 13 — original line 522

````c
/* MATCHED, wave 40 (W40-A). Redraws every cell of the map: for each row, for
 * each column, hand FixShorelineAt the cell's terrain byte off the +0x1432 array,
 * indexed the way every other reader in this block indexes it -- through the
 * +0x417A row-offset table. */
````
