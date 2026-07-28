#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804B830.
 * sub_0804B830 @ 0x0804B830
 */

/* The single result local is load-bearing, and it is the only thing that is.
 * Both `if (b == 8) return gUnknown_030045A8[a] + 0x15; return b;` and its
 * inverse produce the same instructions in the same order, but assign the pool
 * base to r1 and the scaled index to r0; the ROM has them the other way round
 * (`ldr r0,=g ; lsls r1,r2,#1 ; adds r1,r1,r0 ; ldrh r0,[r1]`). Routing both
 * arms through one variable flips the pair. Also ruled out, all identical to
 * the two-return form: a local for the loaded element, a pointer local for the
 * array base, `*(g + a)`, an `int` return, and a u32 index local.
 */
u16 sub_0804B830(u16 a, u16 b)
{
    u16 r;

    r = b;

    if (b == 8)
        r = gUnknown_030045A8[a] + 0x15;

    return r;
}
