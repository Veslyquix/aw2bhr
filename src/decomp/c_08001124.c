#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08001124.
 * sub_08001124 @ 0x08001124
 */

/* A byte memset-to-zero. The counter is the parameter itself: init N with
 * `sub #1; cmp #0; bgt` is a genuine source count-down, not GCC's reversed
 * ascending loop (which inits N-1 and uses `bge`). */
void sub_08001124(u8 *dst, int n)
{
    for (; n > 0; n--)
        *dst++ = 0;
}
