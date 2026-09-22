#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003ED0.
 * FixAllShorelines @ 0x08003ED0
 */

/* MATCHED, wave 40 (W40-A). Redraws every cell of the map: for each row, for
 * each column, hand FixShorelineAt the cell's terrain byte off the +0x1432 array,
 * indexed the way every other reader in this block indexes it -- through the
 * +0x417A row-offset table. */

#define MAP gMap

void FixAllShorelines(void)
{
    int x, y;

    for (y = 0; y < MAP->height; y++)
        for (x = 0; x < MAP->width; x++)
            FixShorelineAt(x, y, MAP->terrain[MAP->rowOffset[y] + x]);
}

asm(".global sub_08003ED0\n.thumb_set sub_08003ED0, FixAllShorelines\n");
