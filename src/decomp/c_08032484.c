#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08032484.
 * sub_08032484 @ 0x08032484
 */

/* Fills two 30-tile rows of a tilemap (rows 0 and 1, i.e. +0 and +0x20
 * halfwords) with consecutively numbered tiles starting at TILEREF(0x314, 3).
 *
 * The counter runs ACROSS both loops -- the second row continues at 0x3332 --
 * which is what makes it one `chr` local rather than two. Both loops are
 * ascending in the source; the `subs r3,#1; cmp #0; bge` bottoms are
 * check_dbra_loop's reversed exit tests, and the `adds r2,r4,#0` /
 * `adds r2,#0x40` preheaders are strength_reduce's giv inits, so neither is
 * authored. */

void sub_08032484(u16 *dst)
{
    u16 chr;
    int i;

    chr = 0x3314;

    for (i = 0; i < 30; i++)
        dst[i] = chr++;

    for (i = 0; i < 30; i++)
        dst[i + 0x20] = chr++;
}
