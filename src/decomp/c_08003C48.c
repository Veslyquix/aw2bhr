#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003C48.
 * sub_08003C48 @ 0x08003C48
 */

struct Unk3F44Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0A22 - 0x0004];
    /* 0x0A22 */ u16 plane[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 cell[0x417A - 0x1432];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct Unk3F44Map *)gUnknown_08499590)

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
                MAP->plane[MAP->rowOffset[y] + x] = 0x2A;
                MAP->cell[MAP->rowOffset[y] + x] = a1;
                break;
            case 1:
                MAP->plane[MAP->rowOffset[y] + x] = a1;
                MAP->cell[MAP->rowOffset[y] + x] = 1;
                break;
            case 3:
                sub_080011F4(x, y, 3);
                sub_0800B048(x, y);
                break;
            case 4:
                MAP->plane[MAP->rowOffset[y] + x] = 0x87;
                MAP->cell[MAP->rowOffset[y] + x] = a1;
                break;
            }
        }
    }

    sub_080219AC();
    sub_0800C8D8();
    gUnknown_0200B0B0->unk12 = sub_0800C874();
}
