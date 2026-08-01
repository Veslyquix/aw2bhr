#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807B738.
 * sub_0807B738 @ 0x0807B738, sub_0807B760 @ 0x0807B760
 */

struct Proc7B738
{
    u8 filler_00[0x30];
    int unk_30;
};
#include "hardware.h"
#include "proc.h"

void sub_0807B738(struct Proc7B738 *proc)
{
    PutSprite(0, 0x71, (proc->unk_30 + 1) * 8, gUnknown_0848B690, 0x1064);
}

void sub_0807B760(ProcPtr proc)
{
    if (gpKeySt->held & 1)
    {
        Proc_Start(gUnknown_0861604C, proc);
        Proc_Break(proc);
    }
}
