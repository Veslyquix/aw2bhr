# Notes for `src/map.c`

Source: [`src/map.c`](../../src/map.c). These comments were moved verbatim from the C file; line numbers refer to the version before extraction.

## Note 1 — original line 5

````c
/* Map and terrain setup, 0x080247A4–0x08024ABC. */
````

## Note 2 — original line 30

````c
/* Family F031: `callee(gPointerGlobal)`. The DOUBLE load -- `ldr r0,=g` then
 * `ldr r0,[r0]` -- is the global being a pointer VARIABLE and being
 * dereferenced, not a pool word holding an address; `pop {r0}` makes the
 * wrapper void. Exemplar src/decomp/c_0804B14C.c. */
````

## Note 3 — original line 40

````c
/* The palette half of LoadGameplayGraphics (src/decomp/c_08023360.c) lifted out as its
 * own routine: the same four `gUnknown_0810E6E0 + (gPlayers[i].unk1a
 * - 1) * 0x20` palette rows, on ApplyPaletteExt with a BYTE offset where the
 * exemplar uses ApplyPalette with a slot index -- 0x180/0x1A0/0x1C0/0x1E0 are
 * the exemplar's 12/13/14/15 times 0x20, and 0x240 is its 18.
 *
 * A data_refs-subset target (42% of LoadGameplayGraphics) and it behaved exactly as
 * that axis claims: all five globals and all eight callees already declared,
 * first draft, one attempt, nothing derived but statement order. The fourth
 * ApplyPaletteExt reuses the struct offset 0x10A as the base of its palette
 * constant (`movs r1,#0x85; lsls r1,#1` ... `adds r1,#0xd6` = 0x1E0) -- that is
 * gcc CSEing two unrelated integer constants, not a source feature. */
````

## Note 4 — original line 87

````c
/* `ldr r1,=0xFF4C0000; adds r0,r0,r1; lsrs r0,#0x10` is the id range test
 * `(u16)(a1 - 0xb4) <= 0xb` done on the still-shifted parameter -- one add and
 * one shift instead of a pair of compares. The 12 ids 0xb4..0xbf are the ones
 * sub_0803CD14 owns; everything else reads the row's own unk18.
 *
 * The branch polarity is load-bearing: agbcc branches on the TRUE condition to
 * the FIRST return's block and leaves the second in the fall-through, so
 * writing the range test the other way round swaps the two bodies. Measured.
 *
 * The `lsls #0x18; lsrs #0x18` before the `bl` is the conversion to
 * sub_0803CD14's `u8`; the one AFTER it is this function's own `u8` return
 * conversion, not a re-narrowing -- sub_0803CD14 returns `int`. */
````

## Note 5 — original line 108

````c
/* The name-string twin of sub_0802490C -- same 0xb4..0xbf range test, same
 * branch polarity. Here the fallback is gTextTable[row.unk14], a table
 * of `u8 *`, which is why the return is a pointer and nothing narrows
 * sub_0803CCEC's result. */
````

## Note 6 — original line 121

````c
/* One accumulator, not two returns: the value lives in r1 across both arms and
 * only reaches r0 in the shared `adds r0, r1, #0` at the end, which is what an
 * assigned local gives and a pair of `return`s does not.
 *
 * The `||` is read off the branch pair -- `beq` into the second block on the
 * first test and `bne` past it on the second, i.e. either condition enters the
 * override. The tail is src/decomp/c_080249C8.c's shape: `i = a & 0xe0`, zero
 * short-circuits, and `i >> 5` is an ARITHMETIC shift, so a1 is signed. */
````

## Note 7 — original line 157

````c
/* THREE parameters and the FIRST is unused: the body opens on r1 and never
 * reads r0, so a1 exists only to put a2 and a3 in r1 and r2.
 *
 * a2 is `s8`, and the two shift pairs are what say so: PROMOTE_MODE narrows it
 * into r3 with `lsls #0x18; lsrs #0x18` (zero-extending, which says only
 * "narrow") and the USE re-reads it as `lsls #0x18; asrs #0x18` -- the second
 * pair is where the sign lives. a3 is the u8 index into gUnknown_085D5ABC.
 *
 * `lsls #0x19; asrs #0x18` is a NET LEFT SHIFT OF ONE under an (s8) cast, not a
 * mask: count it as `(s8)(x * 2)` and fold it into the x5 above it, giving
 * `(s8)(unk10 * 10)`. Written as a shift it is a different instruction
 * sequence -- shorten_binary_op applies to MULT_EXPR and not to shifts. */
````
