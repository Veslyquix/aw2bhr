#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08007F14.
 * sub_08007F14 @ 0x08007F14
 */

void sub_08007F14(int x, int y, int v)
{
    sub_08001158(x, y, v);

    if (v == 0x2A)
        return;

    if (v == 1)
    {
        int n = y - 1;

        if (sub_0800119C(x, n, 1))
            sub_08001158(x, n, 1);

        sub_0800ABD0(x, y);
    }

    sub_08007D70(x, y);
    sub_08007F9C(x, y);
    sub_0800A588(x, y);
}
