#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080258CC.
 * sub_080258CC @ 0x080258CC
 */

void sub_080258CC(void)
{
    int i;
    int j;
    int id;
    u8 c;

    gMap->camX = gMap->scrollX / 16;
    gMap->camY = gMap->scrollY / 16;
    gMap->unk08 = gMap->scrollX;
    gMap->unk0a = gMap->scrollY;
    sub_08023860();
    sub_080213AC();

    for (i = 0; i < gMap->height; i++)
    {
        for (j = 0; j < gMap->width; j++)
        {
            gMap->unit[gMap->rowOffset[i] + j] = 0;
            gMap->unitUnk[gMap->rowOffset[i] + j] = 0;
        }
    }

    for (id = 1; id <= 0xFF; id++)
    {
        if (gUnits[id].unk00 == 0)
            continue;
        if ((gUnits[id].unk01 & 6) == 2)
            continue;
        c = gMap->unitUnk[gMap->rowOffset[gUnits[id].unk03]
                          + gUnits[id].unk02];
        if (c != 0)
        {
            if ((gUnits[c].unk01 & 4) == 0)
                continue;
        }
        gMap->unitUnk[gMap->rowOffset[gUnits[id].unk03]
                      + gUnits[id].unk02] = id;
        if (gUnits[id].unk01 & 2)
            continue;
        if (gPlayers[gUnknown_030033EC].aiControlled != 2)
        {
            if (gMap->visible[gMap->rowOffset[gUnits[id].unk03]
                              + gUnits[id].unk02] == 0)
                continue;
        }
        gMap->unit[gMap->rowOffset[gUnits[id].unk03]
                   + gUnits[id].unk02] = id;
    }

    for (id = 1; id <= 0xFF; id++)
    {
        if (gUnits[id].unk00 == 0)
            continue;
        if ((u8)(gUnits[id].unk01 & 2) != 0)
            continue;
        if (gPlayers[gUnknown_030033EC].aiControlled == 2)
            continue;
        if (sub_0802571C(id))
        {
            if (gMap->visible[gMap->rowOffset[gUnits[id].unk03]
                              + gUnits[id].unk02] != 0)
                continue;
        }
        gMap->unit[gMap->rowOffset[gUnits[id].unk03]
                   + gUnits[id].unk02] = 0;
    }

    sub_08021D10();
    sub_08022580();
    sub_080227A8();
}
