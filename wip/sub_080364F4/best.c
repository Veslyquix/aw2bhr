#include "global.h"

/* Reseed gPlaySt's per-slot arrays from the chapter record
 * gUnknown_085C77A0[unk02], then start whichever proc-list script that record
 * names.
 *
 * The switch operand is int, not the u8 member: the dispatch tree's `blt` is
 * SIGNED, which a zero-extended byte's range cannot produce.
 *
 * The +0x44 run is read as FOUR CONSECUTIVE BYTES (`base + unk02*0x5c + i`,
 * i unscaled, `ldrb`), i.e. a third array parallel to unk3c and unk40 -- not
 * `unk44[i].unk00`, which would scale the index by 4. That contradicts the
 * wave-41 `struct Unk085C77A0Slot unk44[5]` declaration, so this file reads it
 * through a cast rather than reshaping a member two other functions already
 * use. Recorded, not fixed.
 */
void sub_080364F4(void)
{
    int mode;
    u8 i;

    sub_080191B0();

    mode = gPlaySt.gameMode;

    switch (mode)
    {
    case 1:
    case 2:
        for (i = 0; i < 4; i++)
        {
            gPlaySt.unk42[i + 1] =
                ((const u8 *)&gUnknown_085C77A0[gPlaySt.mapID].unk44)[i];
            gPlaySt.armyColor[i + 1] =
                gUnknown_085C77A0[gPlaySt.mapID].unk40[i];

            if (gUnknown_085C77A0[gPlaySt.mapID].unk3c[i] == 0xff
                && i + 1 <= 3)
                gPlaySt.co[i + 1] = gUnknown_030058D4[i];
            else
                gPlaySt.co[i + 1] =
                    gUnknown_085C77A0[gPlaySt.mapID].unk3c[i];
        }
        break;

    case 0:
        for (i = 0; i < 4; i++)
            gPlaySt.co[i + 1] =
                gUnknown_085C77A0[gPlaySt.mapID].unk3c[i];
        break;
    }

    if (gUnknown_085C77A0[gPlaySt.mapID].hardcodedUnits != NULL
        && gUnknown_085C77A0[gPlaySt.mapID].category <= 2)
        sub_080193B0(gUnknown_085C77A0[gPlaySt.mapID].hardcodedUnits);
    else
        sub_080364E0();
}
