# Notes for `src/design-menus.c`

Source: [`src/design-menus.c`](../../src/design-menus.c). These comments were moved verbatim from the C file; line numbers refer to the version before extraction.

## Note 1 — original line 5

````c
/* Design-room code at 0x08004724..0x08004D8F; grouped at a literal-pool boundary. */
````

## Note 2 — original line 9

````c
/* MATCHED, wave 42 (W42-B2), via decomp-permuter from a 57.4% size-exact
 * hand draft. PROMOTION NEEDS THE .rodata POOL WORD PLACED -- add
 *     "rodata": ["0x0808D7A8"]
 * to this function's data/promoted.json entry, then re-run
 * tools/split_rodata.py and tools/gen_lds.py before building. trymatch
 * reports `relocs: name different symbols that resolve to the same address`,
 * which is the false-mismatch case, not a difference.
 *
 * The two levers, both of which the permuter found and neither of which was
 * on the wave-40 draft's list of things to try:
 *   - `m = MAP;` INSIDE the inner loop body, used for the two stores' bases
 *     while the rowOffset reads still go through the global expression. The
 *     residual was that agbcc kept the -fforce-addr .rodata word's ADDRESS
 *     live in sl for the whole function so pass 2's guard could re-read it;
 *     splitting the address's uses this way lets pass 2 re-materialise the
 *     plain .text pool word as the ROM does, and the freed register pays for
 *     hoisting 0x417A.
 *   - `c = 7;` before the loops rather than the literal at the store. A named
 *     constant local lands in a different register (`movs r5,#7` and not
 *     `movs r0,#7`) -- the same family as the wave-23 named-constant rule.
 *
 * What was already right and is worth keeping: the ROM materialises
 * &gUnknown_08499590 TWICE by two different routes and BOTH belong. -fforce-addr
 * parks the address in this unit's own .rodata (the word the ROM has at
 * 0x0808D7A8, immediately behind gUnknown_0808D7A0's 8 bytes) and pass 1's
 * outer guard reads through it, while pass 1's body and all of pass 2 use a
 * plain .text pool word holding the symbol. The honest spelling below produces
 * both; no c_local workaround is needed.
 */
````

## Note 3 — original line 66

````c
/* Family F003 (data/families.json): 34 twelve-byte forwarders shaped
 * `push {lr}; movs r0,#K; bl S; pop {r0}; bx r0`, i.e. one call with one
 * literal argument and nothing else. `pop {r0}; bx r0` fixes this as void.
 * The argument's C type is not recoverable from here -- `movs r0,#K` is the
 * same two bytes for int/u32/u16/s16/u8 -- so the spelling follows the
 * callee's declaration in unknown-functions.h and nothing else.
 * Exemplar: src/decomp/c_08004A60.c. */
````

## Note 4 — original line 79

````c
/* Family F055 (data/families.json): `push {lr}; movs r0,#K; bl A; movs r0,#1;
 * bl B; pop {r0}; bx r0` -- 20 bytes, three members. `varies` covers index 1
 * (the first immediate) and the two `bl` targets; index 3 is absent, so the
 * `movs r0, #1` is byte-identical across all three.
 *
 * Two independent calls with their arguments materialised in front of each --
 * no nesting is possible, both callees have their r0 written by a `movs`.
 * `pop {r0}` is the void epilogue.
 */
````

## Note 5 — original line 90

````c
/* 0x66 is a sound id: sub_0803B4DC is the sound-request wrapper matched in this
 * same wave as a member of family F066, and its `int` parameter is the one
 * already declared in include/unknown-functions.h. Passing a literal into it is
 * an independent check on that reading -- and the check is that this call site
 * does NOT constrain the width at all, since `int`, `s16` and `u16` are
 * byte-identical for a `movs`-sized constant. That is why the width had to be
 * settled from sub_08016104/sub_08016130 and src/proc.c instead.
 */
````

## Note 6 — original line 110

````c
/* Family F056 (data/families.json): `push {lr}; bl A; movs r0,#K; bl B;
 * pop {r0}; bx r0` -- 16 bytes, three members, and the three agree on nothing
 * but the shape: `varies` gives three distinct first callees, two distinct
 * immediates and three distinct second callees. Callee A's result (if it has
 * one) is discarded, because B's r0 is loaded by the `movs`.
 * `pop {r0}` is the void epilogue.
 */
````

## Note 7 — original line 119

````c
/* sub_0801A168 is `int(void)` and its result is discarded -- the ROM does not
 * settle its return width (see include/unknown-functions.h), and it does not
 * matter here because nothing narrows after the `bl`. src/decomp/c_0800484C.c
 * and eight other promoted files spell the same discarded call.
 *
 * The second callee is shared with family F056's other side of the batch:
 * sub_0800056C is called with `movs r0, #1` here and in sub_08004824 (F055).
 * Verified per member rather than assumed -- the other two F056 members call
 * sub_08034308 and sub_0806CC00 instead.
 */
````

## Note 8 — original line 136

````c
/* Family F005 (data/families.json): 19 sixteen-byte wrappers shaped
 * `push {lr}; bl S; bl S; pop {r0}; bx r0` -- two calls, nothing between
 * them, `pop {r0}` so void.
 * Two statements and not `g(f())`: the second callee takes no arguments (it
 * opens with a `bl`, a pool `ldr` or a `movs` into r0, never a read of r0),
 * so there is no parameter for the first call's result to reach. `g(f())`
 * would be byte-identical only if `g` had a parameter, and none of the 19
 * second callees does -- see the F005 block in unknown-functions.h. */
````

## Note 9 — original line 175

````c
/* Copies the up-to-19-byte NUL-terminated name at gActiveMap->designName
 * into the current gUnknown_03001470 slot at +0x1e, then hands the source to
 * sub_0804B10C. sub_0800487C (already promoted) strcmps the same two
 * addresses, which corroborates both as strings.
 *
 * THE 0x9c NAME FIELD IS AN ARRAY IN THE ORIGINAL SOURCE, and that is a
 * measured claim, not a guess: the ROM computes `g + 0x9c` and THEN adds `i`,
 * which is the ARRAY_REF tree. The old scalar-plus-padding declaration instead
 * reassociated the address as `g + i + 0x9c` and missed by one swapped pair.
 * The extent is exact rather than assumed: 0x9c..0xae is the 0x13 bytes this
 * loop copies. The shared declaration now records that measured array.
 *
 * struct Unk03001470 has the same problem at the destination end and is also
 * left alone: 0x1e is typed `s16 unk1e` (a frame counter measured from
 * sub_0803B118's signed compare) and 0x20/0x22/0x24 are s16 indices with
 * independent `ldrsh` evidence, yet this loop writes 0x1e..0x30 as bytes across
 * all of them. Both readings have evidence, so the slot is a UNION -- wave 40's
 * W40-F reaches the same conclusion from the other side, calling its layout
 * `struct Unk8019A60` a gUnknown_03001470 slot OVERLAY.
 *
 * gActiveMap IS NAMED EXACTLY TWICE and both mentions are load-bearing:
 * THREE mentions crosses agbcc's -fforce-addr threshold and buys a .rodata
 * indirection the ROM does not have (+20 bytes, measured); ONE mention, bound
 * at the TOP of the body, lets LICM hoist it and loses both reloads (-4 bytes,
 * measured). The reload survives only because `q` is assigned AFTER the `strb`,
 * which is what kills the invariance.
 *
 * DO/WHILE, NOT `for`. With two exits -- the NUL break and the counter -- the
 * `for` spelling makes agbcc rotate the loop and emit the i == 0 iteration a
 * second time ahead of it, with `d[0]` folded to a `strb [p,#30]`
 * displacement: +20 bytes, measured. */
````

## Note 10 — original line 230

````c
/* `adds rN, #0xae` before the `strb` is THUMB's byte-store immediate stopping
 * at 31, the same addressing-mode artefact unk6a and unk6b already carry -- not
 * a second object. */
````

## Note 11 — original line 240

````c
/* Family F003 (data/families.json): 34 twelve-byte forwarders shaped
 * `push {lr}; movs r0,#K; bl S; pop {r0}; bx r0`, i.e. one call with one
 * literal argument and nothing else. `pop {r0}; bx r0` fixes this as void.
 * The argument's C type is not recoverable from here -- `movs r0,#K` is the
 * same two bytes for int/u32/u16/s16/u8 -- so the spelling follows the
 * callee's declaration in unknown-functions.h and nothing else.
 * Exemplar: src/decomp/c_08004A60.c. */
````

## Note 12 — original line 253

````c
/* Family F011: `push {lr}; bl f; ldr r0,=g; movs r1,#N; bl h; pop {r0}; bx r0`.
 * Two statements and NOT a nest -- r0 is overwritten by the pool `ldr` between
 * the two calls, so nothing can survive from the first one. `pop {r0}` is the
 * void epilogue.
 *
 * sub_0801A168 is nullary and its result is discarded. gUnknown_0848721C is a
 * gUnknown_03001470 script blob handed to the standard sub_080152EC installer
 * on tree 0. */
````

## Note 13 — original line 284

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

## Note 14 — original line 301

````c
/* The two `strh`s share one `ldr r1, [r0]` because they are consecutive
 * statements with no call between them; `adds r2, r1, #0; adds r2, #0x46` then
 * `adds r1, #0x48` is the halfword-store immediate limit of 62, not two
 * separate loads. */
````

## Note 15 — original line 315

````c
/* Family F005 (data/families.json): 19 sixteen-byte wrappers shaped
 * `push {lr}; bl S; bl S; pop {r0}; bx r0` -- two calls, nothing between
 * them, `pop {r0}` so void.
 * Two statements and not `g(f())`: the second callee takes no arguments (it
 * opens with a `bl`, a pool `ldr` or a `movs` into r0, never a read of r0),
 * so there is no parameter for the first call's result to reach. `g(f())`
 * would be byte-identical only if `g` had a parameter, and none of the 19
 * second callees does -- see the F005 block in unknown-functions.h. */
````

## Note 16 — original line 330

````c
/* `int` and not a narrow parameter: the prologue saves r0 with a bare
 * `adds r4, r0, #0` across three calls, sub_08004A90 passes -1, and
 * sub_08003C48 tests the forwarded value with a signed `bge`. See
 * src/decomp/c_08004A60.c, which reads the same evidence from the other side.
 *
 * The `|=` is the aggregate-member operand swap its neighbour
 * src/decomp/c_08004BC0.c documents -- `orrs` with the CONSTANT's register as
 * the destination. */
````

## Note 17 — original line 347

````c
/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */
````

## Note 18 — original line 362

````c
/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */
````

## Note 19 — original line 377

````c
/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */
````

## Note 20 — original line 392

````c
/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */
````

## Note 21 — original line 407

````c
/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */
````

## Note 22 — original line 422

````c
/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */
````

## Note 23 — original line 437

````c
/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */
````

## Note 24 — original line 452

````c
/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */
````

## Note 25 — original line 467

````c
/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */
````

## Note 26 — original line 482

````c
/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */
````

## Note 27 — original line 497

````c
/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */
````

## Note 28 — original line 508

````c
/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */
````

## Note 29 — original line 519

````c
/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */
````

## Note 30 — original line 530

````c
/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */
````

## Note 31 — original line 541

````c
/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */
````

## Note 32 — original line 564

````c
/* `orr` with the constant's register as the destination -- the aggregate-member
 * `|=` operand swap, same as its neighbour sub_08003934.
 */
````

## Note 33 — original line 572

````c
/* One `bl` with a selected argument, not two calls in two arms: the
 * unconditional `b` past the second `ldr` is the `?:` tell, and it also
 * explains why the literal pool splits in two here -- gUnknown_08487B64 sits in
 * the block after the `b`, gUnknown_08487AC4 in the one after the call. */
````

## Note 34 — original line 601

````c
/* The pointer global is RELOADED between the first two stores even though no
 * call separates them (`ldr r1,[r4]` twice) -- a store through the pointer can
 * alias the pointer itself, so agbcc will not cache it. That is the ordinary
 * separate-statement shape and not a lever. */
````

## Note 35 — original line 618

````c
/* The seven-entry jump table is the load-bearing detail: agbcc only emits a
 * tablejump while the case nodes are still distinct, and `group_case_nodes`
 * merges adjacent cases sharing one body, so `case 3: ... case 7: break;`
 * collapses below the threshold and comes out as a three-compare tree. Giving
 * each of the five dead cases a body of its own keeps seven nodes alive; `flow`
 * then deletes the dead stores and cross-jumps the arms, which is why table
 * entries 2..6 all point at the epilogue. Same shape as sub_08020680. The
 * values stored are not recoverable -- only the fact that the five cases were
 * written out separately is. */
````

## Note 36 — original line 671

````c
/* MATCHED, wave 36 (W36-I). This is the call site that RETYPED family F059:
 * sub_080055B8 / sub_08005634 / sub_080056B0 were promoted as `(void)` in
 * src/decomp/c_080055B8.c, but every one of the three `bl`s here is preceded
 * by `movs r0,#0; movs r1,#0; movs r2,#0`. All three parameters are unused in
 * the callees, which is exactly why `(void)` was byte-identical there and is
 * NOT evidence against them -- only a call site can prove an argument. The
 * three definitions were widened to `(int, int, int)`, re-verified with
 * try_match (all three still match), and declared in unknown-functions.h.
 *
 * The `(s8)` cast on the u8 member is the `ldrb; lsls #0x18; asrs #0x18` --
 * an s8 member at a constant offset would be `movs rN,#0x10; ldrsb`. */
````

## Note 37 — original line 699

````c
/* Two pool words for one array element -- `ldr r2,=gTextTable;
 * ldr r3,=0x27E8; adds r2,r2,r3; ldr r2,[r2]` -- is `-fforce-addr` holding the
 * BASE address in its own register and then adding a byte offset too large for
 * `adds #imm8`. It is a constant subscript, not a variable one:
 * 0x27E8 / 4 == 0x9FA on the `u8 *[]` element type.
 *
 * Both parameters are pass-throughs, invisible here (no argument register is
 * written before the `bl`), and are read off sub_08004DD4. */
````
