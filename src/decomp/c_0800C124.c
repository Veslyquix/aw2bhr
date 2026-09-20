#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800C124.
 * sub_0800C124 @ 0x0800C124
 */

/* Exact configured match. Repaints the cell at (x, y) after a change: if it is
 * a road tile, record its tile in gActiveMap->unk20 and repaint; else
 * switch on its terrain byte. All map reads go straight through
 * gMap->tile[] / gMap->terrain[] / gMap->rowOffset[]; `q` is bound once in the
 * true arm. */
void sub_0800C124(int x, int y)
{
    struct ActiveMap *q;

    if (sub_0800164C(x, y))
    {
        if (sub_08008C34(x, y))
            return;
        if (sub_0800C840(x, y))
            sub_0800C608(x, y);
        q = gActiveMap;
        q->unk20 = gMap->tile[gMap->rowOffset[y] + x];
        sub_0800EC20(x, y);
        sub_08001158(x, y, 0x2A);
        sub_080011F4(x, y, 7);
        sub_08007F9C(x, y);
    }
    else
    {
        switch (gMap->terrain[gMap->rowOffset[y] + x])
        {
        case TERRAIN_SEA:
            sub_08007CA0(x, y);
            if (gMap->tile[gMap->rowOffset[y] + x] != 0x2A)
            {
                sub_08001158(x, y, 0x2A);
                sub_080011F4(x, y, 7);
            }
            break;

        case TERRAIN_SHOAL:
            break;

        case TERRAIN_REEF:
            break;
        }
    }
    sub_08008BB8(x, y);
}
