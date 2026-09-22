#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08062560.
 * sub_08062560 @ 0x08062560
 */

void sub_08062560(u16 a1, u8 a2)
{
    struct Unk08499594 *e;
    int u;
    int x;
    int y;
    int off;

    gUnknown_03004480 = a1;
    for (u = (a1 - 1) * 0x40; u < (a1 - 1) * 0x40 + 0x40; u++) {
        e = &gUnits[u];
        if (e->unk00 == 0)
            continue;
        if ((gUnknown_085D5ABC[e->unk00].unk1c & a2) == 0)
            continue;
        if ((u8)(e->unk01 & 8) != 0)
            continue;
        if ((u8)sub_08062730((struct Unk08499594 *)gUnknown_030040D8, e) == 0)
            continue;
        if (e->unk00 == 0x18 && (u8)sub_080257C0(u) == 0)
            continue;
        if ((u8)sub_08020DBC(gUnknown_03004480, e->unk02, e->unk03) == 0)
            continue;
        if (GetUnitFiringRangeWithCoBonus(gUnknown_030033EC, e->unk00) == 1) {
            gUnknown_030013EC(e->unk02, e->unk03, e->unk00,
                              GetUnitMovementWithCoBonus(gUnknown_030033EC, e->unk00), -1);
            sub_0801FD9C(0x79);
        } else {
            gUnknown_030013EC(e->unk02, e->unk03, 0x10,
                              GetUnitFiringRangeWithCoBonus(gUnknown_030033EC, e->unk00), 0);
        }
        for (y = 0; y < gMap->height; y++) {
            for (x = 0; x < gMap->width; x++) {
                if ((s8)gUnknown_03003340[y][x] >= 0) {
                    off = gMap->rowOffset[y] + x;
                    gMap->dangerMask[off] |= gUnknown_085D5ABC[e->unk00].unk1c;
                }
            }
        }
    }
}
