#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806D688.
 * sub_0806D688 @ 0x0806D688
 */

struct Unk6D688
{
    /* 0x00 */ u8 filler_00[0x24];
    /* 0x24 */ int unk24;
    /* 0x28 */ int unk28;
    /* 0x2c */ int unk2c;
    /* 0x30 */ u8 filler_30[0x0c];
    /* 0x3c */ const u16 *unk3c;
    /* 0x40 */ u8 filler_40[0x04];
    /* 0x44 */ s16 unk44;
};

void sub_0806D688(struct Unk6D688 *p)
{
    int x;
    int y;

    if (p->unk2c != gUnknown_08580934->unk30)
    {
        if (gUnknown_08580934->unk30 == 0)
            p->unk3c = gUnknown_08581F12;
        else
            p->unk3c = gUnknown_08581F04;

        p->unk44 = 0xe;
    }

    if (gUnknown_08580934->unk30 == 0)
        x = gUnknown_08581F20[p->unk44];
    else
        x = 0xc0 - gUnknown_08581F20[p->unk44];

    p->unk24 = x;
    y = (0xc0 - x) / 16 + 0x14;
    p->unk28 = y;

    if (p->unk3c == gUnknown_08581F12)
        sub_0801F34C(0x8c, x & 0x1ff, y & 0xff, 0, 1);
    else
        sub_0801F34C(0x8d, x & 0x1ff, y & 0xff, 0, 1);

    p->unk2c = gUnknown_08580934->unk30;

    if (p->unk44 != 0)
        p->unk44--;
}
