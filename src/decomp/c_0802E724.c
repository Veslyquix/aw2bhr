#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802E724.
 * sub_0802E724 @ 0x0802E724
 */

bool8 sub_0802E724(s16 a1, s16 a2)
{
    struct Unk08499594 **ptbl;
    struct Unk08499594 *e;
    int off;
    int army;

    ptbl = &gUnknown_08499594;

    off = gMap->rowOffset[a2] + a1;
    e = &(*ptbl)[gMap->unk0012[off]];

    army = gUnknown_03003F38 & 0xc0;

    if (army != gUnknown_03003F2C)
        return FALSE;

    if (gUnknown_03003340[a2][a1] > 0x78)
        return FALSE;

    if (gMap->unk0012[off] == 0)
        return TRUE;

    if ((gMap->unk0012[off] & 0xc0) != army)
        return FALSE;

    if ((u8)sub_08025FC0((struct Unk08499594 *)gUnknown_030040D8, e) == 1)
        return TRUE;

    if ((u8)sub_080422A8(a1, a2) == 1)
        return TRUE;

    return FALSE;
}
