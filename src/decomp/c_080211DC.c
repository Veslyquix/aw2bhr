#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080211DC.
 * sub_080211DC @ 0x080211DC
 */

void sub_080211DC(u8 a1, s8 a2)
{
    struct Unk08499594 *e;
    struct Map *map;
    int bonus;

    e = &gUnits[a1];
    bonus = 0;

    if (e->unk00 == 0)
        return;

    if ((e->unk01 & 6) == 2)
        return;

    if (e->unk00 <= 2)
    {
        map = gMap;

        if ((map->terrain[map->rowOffset[e->unk03] + e->unk02] & 0x1f) == 3)
            bonus = 3;
    }

    sub_080210C8(e->unk02, e->unk03,
                 bonus + GetUnitVisionWithCoBonus(((e - gUnits) >> 6) + 1, e->unk00),
                 gPlayers[(a1 >> 6) + 1].turnState,
                 a2, (a1 >> 6) + 1);
}
