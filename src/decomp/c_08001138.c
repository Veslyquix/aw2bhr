#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08001138.
 * sub_08001138 @ 0x08001138
 */

/* A byte fill, and the exact twin of sub_08001148 (src/decomp/c_08001148.c)
 * sixteen bytes behind it: the same rotated `while (n > 0)`, with `strb` and
 * `adds #1` where the halfword version has `strh` and `adds #2`. The whole
 * derivation was changing the pointer type in that file.
 *
 * `value` is `int` for the reason recorded on sub_08001148's prototype: agbcc's
 * PROMOTE_MODE emits an `lsl #24; lsr #24` pair in the PROLOGUE for a sub-word
 * parameter even when the only use is a `strb` that discards the upper bits,
 * and the ROM's prologue is bare.
 *
 * `n` is signed and the guard is `ble`, so a zero or negative count writes
 * nothing -- the loop is rotated, not zero-trip. */
void sub_08001138(u8 *dst, int n, int value)
{
    while (n > 0)
    {
        *dst++ = value;
        n--;
    }
}
