#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003C48.
 * sub_08003C48 @ 0x08003C48
 */

#define MAP gMap

void sub_08003C48(int a1)
{
    int x, y;

    if (a1 < 0)
    {
        sub_08003B8C();
        return;
    }

    sub_08025E74();
    gUnknown_0200B0B0->unk13 = 0;

    for (x = 0; x < MAP->height; x++)
        MAP->rowOffset[x] = x * MAP->width;

    for (y = 0; y < MAP->height; y++)
    {
        for (x = 0; x < MAP->width; x++)
        {
            switch (a1)
            {
            case 7:
                MAP->tile[MAP->rowOffset[y] + x] = 0x2A;
                MAP->terrain[MAP->rowOffset[y] + x] = a1;
                break;
            case 1:
                MAP->tile[MAP->rowOffset[y] + x] = a1;
                MAP->terrain[MAP->rowOffset[y] + x] = 1;
                break;
            case 3:
                sub_080011F4(x, y, 3);
                sub_0800B048(x, y);
                break;
            case 4:
                MAP->tile[MAP->rowOffset[y] + x] = 0x87;
                MAP->terrain[MAP->rowOffset[y] + x] = a1;
                break;
            }
        }
    }

    sub_080219AC();
    sub_0800C8D8();
    gUnknown_0200B0B0->unk12 = sub_0800C874();
}
