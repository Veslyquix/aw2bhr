#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08032E88.
 * sub_08032E88 @ 0x08032E88
 */

#include "hardware.h"
#include "proc.h"
struct Unk32E88Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk29;
    /* 2a */ STRUCT_PAD(0x2a, 0x2c);
    /* 2c */ int unk2c;
};
struct Unk49B6B0Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ int unk58;
};

void sub_08032E88(struct Unk32E88Proc *proc)
{
    int denom = 0x180 - (((proc->unk2c - 0x10) * (proc->unk2c - 0x10)) >> 1);
    int flag = proc->unk29 != 0;

    SetObjAffine((flag + 1) & 1,
                 Div(COS_Q12(0) * 16, 0x100),
                 Div(-SIN_Q12(0) * 16, 0x100),
                 Div(SIN_Q12(0) * 16, 0x100),
                 Div(COS_Q12(0) * 16, 0x100));

    SetObjAffine(flag,
                 Div(COS_Q12(0) * 16, denom),
                 Div(-SIN_Q12(0) * 16, denom),
                 Div(SIN_Q12(0) * 16, denom),
                 Div(COS_Q12(0) * 16, denom));

    PutSprite(0, 0x78, 0x40, gUnknown_0849B6C8, 0);
    PutSpriteExt(0, 0x60, 0x358, gUnknown_0849B6D6, 0);
    PutSpriteExt(0, 0x290, 0x358, gUnknown_0849B6D6, 8);

    if (gpKeySt->held & 1)
    {
        if (proc->unk29 != 0)
            sub_0803BD60();
        else
            sub_0803BD54();

        Proc_Break(proc);
        ((struct Unk49B6B0Proc *)Proc_Find(gUnknown_0849B6B0))->unk58 = 0;
    }
    else
    {
        if (gpKeySt->held & 0x20)
            proc->unk29--;

        if (gpKeySt->held & 0x10)
            proc->unk29++;

        proc->unk29 &= 1;
        proc->unk2c = (proc->unk2c + 1) & 0x1f;
    }
}
