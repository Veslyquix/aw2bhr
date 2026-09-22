#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800B528.
 * sub_0800B528 @ 0x0800B528
 */

#define MAP gMap

int sub_0800B528(int x, int y)
{
    int n;

    if (MAP->terrain[MAP->rowOffset[y] + x] == 0x13 || sub_080094EC(x, y))
        return -1;

    n = 0;

    if (y > 1)
        n = IsTerrainLand(x, y - 1);

    if (y < MAP->height - 1)
        n += IsTerrainLand(x, y + 1);

    if (x > 0)
        n += IsTerrainLand(x - 1, y);

    if (x < MAP->width - 1)
        n += IsTerrainLand(x + 1, y);

    if (n == 4)
        n = -1;

    return n;
}
