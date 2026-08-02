#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08009264.
 * sub_08009264 @ 0x08009264
 */

void sub_08009264(int x, int y)
{
    int v;
    int d;

    if (sub_08009B38(x, y))
    {
        v = 0;
        switch (sub_08008CB8(x, y))
        {
        case 0:
        case 8:
        case 9:
            d = sub_08008D14(x, y);
            if (d & 6)
                v = 0x13;
            break;
        case 2:
        case 4:
        case 6:
            d = sub_08008D14(x, y);
            if (d & 9)
                v = 0x16;
            break;
        }
        if (v > 0)
        {
            sub_0800C608(x, y);
            sub_080011F4(x, y, 0xC);
            sub_08001158(x, y, v);
            sub_08007F9C(x, y);
        }
    }
}
