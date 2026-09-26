#include "global.h"

void sub_0805D438(void)
{
    if (gUnknown_030044D8 != 0)
        return;

    if (*gUnknown_030046B0 == 0)
    {
        gUnknown_03004780 = 1;
        return;
    }

    if (*gUnknown_030046B0 != 0x40)
    {
        gUnknown_03003F38 = *gUnknown_030046B0;
        gUnknown_030040D8 = (struct Unk030040D8 *)&gUnknown_08499594[gUnknown_03003F38];
        gUnknown_03004784 = gUnknown_085766E0[gUnknown_030040D8->unk00].unk04;

        if ((gUnknown_030040D8->unk01 & 1) || gUnknown_030040D8->unk00 == 0)
        {
            gUnknown_030046B0++;
            return;
        }

        gUnknown_03003F24.pos.unk00 = gUnknown_030040D8->unk02;
        gUnknown_03003F24.pos.unk02 = gUnknown_030040D8->unk03;

        gUnknown_030045CC.unk00_0 = 0;
        gUnknown_030045CC.unk00_1 = 0;

        gUnknown_030046C0.unk00 = 0;
        gUnknown_030046C0.unk13 = 0;
        gUnknown_030046C0.unk06 = 0;
        gUnknown_030046C0.unk07 = 0;

        gUnknown_08499590[0x12
            + *(u16 *)(gUnknown_08499590 + 0x417A + gUnknown_030040D8->unk03 * 2)
            + gUnknown_030040D8->unk02] = 0;

        gUnknown_030040D8->unk01 |= 4;
        gUnknown_030040D8->unk07[3] = sub_080129E0() % 100;
        sub_0805A95C();
    }
    else
    {
        gUnknown_030046C0.unk13 = 0;
    }

    if (sub_08071908(gUnknown_03004680) == 0)
    {
        if (*gUnknown_030046B0 != 0x40)
            sub_0805E9DC();

        gUnknown_030045CC.unk00_1 = 0;
        gUnknown_03004778();
    }

    if (gUnknown_030046C0.unk13 == 0)
    {
        if (*gUnknown_030046B0 != 0x40)
            gUnknown_08499590[0x12
                + *(u16 *)(gUnknown_08499590 + 0x417A + gUnknown_030040D8->unk03 * 2)
                + gUnknown_030040D8->unk02] = gUnknown_03003F38;

        gUnknown_030040D8->unk01 &= ~4;
        gUnknown_030046B0++;
    }
    else
    {
        gUnknown_030046B0++;
        gUnknown_03004780 = 3;
    }
}