#include "global.h"

void sub_0804E7A8(void)
{
    struct Unk02029A10 *entry;
    u16 *p1, *p2, *row;
    u16 c, e, t, w;
    s16 x, y;

    c = gUnknown_03001470[gUnknown_03001FBC].unk30;
    e = gUnknown_03001470[gUnknown_03001FBC].unk34;
    t = sub_080156C4(gUnknown_03001FBC);
    sub_08056E9C(c, e);
    w = sub_0804BDD8(c, e, gUnknown_03001FBC);
    p1 = gUnknown_084C3F70[c];
    p2 = gUnknown_084C3F78[c];
    if (t == 0x1C)
    {
        sub_0803B48C(gUnknown_085D6C88[gUnknown_03004580[c][1]]
                                      .unk0c[gUnknown_03004580[c][2] - 1]
                                      [gUnknown_020296B0[c].unk1a & 1]);
        gUnknown_020296B0[c].unk1a++;
    }
    entry = (struct Unk02029A10 *)(e * sizeof(struct Unk02029A10)
                                   + c * sizeof(struct Unk02029A10Group)
                                   + (u8 *)gUnknown_02029A10);
    entry->x += gUnknown_08553B28[c][w];
    entry->y -= gUnknown_085644D4[(row = gUnknown_02028E5C[c])[1]];
    x = entry->x - *p1;
    y = entry->y - *p2;
    sub_080155C0(gUnknown_03001FBC, x, y);
}
