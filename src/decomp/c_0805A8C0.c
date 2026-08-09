#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805A8C0.
 * sub_0805A8C0 @ 0x0805A8C0
 */

int sub_0805A8C0(u16 x, u16 y)
{
    int i;
    int dx;
    u16 dy;

    for (i = 0; i < 4; i++)
    {
        if ((gUnknown_08499598[gUnknown_030033EC].unk2c >> i) & 1)
        {
            if (sub_08026D44(i + 1))
            {
                dx = x - gUnknown_08499598[i + 1].unk2d + 2;
                dy = y - gUnknown_08499598[i + 1].unk2e + 2;

                if ((u16)dx <= 4 && (s16)dy >= 0 && (s16)dy <= 4)
                    return 1;
            }
        }
    }

    return 0;
}
