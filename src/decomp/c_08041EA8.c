#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08041EA8.
 * sub_08041EA8 @ 0x08041EA8
 */

u8 sub_08041EA8(s16 x, s16 y, int t)
{
    s8 *costs;
    int idx;
    int c;

    if (x < 0)
        return 0;
    if (y < 0)
        return 0;

    if (x >= gMap->width)
        return 0;
    if (y >= gMap->height)
        return 0;

    idx = gMap->rowOffset[y] + x;

    if (gMap->unk0012[idx] != 0)
        return 0;

    costs = gUnknown_085D3DD0[1].unk38[0].unk18[0];

    c = (gMap->terrain[idx] & 0x1f)
        + gUnknown_085D5ABC[t].unk19 * 32;

    if (costs[c] < 0)
        return 0;

    return 1;
}
