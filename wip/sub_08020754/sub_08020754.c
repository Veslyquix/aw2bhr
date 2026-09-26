#include "global.h"
#include "map.h"

void sub_08020754(u8 *out)
{
    int y;
    int x;

    for (y = 0; y < gMap->height; y++)
    {
        for (x = 0; x < gMap->width; x++)
        {
            int t = gMap->terrain[gMap->rowOffset[y] + x] & 0x1f;
            int u;

            if (t == 4 || t == 0x13)
            {
                u = gMap->unitUnk[gMap->rowOffset[y] + x];
                if (u == 0 || (u8)(gUnknown_08499594[u].type - 0x10) > 4)
                    goto zero;
            }
            out[gMap->rowOffset[y] + x] = 1;
            continue;
zero:
            out[gMap->rowOffset[y] + x] = 0;
        }
    }
}
