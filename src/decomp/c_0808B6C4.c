#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808B6C4.
 * sub_0808B6C4 @ 0x0808B6C4
 */

/* memset. The `subs r2, #1` ahead of the guard plus `cmp` against a
 * materialised -1 (`movs #1; rsbs`) is the `while (n--)` signature -- the same
 * one that identified its neighbour sub_0808B6E8 as memcpy.
 * The fill value is `int`, not `u8`: a narrow parameter stored inside a loop
 * carries `lsl #24; lsr #24` in the prologue (combine cannot fold the
 * truncation into a store that is not in the entry block) and there is none. */

void * sub_0808B6C4(void * dst, int c, int size)
{
    u8 * d = dst;

    while (size--)
        *d++ = c;

    return dst;
}
