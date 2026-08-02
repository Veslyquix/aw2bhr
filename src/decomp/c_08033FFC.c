#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08033FFC.
 * sub_08033FFC @ 0x08033FFC, sub_0803405C @ 0x0803405C, sub_08034130 @ 0x08034130
 */

#include "proc.h"
#include "hardware.h"
struct Unk33FFCProc
{
    /* 0x00 */ u8 filler_00[0x36];
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 filler_37[0x15];
    /* 0x4c */ u32 unk4c;
};
struct Unk3405CProc
{
    /* 0x00 */ u8 filler_00[0x36];
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 filler_37[0x15];
    /* 0x4c */ u32 unk4c;
};
struct Unk34130Child
{
    /* 0x00 */ u8 filler_00[0x30];
    /* 0x30 */ u8 unk30[0x03];
    /* 0x33 */ u8 filler_33[0x03];
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 unk37;
};
struct Unk34130Proc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ struct Unk34130Child *unk2c;
};

void sub_08033FFC(struct Unk33FFCProc *proc)
{
    PutSpriteExt(0, 0x60, gUnknown_0849BC38[2],
        gUnknown_0849BC18[proc->unk36], (proc->unk36 + 1) << 12);

    if (proc->unk4c > 0x78 || (gpKeySt->held & 1))
    {
        proc->unk4c = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->unk4c++;
    }
}

void sub_0803405C(struct Unk3405CProc *proc)
{
    int t = Interpolate(0, 0x100, 0x10, proc->unk4c, 0x10);

    SetObjAffine(0xc,
        Div(COS_Q12(0) * 16, 0x100),
        Div(-SIN_Q12(0) * 16, t),
        Div(SIN_Q12(0) * 16, 0x100),
        Div(COS_Q12(0) * 16, t));

    PutSpriteExt(0, 0x1860, gUnknown_0849BC38[2] | 0x100,
        gUnknown_0849BC18[proc->unk36], (proc->unk36 + 1) << 12);

    if (proc->unk4c > 0xf)
        Proc_Break(proc);
    else
        proc->unk4c++;
}

void sub_08034130(struct Unk34130Proc *proc)
{
    struct Unk34130Child *child = proc->unk2c;
    u8 n = child->unk36;

    if (gpKeySt->held & 2)
    {
        sub_0803BD60();
        sub_0803B4DC(0x66);
        Proc_Goto(proc, 2);
    }
    else if (child->unk37 == 0)
    {
        if (gpKeySt->held & 9)
        {
            gUnknown_0849B060->unk0d = n;
            Proc_EndEach(gUnknown_0849BB50);
            sub_0803B4DC(0x71);
            Proc_Break(child);
            Proc_Break(proc);
        }
        else
        {
            if (gpKeySt->unk02 & 0x40)
            {
                if (n != 0)
                    n = n - 1;
                else
                    n = 2;
            }
            else if (gpKeySt->unk02 & 0x80)
            {
                if (n <= 1)
                    n = n + 1;
                else
                    n = 0;
            }

            if (n != child->unk36)
            {
                child->unk30[child->unk36] = 0;
                child->unk36 = n;
                child->unk30[child->unk36] = 1;
                child->unk37 = 1;

                sub_080338C0(n);
                sub_0803B4DC(0x64);
                Proc_Goto(child, 0);
            }
        }
    }
}
