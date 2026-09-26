#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800F8D4.
 * sub_0800F8D4 @ 0x0800F8D4
 */

#include "map.h"
/* Pipe/bridge piece consistency check: returns 1 when the tile at (x, y)
 * is one of the straight or corner pieces handled below and both of the
 * neighbours it connects to belong to a compatible tile family.
 *
 * The shape is load-bearing: an `else if` chain whose arms end
 * `if (FAMILY(n)) return 1;`, with one `return 0;` closing the function.
 * jump.c then cross-jumps every arm's `return 1` and the arms' identical
 * compare-chain tails into the last arm, which puts the ROM's
 * `movs r0,#1; b` block before the final `movs r0,#0`. `return FAMILY(n);`
 * builds a boolean the ROM lacks, and `goto yes` / per-arm `return 0` spellings
 * miss by +4 to +144 bytes. */
#define TILE_AT(px, py) (gMap->tile[gMap->rowOffset[(py)] + (px)])
#define LEFT_FAMILY(t) ((t) == 0x142 || (t) == 0x140 || (t) == 0x160 || \
                        (t) == 0x162 || (t) == 0x122 || (t) == 0x121 || (t) == 0x120)
#define RIGHT_FAMILY(t) ((t) == 0x141 || (t) == 0x142 || (t) == 0x161 || \
                         (t) == 0x162 || (t) == 0x122 || (t) == 0x121 || (t) == 0x120)
#define TOP_FAMILY(t) ((t) == 0x143 || (t) == 0x140 || (t) == 0x141 || \
                       (t) == 0x163 || (t) == 0x123 || (t) == 0x103 || (t) == 0x102)
#define BOTTOM_FAMILY(t) ((t) == 0x143 || (t) == 0x160 || (t) == 0x161 || \
                          (t) == 0x163 || (t) == 0x123 || (t) == 0x103 || (t) == 0x102)


int sub_0800F8D4(int x, int y)
{
    int tile = TILE_AT(x, y);
    u16 nearTile;

    if (!(tile == 0x142 || tile == 0x143 || tile == 0x140 || tile == 0x141 ||
          tile == 0x160 || tile == 0x161 || tile == 0x162 || tile == 0x163 ||
          tile == 0x122 || tile == 0x123 || tile == 0x121 || tile == 0x120 ||
          tile == 0x103 || tile == 0x102))
        return 0;

    if (tile == 0x142 || tile == 0x162)
    {
        if (x - 1 < 0 || x + 1 >= gMap->width)
            return 0;
        nearTile = TILE_AT(x - 1, y);
        if (!LEFT_FAMILY(nearTile))
            return 0;
        nearTile = TILE_AT(x + 1, y);
        if (RIGHT_FAMILY(nearTile))
            return 1;
    }
    else if (tile == 0x143 || tile == 0x163)
    {
        if (y - 1 < 0 || y + 1 >= gMap->height)
            return 0;
        nearTile = TILE_AT(x, y - 1);
        if (!TOP_FAMILY(nearTile))
            return 0;
        nearTile = TILE_AT(x, y + 1);
        if (BOTTOM_FAMILY(nearTile))
            return 1;
    }
    else if (tile == 0x161)
    {
        if (x - 1 < 0 || y - 1 < 0)
            return 0;
        nearTile = TILE_AT(x - 1, y);
        if (!LEFT_FAMILY(nearTile))
            return 0;
        nearTile = TILE_AT(x, y - 1);
        if (TOP_FAMILY(nearTile))
            return 1;
    }
    else if (tile == 0x141)
    {
        if (x - 1 < 0 || y + 1 >= gMap->height)
            return 0;
        nearTile = TILE_AT(x - 1, y);
        if (!LEFT_FAMILY(nearTile))
            return 0;
        nearTile = TILE_AT(x, y + 1);
        if (BOTTOM_FAMILY(nearTile))
            return 1;
    }
    else if (tile == 0x160)
    {
        if (x + 1 >= gMap->width || y - 1 < 0)
            return 0;
        nearTile = TILE_AT(x + 1, y);
        if (!RIGHT_FAMILY(nearTile))
            return 0;
        nearTile = TILE_AT(x, y - 1);
        if (TOP_FAMILY(nearTile))
            return 1;
    }
    else if (tile == 0x140)
    {
        if (x + 1 >= gMap->width || y + 1 >= gMap->height)
            return 0;
        nearTile = TILE_AT(x + 1, y);
        if (!RIGHT_FAMILY(nearTile))
            return 0;
        nearTile = TILE_AT(x, y + 1);
        if (BOTTOM_FAMILY(nearTile))
            return 1;
    }
    return 0;
}

#undef TILE_AT
#undef LEFT_FAMILY
#undef RIGHT_FAMILY
#undef TOP_FAMILY
#undef BOTTOM_FAMILY
