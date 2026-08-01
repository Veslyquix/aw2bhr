#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801137C.
 * sub_0801137C @ 0x0801137C
 */

#include "proc.h"
struct Unk801137CProc
{
    /* 0x00 */ u8 filler_00[0x64];
    /* 0x64 */ s16 unk64;
};

/* sub_08011298's twin: Proc_End instead of sub_080153B8 on the already-in-state
 * path, and the cursor seeded at 0x140 instead of 0. */
void sub_0801137C(struct Unk801137CProc *proc)
{
    if (gUnknown_03002B5C == 0)
    {
        Proc_End(proc);
        return;
    }

    gUnknown_03002B5C = 0;
    proc->unk64 = 1;
    sub_08011300();
    sub_08011354();
    gUnknown_03001408 = 0x140;
    gUnknown_03002F3C = 0;
    sub_080111C8(gUnknown_0200B274, (void *)0x04000040, 1, 0xA240, sub_08011228);
}
