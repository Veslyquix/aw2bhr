#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08008D70.
 * sub_08008D70 @ 0x08008D70
 */

int sub_08008D70(int x, int y)
{
    if (y < gMap->height - 1)
    {
        struct Map *p;
        u8 *rows;
        u8 *tiles;
        int n;
        int t;
        int off;

        p = gMap;
        n = y + 1;
        t = n * 2;
        rows = (u8 *)p->rowOffset;
        off = (*(u16 *)(rows + t) + x) * 2;
        tiles = (u8 *)p->tile;

        if (*(u16 *)(tiles + off) == 0x36)
            return 0x36;
    }

    if (y > 0)
    {
        struct Map *p;
        u8 *rows;
        u8 *tiles;
        int n;
        int t;
        int off;

        p = gMap;
        n = y - 1;
        t = n * 2;
        rows = (u8 *)p->rowOffset;
        off = (*(u16 *)(rows + t) + x) * 2;
        tiles = (u8 *)p->tile;

        if (*(u16 *)(tiles + off) == 0x36)
            return 0x36;
    }

    if (x < gMap->width - 1)
    {
        struct Map *p;
        u8 *rows;
        u8 *tiles;
        int t;
        int off;

        p = gMap;
        t = y * 2;
        rows = (u8 *)p->rowOffset;
        off = (*(u16 *)(rows + t) + (x + 1)) * 2;
        tiles = (u8 *)p->tile;

        if (*(u16 *)(tiles + off) == 0x14)
            return 0x14;
    }

    if (x > 0)
    {
        struct Map *p;
        u8 *rows;
        u8 *tiles;
        int t;
        int off;

        p = gMap;
        t = y * 2;
        rows = (u8 *)p->rowOffset;
        off = (*(u16 *)(rows + t) + (x - 1)) * 2;
        tiles = (u8 *)p->tile;

        if (*(u16 *)(tiles + off) == 0x14)
            return 0x14;
    }

    return -1;
}
