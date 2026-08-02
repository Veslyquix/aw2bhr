#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08065F88.
 * sub_08065F88 @ 0x08065F88
 */

#include "hardware.h"

void sub_08065F88(void)
{
    u16 v;

    sub_08065C9C(gUnknown_08580934->unk08 * 2);
    sub_08065EB4();
    sub_08065EF4();

    v = gpKeySt->held & 2;

    if (v != 0)
    {
        sub_08063A30(sub_08063A3C(), gUnknown_08580D90);

        sub_08063A00(gUnknown_08580AF0, sub_08065F68);
        sub_08063A00(gUnknown_08580B90, sub_08065F68);
        sub_08063A00(gUnknown_08580BC8, sub_08065F68);

        sub_0803B4DC(0x66);
    }
    else if (gpKeySt->held & 1)
    {
        sub_0803B4DC(0x71);

        if (gUnknown_08580934->unk08 == 2)
        {
            gUnknown_08580934->unk30 = 0;
            gUnknown_08580934->unk26 = 2;
            sub_08063A00(gUnknown_08580AF0, sub_08065F78);
            sub_080654E8();
            sub_08064A44();
        }
        else
        {
            gUnknown_08580934->unk26 = 1;
            gUnknown_08580934->unk31 = 0;
            gUnknown_08580934->unk32 /= 2;
            sub_0806377C(gUnknown_08580AF0);
            sub_0806377C(gUnknown_08580B90);
            sub_0806377C(gUnknown_08580BC8);
        }
    }
}
