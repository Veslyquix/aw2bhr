#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08033800.
 * sub_08033800 @ 0x08033800
 */

#include "proc.h"
struct Unk33800Proc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ int unk2c;
    /* 0x30 */ int unk30;
    /* 0x34 */ u8 filler_34[0x04];
    /* 0x38 */ int unk38;
    /* 0x3c */ u8 filler_3c[0x1c];
    /* 0x58 */ int unk58;
};

void sub_08033800(struct Unk33800Proc *proc)
{
    if (proc->unk30 != proc->unk38)
        proc->unk30 = proc->unk30 + ((proc->unk38 - proc->unk30) >> 1);

    sub_0801F34C(0x50,
        proc->unk2c + gUnknown_0849B108[proc->unk58 * 2],
        proc->unk30 + gUnknown_0849B108[proc->unk58 * 2 + 1] + 0x10,
        0, 0);

    sub_0801F34C(0x50,
        (proc->unk2c - gUnknown_0849B108[proc->unk58 * 2] + 0x90) | 0x3000,
        proc->unk30 - gUnknown_0849B108[proc->unk58 * 2 + 1] - 0x10,
        0, 0);

    proc->unk58 = (proc->unk58 + 1) & 0x1f;
}
