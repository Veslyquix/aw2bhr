#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08009720.
 * sub_08009720 @ 0x08009720
 */

int sub_08009720(int x, int y)
{
    int idx;
    int terrain;
    int r = 0;

    idx = gMap->rowOffset[y] + x;
    terrain = gMap->terrain[idx];

    switch (terrain)
    {
    case TERRAIN_SEA:
    case TERRAIN_SHOAL:
    case TERRAIN_REEF:
        r = 1;
        break;
    case TERRAIN_RIVER:
        r = sub_080094EC(x, y);
        break;
    }

    return r;
}
