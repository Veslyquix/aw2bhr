#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08065710.
 * sub_08065710 @ 0x08065710
 */

/* The `(s32)` cast on sub_08015BD0's argument is the spelling every other
 * sub_08015BD0 caller in src/decomp already uses (c_080670D8.c reaches the
 * SAME script). `lsls #0x18; asrs #0x18` after the `bl` is agbcc re-narrowing
 * that callee's `s8` return before the compare against -1. */
void sub_08065710(void)
{
    sub_0801F34C(0x68, 0xAC, 4, 0, 1);

    if (sub_08015BD0((s32)gUnknown_08580DD8) == -1)
        sub_08015C30(gUnknown_03001FBC);
}
