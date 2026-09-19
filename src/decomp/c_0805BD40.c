#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805BD40.
 * sub_0805BD40 @ 0x0805BD40
 */

int sub_0805BD40(int x, int y, int t, int id, s16 *out)
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

    if (id == gUnknown_030045C8)
        return 0;

    idx = gMap->rowOffset[y] + x;

    if (gMap->unk0012[idx] != 0)
        return 0;

    costs = gUnknown_085D3DD0[1].unk38[0].unk18[0];

    c = (gMap->terrain[idx] & 0x1f)
        + gUnknown_085D5ABC[t].unk19 * 32;

    if (costs[c] != -1)
    {
        out[0] = x;
        out[1] = y;
        return 1;
    }

    return 0;
}
