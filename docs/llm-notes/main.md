# Notes for `src/main.c`

Source: [`src/main.c`](../../src/main.c). These comments were moved verbatim from the C file; line numbers refer to the version before extraction.

## Note 1 — original line 5

````c
/* Main/reset code, contiguous from 0x08036B28 through 0x08037170.
 * The adjacent source units have their own .rodata placements.
 * Keep these functions in address order to preserve the ROM layout. */
````

## Note 2 — original line 14

````c
/* The boot/reset unit's frame-gate reset: clears the mask sub_080369BC ANDs
 * against gGameClock, then re-enters through sub_0801F00C.
 *
 * sub_08036B48 below is NOT a label. The index gives this function a size of
 * 24, but the body plus its single pool word only reach 0x08036B48; the last
 * four bytes are `b .` plus two of alignment padding. AgbMain reaches them
 * with `bl _08036B48` -- a CALL -- so a separate two-byte `for (;;) ;`
 * function lives there and was folded into this one's extent only because it
 * carries no symbol. It has to stay immediately below this definition: that
 * adjacency is what puts it at 0x08036B48 and what supplies the four bytes
 * this function's size is measured over. */
````

## Note 3 — original line 37

````c
/* The boot reset. Clears seven RAM cells, drops both single-slot callbacks
 * installed through sub_080366C4 / sub_080366D0, and then runs every
 * subsystem's own init in a flat chain. Every store is a bare 0 out of the
 * same callee-saved register, which fixes each cell's WIDTH and nothing else --
 * see the notes on them in include/unknown-globals.h. */
````

## Note 4 — original line 81

````c
/* A mode-entry sequence in the same shape as sub_080780E4: install a handler
 * pair through the sub_080366C4 / sub_080366D0 setters, then hand off. */
````

## Note 5 — original line 91

````c
/* Full reset, then enter the gUnknown_08553754 screen on tree 3. */
````

## Note 6 — original line 100

````c
/* A screen entry point. STRICT duplicate of sub_08036C80: the two instruction
 * streams are identical INCLUDING every pool symbol, so the two functions are
 * the same source twice over and nothing distinguishes them but their address.
 */
````

## Note 7 — original line 114

````c
/* STRICT duplicate of sub_08036C4C -- identical down to the pool symbols. */
````

## Note 8 — original line 125

````c
/* Soft reset preserving four bytes of gUnknown_02028E41. The four bytes are
 * copied out one at a time into a stack buffer, all 256K of EWRAM is cleared
 * with a fixed-source DMA3 fill, the four bytes are written back, and control
 * leaves through SoftReset(0xFE).
 *
 * The three DMA registers are reached through one `vu32 *` cursor at
 * displacements 0/4/8 rather than by name, the same idiom c_080638A8.c
 * documents; naming them emits an `add` between the stores. The trailing read
 * of dma[2] is the usual discarded post-trigger read and only survives because
 * the pointer is volatile.
 *
 * The byte copies are written out individually rather than as a loop or a
 * memcpy because that is what the ROM has: four separate `strb`s through four
 * separate address registers, which is what agbcc must emit for a stack array
 * (THUMB `strb` has no sp-relative form). */
````

## Note 9 — original line 163

````c
/* The ROM entry point, called from src/crt0.s.
 *
 * Clears 0x1FE0 words of IWRAM from 0x03000000 with a fixed-source DMA3 fill,
 * sets the waitstate control word, latches the keypad ONCE, brings up the
 * subsystems, then enters the frame loop for good.
 *
 * `keys` is volatile: the ROM spills it to the frame and re-reads it with a
 * fresh `add r0, sp, #4; ldrh r1, [r0]` at each of the two tests, which is
 * what a volatile local emits and what a plain one does not -- a plain `u16`
 * lands in r4 and the frame comes out 8 bytes instead of 0xC.
 *
 * The `flag` temporary is likewise in the ROM rather than inferred: the
 * condition is materialised as 0/1 into a register and only then tested, which
 * is an assignment followed by an `if`, not a compound `if` (see the
 * unconditional-`b` rule in docs/agbcc-codegen.md). */
````

## Note 10 — original line 216

````c
/* The soft-reset combo check: A+B+Select+Start (the low four KEYINPUT bits)
 * re-inits the save area unless its 0xAA/0x55 signature is already there.
 *
 * `keys` MUST be bound, and bound as `u16`. Written inline as
 * `((~REG_KEYINPUT & 0x3ff) & 0xf) == 0xf` the two masks fold to a single
 * `& 0xf` and the 0x3FF pool word disappears -- 8 bytes. Bound as `int` the
 * masks stay apart but the `adds r0, r2, #0` copy of the pool word does not
 * appear. `u16` gives both, and it is the same spelling AgbMain already uses
 * for this register in src/main.c.
 *
 * The `||` is a real short-circuit: `bne` on the first byte jumps straight to
 * the call, `beq` on the second skips it.
 *
 * Named per Xenesis's AW2 Subroutine List: "Subroutine that checks whether
 * A, B Start Select is pressed and performs a soft reset." The old
 * CheckSoftResetCombo symbol is kept as a linker alias below so every other unit
 * keeps resolving it unchanged. */
````

## Note 11 — original line 275

````c
/* `>> 6` is `lsrs` because gUnknown_0200C420.unk08 is `u8` -- the wave-27 rule.
 * The store's destination pool word is loaded BEFORE the source's, which is
 * what a plain global-to-global assignment gives. */
````

## Note 12 — original line 284

````c
/* TWO separate `orrs` of 1 and 4 into the same byte of gDispIo, not one `orrs`
 * of 5: two bitfield assignments, each re-materialising its own mask. Byte 1 of
 * DISPCNT is bits 8..15, so bit 0 is bg0_enable and bit 2 is bg2_enable. */
````

## Note 13 — original line 339

````c
/* F010: `push {lr}; ldr r0,=g1; bl S1; ldr r0,=g2; bl S2; pop {r0}; bx r0` --
 * two statements, each with its own pool word, result of each discarded.
 * src/decomp/c_08044924.c is the matched exemplar.
 * Two different callees and two FUNCTION pool words. sub_080366C4/sub_080366D0
 * are already promoted in src/decomp/c_080366C4.c taking `void (*)(void)`, so
 * no cast is needed here -- unlike the sub_08011AAC/sub_0801F024 sites, which
 * take `void *`. sub_0803662C registers the same two slots with a different
 * pair of handlers, which is what pins the argument order. */
````

## Note 14 — original line 367

````c
/* The destination is OBJ tile `a & 0x3ff`, i.e. byte offset
 * `(a & 0x3ff) * TILE_SIZE_4BPP` into OBJ_VRAM0. The honest mask spelling
 * `(a & 0x3FF) * 32` does NOT match: on THUMB agbcc loads 0x3ff from the pool
 * and emits `ldr; and; lsl #5`, three instructions and a fourth pool word.
 * The ROM's `lsl #0x16; lsr #0x11` is the truncate-then-scale form, which is
 * what a 16-bit intermediate gives -- `(u16)(a * 0x40) / 2` puts the same
 * bits in the same places in two instructions. Measured with compile_probe,
 * both spellings side by side. */
````
