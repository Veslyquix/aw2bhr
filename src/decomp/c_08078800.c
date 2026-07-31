#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078800.
 * sub_08078800 @ 0x08078800
 */

#include "proc.h"

/* sub_080787B8's twin, 0x48 bytes along: the same shape with the roles of
 * sub_08078658 and sub_080786A4 swapped and the tag 0x6a instead of 0x6b. */

void sub_08078800(void)
{
    s32 i;

    sub_080785FC();
    i = sub_080786A4(0);
    i = sub_08078608(i);

    if (sub_0803CBD8(0x6a))
    {
        sub_08078658(i);
        sub_08078770();
    }
    else
    {
        sub_08078740();
    }
}
