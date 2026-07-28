#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08056D70.
 * sub_08056D70 @ 0x08056D70
 */

/* All three parameters narrow at entry, so all three are u16 -- the third is
 * a default that the two tests override, and the trailing `adds r0, r2, #0`
 * is it being returned.
 */
u16 sub_08056D70(u16 a, u16 b, u16 c)
{
    if (a == 0xd)
    {
        c = 2;

        if (b == 1)
            c = 1;
    }

    return c;
}
