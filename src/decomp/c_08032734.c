#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08032734.
 * sub_08032734 @ 0x08032734, sub_08032788 @ 0x08032788, sub_080327FC @ 0x080327FC, sub_08032850 @ 0x08032850
 */

#include "proc.h"

void sub_08032734(void)
{
    gUnknown_0849B060->unk0a = 15;

    if (gUnknown_0849B060->unk10 == 1)
        gUnknown_0849B060->unk0e = -gUnknown_0849B650[gUnknown_0849B060->unk0a];

    if (gUnknown_0849B060->unk10 == 2)
        gUnknown_0849B060->unk0e = gUnknown_0849B650[gUnknown_0849B060->unk0a];

    gUnknown_03002F18 = 0xFFD4;
    gUnknown_03002B34 = gUnknown_0849B060->unk0e - 0x60;
}

void sub_08032788(ProcPtr proc)
{
    gUnknown_0849B060->unk0a--;

    if (gUnknown_0849B060->unk10 == 1)
        gUnknown_0849B060->unk0e = -gUnknown_0849B650[gUnknown_0849B060->unk0a];

    if (gUnknown_0849B060->unk10 == 2)
        gUnknown_0849B060->unk0e = gUnknown_0849B650[gUnknown_0849B060->unk0a];

    gUnknown_03002F18 = 0xFFD4;
    gUnknown_03002B34 = gUnknown_0849B060->unk0e - 0x60;

    if (gUnknown_0849B060->unk0a == 0)
    {
        sub_0803B4DC(0x76);
        Proc_Break(proc);
    }
}

void sub_080327FC(void)
{
    gUnknown_0849B060->unk0a = 0;

    if (gUnknown_0849B060->unk10 == 1)
        gUnknown_0849B060->unk0e = gUnknown_0849B650[gUnknown_0849B060->unk0a];

    if (gUnknown_0849B060->unk10 == 2)
        gUnknown_0849B060->unk0e = -gUnknown_0849B650[gUnknown_0849B060->unk0a];

    gUnknown_03002F18 = 0xFFD4;
    gUnknown_03002B34 = gUnknown_0849B060->unk0e - 0x60;
}

void sub_08032850(ProcPtr proc)
{
    gUnknown_0849B060->unk0a++;

    if (gUnknown_0849B060->unk10 == 1)
        gUnknown_0849B060->unk0e = gUnknown_0849B650[gUnknown_0849B060->unk0a];

    if (gUnknown_0849B060->unk10 == 2)
        gUnknown_0849B060->unk0e = -gUnknown_0849B650[gUnknown_0849B060->unk0a];

    gUnknown_03002F18 = 0xFFD4;
    gUnknown_03002B34 = gUnknown_0849B060->unk0e - 0x60;

    if (gUnknown_0849B060->unk0a == 0xf)
        Proc_Break(proc);
}
