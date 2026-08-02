#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08012E9C.
 * sub_08012E9C @ 0x08012E9C
 */

void sub_08012E9C(u16 x, u16 y, u8 c)
{
    if (c == 0x2e || c == 0x2c)
        sub_08012E74(x, y, 0x3c);
    else if (c == 0x2d || c == 0x3d || c == 0x5f)
        sub_08012E74(x, y, 0x3d);
    else if (c == 0x28)
        sub_08012E74(x, y, 0x3a);
    else if (c == 0x29)
        sub_08012E74(x, y, 0x3b);
    else if (c == 0x3a)
        sub_08012E74(x, y, 0x3d);
    else if (c == 0x20)
        sub_08012E74(x, y, 0x3f);
    else if (c == 0x2f)
        sub_08012E74(x, y, 0x3d);
    else if (c == 0x25)
        sub_08012E74(x, y, 0x3e);
    else if (c > 0x60)
        sub_08012E74(x, y, c + 0xffbf);
    else if (c > 0x40)
        sub_08012E74(x, y, c + 0xffdf);
    else
        sub_08012E74(x, y, c + 0xffe0);
}
