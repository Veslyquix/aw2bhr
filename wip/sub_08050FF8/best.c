#include "global.h"

struct Unk85D6A48Row /* 0x18 */
{
    /* 0x00 */ u16 unk00;
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u8 filler_06[0x02];
    /* 0x08 */ u16 unk08;
    /* 0x0a */ u8 filler_0a[0x0a];
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u8 filler_16[0x02];
};

void sub_08050FF8(void)
{
    struct OamData oam;
    u16 x;
    u16 y;

    sub_0801566C(gUnknown_03001FBC, (struct UnkVec *)&oam);

    gUnknown_02029906[gUnknown_0300453C]
                     [gUnknown_020298E0[gUnknown_0300453C].unk16 - 1] = 1;
    gUnknown_03001470[gUnknown_03001FBC].unk28 =
        gUnknown_020298E0[gUnknown_0300453C].unk16 - 1;
    gUnknown_03001470[gUnknown_03001FBC].unk2c = 0;
    gUnknown_03001470[gUnknown_03001FBC].unk30 = gUnknown_0300453C;
    gUnknown_03001470[gUnknown_03001FBC].unk34 = gUnknown_0300451C;

    oam.priority = gUnknown_08552394[(*(u32 *)&gUnknown_02029664 & 1)
                                     + ((*(u32 *)&gUnknown_02029664 >> 3) & 1)];
    oam.hFlip = gUnknown_0300453C;
    oam.paletteNum = 8;
    oam.tileNum = gUnknown_020298E0[gUnknown_0300453C ^ 1].unk00;

    sub_08015608(gUnknown_03001FBC, *(struct UnkVec *)&oam);

    if (((struct Unk85D6A48Row *)gUnknown_085D6A48)
            [gUnknown_03004580[gUnknown_0300453C][1]].unk04 == 0)
        gUnknown_02029906[gUnknown_0300453C][gUnknown_0300451C] = 1;
    else
        gUnknown_02029906[gUnknown_0300453C]
                         [gUnknown_08552148[gUnknown_0300453C]] = 1;

    if (gUnknown_03004580[gUnknown_0300453C ^ 1][2] == 1)
    {
        if (gUnknown_03004580[gUnknown_0300453C ^ 1][1] == 0xD)
            sub_0803B48C(gUnknown_085643A8.unk04
                [gUnknown_020298E0[gUnknown_0300453C].unk8c & 1]);
        else
            sub_0803B48C(((const s16 (*)[2])&gUnknown_085643A8)
                [gUnknown_03004580[gUnknown_0300453C ^ 1][2] - 1]
                [gUnknown_020298E0[gUnknown_0300453C].unk8c & 1]);
        gUnknown_020298E0[gUnknown_0300453C].unk8c++;
    }

    x = gUnknown_02029A10[gUnknown_0300453C].entries[gUnknown_0300451C].x
        + gUnknown_08553B58[gUnknown_0300453C]
        + gUnknown_08553B5C[((struct Unk85D6A48Row *)gUnknown_085D6A48)
              [gUnknown_03004580[gUnknown_0300453C][1]].unk08]
              [gUnknown_0300453C];
    y = gUnknown_02029A10[gUnknown_0300453C].entries[gUnknown_0300451C].y
        + gUnknown_08553BFC[gUnknown_020298E0[gUnknown_0300453C].unk18].unk04
        - 8;
    gUnknown_020298E0[gUnknown_0300453C].unk18++;
    if (gUnknown_020298E0[gUnknown_0300453C].unk18 == 3)
        gUnknown_020298E0[gUnknown_0300453C].unk18 = 0;

    sub_08050528(gUnknown_0300453C, gUnknown_03001FBC, x, y);
}
