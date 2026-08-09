#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806C074.
 * sub_0806C074 @ 0x0806C074
 */

#include "proc.h"
#include "hardware.h"
struct Unk806C074
{
    /* 0x00 */ u8 filler_00[0x30];
    /* 0x30 */ u32 unk30;
    /* 0x34 */ int unk34;
    /* 0x38 */ int unk38;
};

void sub_0806C074(struct Unk806C074 *proc)
{
    struct Unk0858265C *t;

    t = gUnknown_0858265C[proc->unk38];

    if (proc->unk30 % 12 == 0)
    {
        while (t->unk00[proc->unk34].unk00 != 2)
        {
            proc->unk34++;

            if (proc->unk34 > 5)
            {
                proc->unk30 = 0;
                Proc_Break(proc);
                return;
            }
        }

        sub_0806BED8(proc->unk34, t->unk00[proc->unk34].unk04, proc);
        proc->unk34++;
    }

    proc->unk30++;
}
