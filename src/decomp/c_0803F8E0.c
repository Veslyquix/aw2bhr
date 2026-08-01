#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803F8E0.
 * sub_0803F8E0 @ 0x0803F8E0
 */

/* `adds r0, r1, #0` is the FIRST instruction after the prologue: r0 arrives and
 * is thrown away, so the first parameter is unused in the source. 0x20 words is
 * 0x80 bytes -- four 32-byte 4bpp tiles -- and the index is scaled by 4 before
 * the mask, so the four tiles copied are the group `n * 4` selects. */
void sub_0803F8E0(int a, int b)
{
    CpuFastSet(gUnknown_080D20C4 + ((b * 4) & 0x3FF) * 32, (void *)0x06010900, 0x20);
}
