#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803ABDC.
 * sub_0803ABDC @ 0x0803ABDC
 */

#include "hardware.h"
struct Unk0803ABDC
{
    /* 0x00 */ u8 filler_00[0x1e];
    /* 0x1e */ s16 unk1e;
};

void sub_0803ABDC(struct Unk0803ABDC *p)
{
    int i;

    i = sub_0803CBD8(p->unk1e);
    if (i > 0)
        i = 1;
    sub_080119A0(0, 0, gUnknown_08090F94);
    sub_080119A0(0, 8, gUnknown_08090FA4);
    sub_0802BD54(0x28, 8, p->unk1e);
    sub_080119A0(0x38, 8, gUnknown_0849E5F8[i]);
    if ((gpKeySt->held & 3) != 0)
    {
        sub_08016E14();
        sub_08015C30(gUnknown_03001FBC);
    }
    else if ((gpKeySt->held & 0x20) != 0)
        sub_0803CA00(p->unk1e, 0);
    else if ((gpKeySt->held & 0x10) != 0)
        sub_0803CA00(p->unk1e, 1);
    else
    {
        if ((gpKeySt->unk02 & 0x40) != 0 && p->unk1e > 0x20)
            p->unk1e--;
        if ((gpKeySt->unk02 & 0x80) != 0 && p->unk1e <= 0x5e)
            p->unk1e++;
    }
}
