#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080113EC.
 * sub_080113EC @ 0x080113EC
 */

#include "proc.h"
struct Unk80113EC
{
    /* 0x00 */ u8 filler_00[0x64];
    /* 0x64 */ s16 unk64;
};

void sub_080113EC(struct Unk80113EC *proc)
{
    gUnknown_03002F3C += proc->unk64;

    if (gUnknown_03002F3C > 0x13f)
        gUnknown_03002F3C = 0x140;

    if (proc->unk64 <= 8)
        gUnknown_03001408 = Interpolate(0, 0, 0x140, gUnknown_03002F3C, 0x140);
    else
        gUnknown_03001408 = Interpolate(4, 0, 0x140, gUnknown_03002F3C, 0x140);

    if (gUnknown_03001408 > 0x13f)
    {
        gUnknown_03001408 = 0x140;
        sub_08011300();
        sub_08011354();
        Proc_Break(proc);
        return;
    }

    if (gUnknown_03001408 > 0x13f)
        gUnknown_03001408 = 0x140;
}
