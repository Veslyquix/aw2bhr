#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801BAA8.
 * sub_0801BAA8 @ 0x0801BAA8
 */

/* COSINE, in degrees: sub_0801BA4C is a degree-based sine table lookup, so
 * adding a quarter turn in front of it gives the cosine. `lsls #0x10;
 * asrs #0x10` after the call is agbcc re-narrowing a narrow-returning callee,
 * and the ARITHMETIC shift makes sub_0801BA4C's return SIGNED.
 *
 * WAVE 29 (C) retyped the parameter from `u8 *` to `int`; see the note on
 * sub_0801BA4C in include/unknown-functions.h. Byte-neutral -- `p + 0x5a` and
 * `a + 0x5a` are both a bare `adds r0, #0x5a`. */
s16 sub_0801BAA8(int a)
{
    return sub_0801BA4C(a + 0x5a);
}
