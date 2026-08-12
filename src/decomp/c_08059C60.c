#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08059C60.
 * sub_08059C60 @ 0x08059C60
 */

struct Unk59C60Cell
{
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ s16 v;
};

void sub_08059C60(void *a1)
{
    struct Unk59C60Cell *out;
    struct Unk08499594 *p;
    int i;
    int j;
    int k;
    int x;
    int y;
    u16 z;

    out = a1;
    k = (gUnknown_03003F38 >> 6) + 1;
    for (i = 0; i < 4; i++)
    {
        if (!((gUnknown_08499598[gUnknown_030033EC].unk2c >> i) & 1))
            continue;
        for (j = i * 64; j < i * 64 + 64; j++)
        {
            p = &gUnknown_08499594[j];
            if (p->unk00 == 0)
                continue;
            if ((s8)gUnknown_03003340[p->unk03][p->unk02] <= 0)
                continue;
            if (p->unk00 == 0x18 && !sub_080257C0(j))
                continue;
            if (!sub_08020DBC(gUnknown_030033EC, p->unk02, p->unk03))
                continue;
            x = sub_08043070(gUnknown_08499598[k].unk1d, gUnknown_08499598[k].unk1e,
                             gUnknown_030040D8->unk00, p->unk00, 0);
            y = sub_08043070(gUnknown_08499598[k].unk1d, gUnknown_08499598[k].unk1e,
                             gUnknown_030040D8->unk00, p->unk00, 1);
            if (x < y)
                z = sub_08043070(gUnknown_08499598[k].unk1d, gUnknown_08499598[k].unk1e,
                                 gUnknown_030040D8->unk00, p->unk00, 1);
            else
                z = sub_08043070(gUnknown_08499598[k].unk1d, gUnknown_08499598[k].unk1e,
                                 gUnknown_030040D8->unk00, p->unk00, 0);
            if (z <= 0x31)
                continue;
            out->x = p->unk02;
            out->y = p->unk03;
            out->v = (s8)gUnknown_03003340[p->unk03][p->unk02];
            out++;
        }
    }
    out->v = 0xffff;
}
