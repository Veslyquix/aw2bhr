#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800EC20.
 * sub_0800EC20 @ 0x0800EC20
 */

/* sub_0800EC20 -- MATCHED.  Autotile fixup: on the tile at (x, y), look at
 * the neighbour named by gActiveMap->cursorTerrain and repaint the corner it
 * shares with this one.  `col` must stay its own statement: folded into the
 * index, gcse/PRE hoists the `- 1` and reassociates it into
 * `rowval + (x - 1)`, which steals x's low register. */
void sub_0800EC20(int x, int y)
{
    int col;
    int tile;

    switch (gActiveMap->cursorTerrain)
    {
    case 70:
        sub_0800EBFC(x - 1, y - 1, 0x87);
        sub_0800EBFC(x, y - 1, 0x87);
        sub_0800EBFC(x + 1, y - 1, 0x87);
        sub_0800EBFC(x - 1, y, 0x87);
        sub_0800EBFC(x + 1, y, 0x87);
        sub_0800EBFC(x - 1, y + 1, 0x87);
        sub_0800EBFC(x, y + 1, 0x87);
        sub_0800EBFC(x + 1, y + 1, 0x87);
        break;

    case 103:
        col = gMap->rowOffset[y - 1] - 1;
        tile = gMap->tile[col + x];
        if (tile == 70)
        {
            sub_0800EBFC(x - 2, y - 2, 0x25);
            MakeTileSimple(x - 1, y - 2, 0x27);
            sub_0800EBFC(x, y - 2, 0x87);
            sub_0800EBFC(x - 2, y - 1, 0x65);
            MakeTileSimple(x - 1, y - 1, 0x67);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x - 2, y, 0x87);
            sub_0800EBFC(x - 1, y, 0x87);
        }
        else if (tile == 68 || tile == 69)
        {
            sub_0800EBFC(x - 1, y - 2, 0x25);
            MakeTileSimple(x, y - 2, 0x27);
            sub_0800EBFC(x - 1, y - 1, 0x65);
            MakeTileSimple(x, y - 1, 0x67);
            sub_0800EBFC(x - 1, y, 0x87);
        }
        else if (tile == 36 || tile == 37)
        {
            sub_0800EBFC(x - 1, y - 1, 0x87);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x - 1, y, 0x87);
        }
        break;

    case 100:
    case 101:
        col = gMap->rowOffset[y - 1] + 1;
        tile = gMap->tile[col + x];
        if (tile == 70)
        {
            sub_0800EBFC(x, y - 2, 0x87);
            sub_0800EBFC(x + 1, y - 2, 0x25);
            MakeTileSimple(x + 2, y - 2, 0x27);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x + 1, y - 1, 0x65);
            MakeTileSimple(x + 2, y - 1, 0x67);
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x + 2, y, 0x87);
        }
        else if (tile == 71)
        {
            sub_0800EBFC(x, y - 2, 0x25);
            MakeTileSimple(x + 1, y - 2, 0x27);
            sub_0800EBFC(x, y - 1, 0x65);
            MakeTileSimple(x + 1, y - 1, 0x67);
            sub_0800EBFC(x + 1, y, 0x87);
        }
        else if (tile == 39)
        {
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x + 1, y - 1, 0x87);
            sub_0800EBFC(x + 1, y, 0x87);
        }
        break;

    case 39:
        col = gMap->rowOffset[y + 1] - 1;
        tile = gMap->tile[col + x];
        if (tile == 70)
        {
            MakeTileSimple(x - 1, y, 0x27);
            MakeTileSimple(x - 1, y + 1, 0x67);
            sub_0800EBFC(x - 2, y + 1, 0x65);
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x, y + 2, 0x87);
            sub_0800EBFC(x - 2, y + 2, 0x87);
            sub_0800EBFC(x - 1, y + 2, 0x87);
        }
        else if (tile == 100 || tile == 101)
        {
            sub_0800EBFC(x - 1, y, 0x87);
            sub_0800EBFC(x - 1, y + 1, 0x87);
            sub_0800EBFC(x, y + 1, 0x87);
        }
        break;

    case 36:
    case 37:
        col = gMap->rowOffset[y + 1] + 1;
        tile = gMap->tile[col + x];
        if (tile == 103)
        {
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x + 1, y + 1, 0x87);
        }
        else if (tile == 71)
        {
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x, y + 1, 0x25);
            MakeTileSimple(x + 1, y + 1, 0x27);
        }
        else if (tile == 70)
        {
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x, y + 2, 0x87);
            sub_0800EBFC(x + 1, y, 0x25);
            sub_0800EBFC(x + 1, y + 1, 0x65);
            sub_0800EBFC(x + 1, y + 2, 0x87);
            MakeTileSimple(x + 2, y + 1, 0x67);
            sub_0800EBFC(x + 2, y + 2, 0x87);
        }
        break;

    case 68:
    case 69:
        col = gMap->rowOffset[y] + 1;
        tile = gMap->tile[col + x];
        if (tile == 70)
        {
            sub_0800EBFC(x + 1, y - 1, 0x25);
            sub_0800EBFC(x + 1, y, 0x65);
            MakeTileSimple(x + 2, y, 0x67);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x + 1, y + 1, 0x87);
            sub_0800EBFC(x + 2, y + 1, 0x87);
        }
        break;

    case 71:
        col = gMap->rowOffset[y] - 1;
        tile = gMap->tile[col + x];
        if (tile == 70)
        {
            MakeTileSimple(x - 1, y - 1, 0x27);
            MakeTileSimple(x - 1, y, 0x67);
            sub_0800EBFC(x - 2, y, 0x65);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x - 1, y + 1, 0x87);
            sub_0800EBFC(x - 2, y + 1, 0x87);
        }
        break;

    case 102:
        tile = gMap->tile[gMap->rowOffset[y - 1] + x];
        if (tile == 70)
        {
            MakeTileSimple(x, y - 2, 0x27);
            MakeTileSimple(x, y - 1, 0x67);
            sub_0800EBFC(x - 1, y - 1, 0x65);
            sub_0800EBFC(x - 1, y, 0x87);
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x + 1, y - 1, 0x87);
            sub_0800EBFC(x + 1, y - 2, 0x87);
        }
        break;

    case 38:
        tile = gMap->tile[gMap->rowOffset[y + 1] + x];
        if (tile == 70)
        {
            sub_0800EBFC(x - 1, y + 1, 0x25);
            MakeTileSimple(x, y + 1, 0x27);
            MakeTileSimple(x, y + 2, 0x67);
            sub_0800EBFC(x - 1, y, 0x87);
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x + 1, y + 1, 0x87);
            sub_0800EBFC(x + 1, y + 2, 0x87);
        }
        break;
    }

    RepaintTileRight(x, y);
}
