#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08011298.
 * sub_08011298 @ 0x08011298
 */

#include "proc.h"
struct Unk8011298Proc
{
    /* 0x00 */ u8 filler_00[0x64];
    /* 0x64 */ s16 unk64;
};

void sub_08011298(struct Unk8011298Proc *proc)
{
    if (gUnknown_03002B5C == 1)
    {
        sub_080153B8((struct Unk03001470 *)proc);
        return;
    }

    gUnknown_03002B5C = 1;
    proc->unk64 = 1;
    sub_08011300();
    sub_08011354();
    gUnknown_03001408 = 0;
    gUnknown_03002F3C = 0;
    sub_080111C8(gUnknown_0200B274, (void *)0x04000040, 1, 0xA240, sub_08011228);
}
