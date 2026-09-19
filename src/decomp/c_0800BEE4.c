#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800BEE4.
 * sub_0800BEE4 @ 0x0800BEE4
 */

#define MAP gMap

void sub_0800BEE4(int x, int y)
{
    if (y > 0)
    {
        int n = y - 1;
        if (x > 0)
            sub_0800BEB8(x - 1, n);
        sub_0800BEB8(x, n);
        if (x < MAP->width - 1)
            sub_0800BEB8(x + 1, n);
    }

    if (x > 0)
        sub_0800BEB8(x - 1, y);

    if (x < MAP->width - 1)
        sub_0800BEB8(x + 1, y);

    if (y < MAP->height - 1)
    {
        int n = y + 1;
        if (x > 0)
            sub_0800BEB8(x - 1, n);
        sub_0800BEB8(x, n);
        if (x < MAP->width - 1)
            sub_0800BEB8(x + 1, n);
    }
}
