#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08033030.
 * sub_08033030 @ 0x08033030, sub_080330C0 @ 0x080330C0
 */

#include "proc.h"
#include "hardware.h"

void sub_08033030(ProcPtr proc)
{
    u8 v[0x34];

    if (gpKeySt->held & 2)
        sub_0803B4DC(0x68);

    if ((gpKeySt->held & 9)
     && Proc_Find(gUnknown_0849B688) == NULL
     && Proc_Find(gUnknown_0849B670) == NULL)
    {
        if (gUnknown_0849B060->unk09 == gUnknown_0849B018->unk06
         || sub_0803CCB8((u8)gUnknown_0849B060->unk04, v) != 1)
        {
            sub_0803BD54();
            Proc_Goto(proc, 0xb);
        }
        else
        {
            Proc_Break(proc);
        }
    }
}

void sub_080330C0(ProcPtr proc)
{
    sub_0803B4DC(0x71);

    if (sub_0803BD6C())
    {
        sub_08032D60();
        Proc_EndEach(gUnknown_0849B688);
        Proc_EndEach(gUnknown_0849B670);
        gUnknown_0849B060->unk08 = gUnknown_0849B060->unk04;
        gUnknown_03003F1C = gUnknown_030044C4 = 0;
    }
    else
    {
        Proc_Goto(proc, 0xa);
    }
}
