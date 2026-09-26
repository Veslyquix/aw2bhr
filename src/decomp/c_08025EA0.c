#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08025EA0.
 * sub_08025EA0 @ 0x08025EA0
 */

void sub_08025EA0(void)
{
    int i;
    struct Unit *p;

    for (i = gUnknown_03003F2C; i < gUnknown_03003F2C + 0x33; i++)
    {
        p = &gUnits[i];
        if (p->type != 0 && !(p->flags & 8))
            p->flags &= ~1;
    }
}
