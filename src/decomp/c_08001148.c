#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08001148.
 * sub_08001148 @ 0x08001148
 */

/* A halfword fill. `n` is signed and the guard is `ble`, so a zero or
 * negative count writes nothing -- the loop is rotated, not zero-trip.
 *
 * `value` is `int` rather than `u16`: agbcc emits the PROMOTE_MODE
 * `lsl #16; lsr #16` in the prologue for any sub-word parameter, even one
 * whose only use is a `strh` that throws the upper half away, and the ROM's
 * prologue has no such pair. */
void sub_08001148(u16 *dst, int n, int value)
{
    while (n > 0)
    {
        *dst++ = value;
        n--;
    }
}
