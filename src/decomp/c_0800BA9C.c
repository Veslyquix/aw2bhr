#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800BA9C.
 * sub_0800BA9C @ 0x0800BA9C, sub_0800BB2C @ 0x0800BB2C
 */

#define MAP gMap

int sub_0800BA9C(int x, int y)
{
    int t;
    int v;

    if (sub_0800B528(x, y) < 0)
        return 0;

    MakeSeaSafest(x, y);
    t = MAP->terrain[MAP->rowOffset[y] + x];
    SetTerrainAt(x, y, 0xd);

    v = sub_0800B61C(x, y);

    if (v < 0)
    {
        SetTerrainAt(x, y, t);
        return 0;
    }

    MakeTileSimple(x, y, v);

    if (IsTerrainAtCoordsType(x, y, 7) == 0)
        sub_0800BB2C(x, y);

    return 1;
}

void sub_0800BB2C(int x, int y)
{
    int k = 0x2a;

    if (y > 0)
    {
        int n = y - 1;
        if (sub_0800B4F0(x, n))
        {
            int v = sub_0800B61C(x, n);
            if (v < 0)
            {
                SetTerrainAt(x, n, 7);
                MakeTileSimple(x, n, k);
            }
            else
                MakeTileSimple(x, n, v);
        }
    }

    if (x > 0)
    {
        int n = x - 1;
        if (sub_0800B4F0(n, y))
        {
            int v = sub_0800B61C(n, y);
            if (v < 0)
            {
                SetTerrainAt(n, y, 7);
                MakeTileSimple(n, y, k);
            }
            else
                MakeTileSimple(n, y, v);
        }
    }

    if (x < MAP->width - 1)
    {
        int n = x + 1;
        if (sub_0800B4F0(n, y))
        {
            int v = sub_0800B61C(n, y);
            if (v < 0)
            {
                SetTerrainAt(n, y, 7);
                MakeTileSimple(n, y, k);
            }
            else
                MakeTileSimple(n, y, v);
        }
    }

    if (y < MAP->height - 1)
    {
        int n = y + 1;
        if (sub_0800B4F0(x, n))
        {
            int v = sub_0800B61C(x, n);
            if (v < 0)
            {
                SetTerrainAt(x, n, 7);
                MakeTileSimple(x, n, k);
            }
            else
                MakeTileSimple(x, n, v);
        }
    }
}
