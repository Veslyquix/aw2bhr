#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08008BB8.
 * sub_08008BB8 @ 0x08008BB8
 *
 * Named per aw2bhr-main's src/design.c/design.h ("EnsureValidTile"), called
 * from SetTerrainAt (src/decomp/c_080011F4.c) whenever a cell is set to
 * TERRAIN_SEA. The old sub_XXXXXXXX symbol is kept as a linker alias below
 * so every other unit keeps resolving it unchanged.
 */

void EnsureValidTile(int x, int y)
{
    int v;

    v = sub_08008B70(x, y);

    if (v > 0)
    {
        s8 *costs;
        int idx;
        int c;

        /* WAVE 37 final sweep: `.unk18` was `s8 *` when this function was
         * verified; W37-H later widened it to `s8 *[3]`. Element 0 is at the
         * same offset, so `[0]` is byte-identical to the spelling that matched. */
        costs = gUnknown_085D3DD0[1].power[0].movementChart[0];

        idx = gMap->rowOffset[y] + x;
        c = (gMap->terrain[idx] & 0x1f) + gUnknown_085D5ABC[v & 0x3f].movementType * 32;

        if (costs[c] == -1)
            sub_08008A8C(0, x, y);
    }
}

asm(".global sub_08008BB8\n.thumb_set sub_08008BB8, EnsureValidTile\n");
