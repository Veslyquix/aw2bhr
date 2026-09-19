#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080083E0.
 * sub_080083E0 @ 0x080083E0
 */

/* sub_080081E0 is the same function against the previous pool word. The typed
 * gMap spelling is byte-exact here as long as the rowOffset/tile byte-pointer
 * locals stay scoped per use.
 */
void sub_080083E0(int x, int y)
{
    if (y > 0)
    {
        int n = y - 1;

        if (x > 0)
        {
            if (sub_080015E4(x - 1, n))
            {
                struct Map *p;
                u8 *rows;
                u8 *tiles;
                int t;
                int off;

                p = gMap;
                t = n * 2;
                rows = (u8 *)p->rowOffset;
                off = (*(u16 *)(rows + t) + (x - 1)) * 2;
                tiles = (u8 *)p->tile;
                sub_08007F14(x - 1, n, *(u16 *)(tiles + off));
            }
        }
        if (sub_080015E4(x, n))
        {
            struct Map *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gMap;
            t = n * 2;
            rows = (u8 *)p->rowOffset;
            off = (*(u16 *)(rows + t) + (x)) * 2;
            tiles = (u8 *)p->tile;
            sub_08007F14(x, n, *(u16 *)(tiles + off));
        }
        if (x < gMap->width - 1)
        {
            if (sub_080015E4(x + 1, n))
            {
                struct Map *p;
                u8 *rows;
                u8 *tiles;
                int t;
                int off;

                p = gMap;
                t = n * 2;
                rows = (u8 *)p->rowOffset;
                off = (*(u16 *)(rows + t) + (x + 1)) * 2;
                tiles = (u8 *)p->tile;
                sub_08007F14(x + 1, n, *(u16 *)(tiles + off));
            }
        }
    }
    if (x > 0)
    {
        if (sub_080015E4(x - 1, y))
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
            sub_08007F14(x - 1, y, *(u16 *)(tiles + off));
        }
    }
    if (x < gMap->width - 1)
    {
        if (sub_080015E4(x + 1, y))
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
            sub_08007F14(x + 1, y, *(u16 *)(tiles + off));
        }
    }
    if (y < gMap->height - 1)
    {
        int n = y + 1;

        if (x > 0)
        {
            if (sub_080015E4(x - 1, n))
            {
                struct Map *p;
                u8 *rows;
                u8 *tiles;
                int t;
                int off;

                p = gMap;
                t = n * 2;
                rows = (u8 *)p->rowOffset;
                off = (*(u16 *)(rows + t) + (x - 1)) * 2;
                tiles = (u8 *)p->tile;
                sub_08007F14(x - 1, n, *(u16 *)(tiles + off));
            }
        }
        if (sub_080015E4(x, n))
        {
            struct Map *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gMap;
            t = n * 2;
            rows = (u8 *)p->rowOffset;
            off = (*(u16 *)(rows + t) + (x)) * 2;
            tiles = (u8 *)p->tile;
            sub_08007F14(x, n, *(u16 *)(tiles + off));
        }
        if (x < gMap->width - 1)
        {
            if (sub_080015E4(x + 1, n))
            {
                struct Map *p;
                u8 *rows;
                u8 *tiles;
                int t;
                int off;

                p = gMap;
                t = n * 2;
                rows = (u8 *)p->rowOffset;
                off = (*(u16 *)(rows + t) + (x + 1)) * 2;
                tiles = (u8 *)p->tile;
                sub_08007F14(x + 1, n, *(u16 *)(tiles + off));
            }
        }
    }
}
