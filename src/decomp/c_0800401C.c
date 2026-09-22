#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800401C.
 * sub_0800401C @ 0x0800401C
 */

#include "map.h"

void sub_0800401C(int cx, int cy, int w, int h, int t)
{
    register int hh asm("r9") = h;
    register int tt asm("r10") = t;
    register int rx asm("r4");
    int y;
    int x;
    int ry;
    int ny;
    y = cy - (hh >> 1);
    if (y < 0)
        y = 0;
    for (ry = hh; ry > 0; ry--)
    {
        x = cx - (w >> 1);
        if (x < 0)
            x = 0;
        rx = w;
        ny = y + 1;
        for (; rx > 0; rx--)
        {
            if (w <= 3 && hh <= 3)
            {
                if (w == 3)
                    sub_08003F44(x, y, tt);
            }
            else if (((ry == hh) || (ry == 1)) && ((rx == w) || (rx == 1)))
            {
            }
            else
            {
                sub_08003F44(x, y, tt);
            }
            x++;
            {
                register struct Map *map asm("r0") = gMap;
                if (x >= map->width)
                    break;
            }
        }
        y = ny;
        {
            register struct Map *map asm("r0") = gMap;
            if (y >= map->height)
                break;
        }
    }
}
