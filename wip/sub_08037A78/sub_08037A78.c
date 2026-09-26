#include "global.h"
#include "map.h"

void sub_08037A78(int a1)
{
    int x;
    int y;
    u16 *dst;
    const u16 *src;
    u16 a;
    u16 b;
    const u16 *new_var;
    u16 c;
    u16 d;

    for (y = 0; y < gMap->height; y++)
    {
        x = 0;
        if (x < gMap->width)
        {
        new_var = gUnknown_0849D534;
        do
        {
            int unit = gMap->unit[gMap->rowOffset[y] + x];

            if (unit != 0)
            {
                src = (const u16 *)(gUnknown_080A0F38
                    + gUnknown_08582E74[gUnknown_030040F8[(unit >> 6) + 1] + 0x12] * 2);
                dst = (u16 *)a1 + gUnknown_03004010[x] + gUnknown_030032E0[y];
                a = new_var[0] & dst[0];
                dst[0] = a;
                b = gUnknown_0849D534[1] & dst[2];
                dst[2] = b;
                c = new_var[2] & dst[4];
                dst[4] = c;
                d = new_var[3] & dst[6];
                dst[6] = d;
                dst[0] = a | src[0];
                dst[2] = b | src[2];
                dst[4] = c | src[4];
                dst[6] = d | src[6];
            }
        } while (++x < gMap->width);
        }
    }
}
