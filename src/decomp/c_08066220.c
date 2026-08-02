#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08066220.
 * sub_08066220 @ 0x08066220
 */

#include "hardware.h"

void sub_08066220(void)
{
    u16 v;

    sub_08065C9C(gUnknown_08580934->unk08);
    sub_080660BC(gpKeySt->unk02, gUnknown_08580934->unk32, 1);
    sub_08066078();

    if (gUnknown_08580934->unk08 == 2)
    {
        if (gUnknown_08580934->unk31 == 1)
            gpKeySt->held = 2;
        else
            gpKeySt->held = 1;
    }

    v = gpKeySt->held & 2;

    if (v != 0)
    {
        gUnknown_08580934->unk26 = 0;
        gUnknown_08580934->unk32 *= 2;

        sub_08063A00(gUnknown_08580AF0, sub_08066200);
        sub_08063A00(gUnknown_08580B90, sub_08066200);
        sub_08063A00(gUnknown_08580BC8, sub_08066200);
        sub_08063A00(gUnknown_08580A38, sub_08066210);
        sub_08063A00(gUnknown_08580A08, sub_08066210);

        sub_0803B4DC(0x66);
    }
    else if (gpKeySt->held & 1)
    {
        sub_080654E8();
        sub_08064A44();
        gUnknown_08580934->unk30 = 0;
        sub_0803B4DC(0x71);
    }
}
