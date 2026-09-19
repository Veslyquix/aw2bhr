#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080258CC.
 * sub_080258CC @ 0x080258CC
 */

/* The gUnknown_08499590 map header seen through the members this function
 * touches: the pixel origin / tile camera pairs at +0x04..+0x0e and THREE byte
 * planes (+0x12, +0x51a, +0x1e42) addressed through the +0x417a row table.
 * Declared LOCALLY and cast onto the `u8 *` symbol, per the rule in
 * include/unknown-globals.h -- only a COMPONENT_REF keeps agbcc from folding
 * the plane constant into a load displacement.  Wave 56, W56-H. */
#define MAP gMap

void sub_080258CC(void)
{
    int i;
    int j;
    int id;
    u8 c;

    MAP->camX = MAP->scrollX / 16;
    MAP->camY = MAP->scrollY / 16;
    MAP->unk08 = MAP->scrollX;
    MAP->unk0a = MAP->scrollY;
    sub_08023860();
    sub_080213AC();

    for (i = 0; i < MAP->height; i++)
    {
        for (j = 0; j < MAP->width; j++)
        {
            gMap->unit[MAP->rowOffset[i] + j] = 0;
            MAP->unitUnk[MAP->rowOffset[i] + j] = 0;
        }
    }

    for (id = 1; id <= 0xFF; id++)
    {
        if (gUnknown_08499594[id].unk00 == 0)
            continue;
        if ((gUnknown_08499594[id].unk01 & 6) == 2)
            continue;
        c = MAP->unitUnk[MAP->rowOffset[gUnknown_08499594[id].unk03]
                         + gUnknown_08499594[id].unk02];
        if (c != 0)
        {
            if ((gUnknown_08499594[c].unk01 & 4) == 0)
                continue;
        }
        MAP->unitUnk[MAP->rowOffset[gUnknown_08499594[id].unk03]
                     + gUnknown_08499594[id].unk02] = id;
        if (gUnknown_08499594[id].unk01 & 2)
            continue;
        if (gUnknown_08499598[gUnknown_030033EC].unk1b != 2)
        {
            if (MAP->visible[MAP->rowOffset[gUnknown_08499594[id].unk03]
                             + gUnknown_08499594[id].unk02] == 0)
                continue;
        }
        gMap->unit[MAP->rowOffset[gUnknown_08499594[id].unk03]
                     + gUnknown_08499594[id].unk02] = id;
    }

    for (id = 1; id <= 0xFF; id++)
    {
        if (gUnknown_08499594[id].unk00 == 0)
            continue;
        if ((u8)(gUnknown_08499594[id].unk01 & 2) != 0)
            continue;
        if (gUnknown_08499598[gUnknown_030033EC].unk1b == 2)
            continue;
        if (sub_0802571C(id))
        {
            if (MAP->visible[MAP->rowOffset[gUnknown_08499594[id].unk03]
                             + gUnknown_08499594[id].unk02] != 0)
                continue;
        }
        gMap->unit[MAP->rowOffset[gUnknown_08499594[id].unk03]
                     + gUnknown_08499594[id].unk02] = 0;
    }

    sub_08021D10();
    sub_08022580();
    sub_080227A8();
}
