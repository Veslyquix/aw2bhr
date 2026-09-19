#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08023EEC.
 * sub_08023EEC @ 0x08023EEC
 */

void sub_08023EEC(void)
{
    if ((gMap->unk04 < (s16)gMap->unk08
      && (gMap->unk04 >> 4) != ((s16)gMap->unk08 >> 4))
     || (gMap->unk04 > (s16)gMap->unk08
      && (gMap->unk04 >> 4) != (((s16)gMap->unk08 - 1) >> 4)))
    {
        if (gMap->unk04 < (s16)gMap->unk08)
            sub_08023DCC((gMap->unk04 >> 4) - gMap->camX,
                         (gMap->unk06 >> 4) - gMap->camY,
                         gMap->unk04 >> 4,
                         gMap->unk06 >> 4);
        else
            sub_08023E14(((gMap->unk04 >> 4) + 0xf) - gMap->camX,
                         (gMap->unk06 >> 4) - gMap->camY,
                         (gMap->unk04 >> 4) + 0xf,
                         gMap->unk06 >> 4);

        sub_08013AFC();
        sub_08013B0C();
        sub_08013B1C();

        if (gUnknown_03000559 == 1)
            sub_08013AEC();
    }

    if ((gMap->unk06 < (s16)gMap->unk0a
      && (gMap->unk06 >> 4) != ((s16)gMap->unk0a >> 4))
     || (gMap->unk06 > (s16)gMap->unk0a
      && (gMap->unk06 >> 4) != (((s16)gMap->unk0a - 1) >> 4)))
    {
        if (gMap->unk06 < (s16)gMap->unk0a)
            sub_08023E5C((gMap->unk04 >> 4) - gMap->camX,
                         (gMap->unk06 >> 4) - gMap->camY,
                         gMap->unk04 >> 4,
                         gMap->unk06 >> 4);
        else
            sub_08023EA4((gMap->unk04 >> 4) - gMap->camX,
                         ((gMap->unk06 >> 4) + 0xa) - gMap->camY,
                         gMap->unk04 >> 4,
                         (gMap->unk06 >> 4) + 0xa);

        sub_08013AFC();
        sub_08013B0C();
        sub_08013B1C();

        if (gUnknown_03000559 == 1)
            sub_08013AEC();
    }

    gMap->unk08 = gMap->unk04;
    gMap->unk0a = gMap->unk06;
}
