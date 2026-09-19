#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003F44.
 * sub_08003F44 @ 0x08003F44
 */

#define MAP gMap

void sub_08003F44(int x, int y, int v)
{
    if (x > 0x1D)
        x = 0x1D;
    if (y > 0x13)
        y = 0x13;

    MAP->tile[MAP->rowOffset[y] + x] = v;

    switch (v)
    {
    case 1:
        MAP->terrain[MAP->rowOffset[y] + x] = v;
        break;
    case 0x20:
        MAP->terrain[MAP->rowOffset[y] + x] = 3;
        break;
    case 0x87:
        if (MAP->terrain[MAP->rowOffset[y] + x] != 4)
        {
            MAP->terrain[MAP->rowOffset[y] + x] = 4;
            MAP->tile[MAP->rowOffset[y] + x] = v;
            sub_0800CF28(x, y);
        }
        break;
    case 0x2A:
        sub_08007CA0(x, y);
        break;
    }
}
