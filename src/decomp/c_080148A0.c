#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080148A0.
 * sub_080148A0 @ 0x080148A0, sub_080148E0 @ 0x080148E0
 */

/* FIVE arguments: `sub sp, #4` plus `str r4, [sp]` before the `bl` is the
 * fifth going on the stack, and nothing else in the function needs stack
 * space. sub_0801489C itself is a four-byte `bx lr`, so its widths cannot be
 * read off a prologue -- see its declaration in unknown-functions.h.
 *
 * `movs r6,#0x81; lsls r6,#3` is the CONSTANT 0x408, not a shift: it is the
 * displacement of gUnknown_0200BC14's second u16 array, and both arrays are
 * indexed with the same `i * 2` byte offset off one pool word.
 *
 * OPERAND ORDER IS A READOUT HERE. The ROM builds `&unk408[i]` before
 * `&unk000[i]` and only then loads, which is what `unk408[i] + unk000[i] * 2`
 * produces; writing the sum the other way round emits the unk000 load first
 * (measured with compile_probe). The ADD's operands come out in the same order
 * either way, so the address arithmetic is the only place it shows. */
u16 sub_080148A0(int a1, u8 a2, u8 a3)
{
    return sub_0801489C(a1,
                        gUnknown_0200BC14.unk408[a2] + gUnknown_0200BC14.unk000[a2] * 2,
                        a3, a2, 0);
}

/* sub_080148A0 with the index pinned to 0 and the last three arguments zero.
 * The three zeroes are ONE register: gcc reuses r2 for the stack word and for
 * argument 3 rather than reloading, and materialises r3 separately. See
 * sub_080148A0 for why the sum is written unk408 first. */
u16 sub_080148E0(int a1)
{
    return sub_0801489C(a1,
                        gUnknown_0200BC14.unk408[0] + gUnknown_0200BC14.unk000[0] * 2,
                        0, 0, 0);
}
