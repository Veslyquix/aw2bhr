#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034F6C.
 * sub_08034F6C @ 0x08034F6C, sub_08034F7C @ 0x08034F7C
 */

/* `int` and not `s8`: byte-identical here either way (the `lsls #0x18;
 * asrs #0x18` is the s8 member read), but sub_080345C8 tests the result with a
 * bare `cmp r0, #0` and an s8 return would have narrowed it there first.
 * Retyped in wave 13 (A2); re-verified byte-for-byte. */
int sub_08034F6C(void)
{
    return gUnknown_030030F0.unk00;
}

void sub_08034F7C(void)
{
    gUnknown_030030F0.unk00++;
}
