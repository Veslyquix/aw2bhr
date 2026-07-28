#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08074AAC.
 * sub_08074AAC @ 0x08074AAC
 */

#include "proc.h"
struct Unk8074AAC
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ s32 unk_2c;
    /* 0x30 */ s32 unk_30;
};

void sub_08074AAC(s32 arg, ProcPtr parent)
{
    struct Unk8074AAC * proc;

    gUnknown_0202FDFC.unk10 = 0;

    proc = Proc_StartBlocking(gUnknown_086142E4, parent);

    proc->unk_2c = arg;
    proc->unk_30 = 0;
}
