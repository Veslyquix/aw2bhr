#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802925C.
 * sub_0802925C @ 0x0802925C
 */

#include "proc.h"
#include "hardware.h"
struct Unk2925CProc
{
    /* 0x00 */ u8 filler_00[0x64];
    /* 0x64 */ s16 unk64;
    /* 0x66 */ s16 unk66;
};

void sub_0802925C(struct Unk2925CProc *proc)
{
    struct Unk03003338 *p;
    s16 old;
    s8 r;

    r = sub_08015BD0((s32)gUnknown_0849A00C);

    if (r != -1)
        return;

    if (gpKeySt->held & 2)
    {
        gUnknown_030033E4.unk00 = gUnknown_03003100.pos.unk00;
        gUnknown_030033E4.unk02 = gUnknown_03003100.pos.unk02;
        gUnknown_03003F40 = r;
        Proc_End(proc);
        sub_08028EE4();
        sub_08029088(((struct Unk802C57CS *)&gUnknown_030033E4)->unk00,
                     ((struct Unk802C57CS *)&gUnknown_030033E4)->unk02);
        return;
    }

    if (gpKeySt->held & 1)
    {
        gUnknown_03003F40 = proc->unk64;
        Proc_End(proc);
        sub_08028EE4();
        return;
    }

    old = proc->unk64;

    if (gpKeySt->unk02 & 0x90)
    {
        proc->unk64 = proc->unk64 + 1;

        if (proc->unk64 == proc->unk66)
            proc->unk64 = 0;
    }

    if (gpKeySt->unk02 & 0x60)
    {
        if (proc->unk64 <= 0)
            proc->unk64 = proc->unk66;

        proc->unk64--;
    }

    if (old != proc->unk64)
        sub_0803B4DC(0x77);

    p = sub_080413A4(proc->unk64);

    gUnknown_030033E4.unk00 = p->unk04;
    gUnknown_030033E4.unk02 = p->unk06;

    sub_08029088(*(s16 *)&p->unk04, *(s16 *)&p->unk06);

    if (sub_08015BD0((s32)gUnknown_0849A00C) != -1)
    {
        sub_0802DCA4();
        return;
    }

    sub_08023274(2);
    sub_0802A7C4();
}
