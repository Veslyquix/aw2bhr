#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801C70C.
 * sub_0801C70C @ 0x0801C70C, sub_0801C754 @ 0x0801C754
 */

#include "proc.h"
/* SIX parameters -- four in registers and two on the stack ([sp,#0x18] and
 * [sp,#0x1c] past the six pushed registers). Only the last is narrow: it
 * arrives `lsls #0x10; lsrs #0x10` on its way to sub_0801C210's u16 second
 * parameter.
 *
 * The `(void *)` cast on a1 is the price of the declared `const void *` first
 * parameter meeting sub_0801C210's `void *`; it is byte-neutral and keeps the
 * ROM blobs its callers pass from having to drop const.
 *
 * It ends `pop {r1}; bx r1`, i.e. it returns a value, and the value is
 * whatever Proc_Start left in r0 -- no instruction moves anything else there.
 * `return (int)proc;` is byte-identical to falling off the end and says so. */
struct Unk0801C70CProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x50);
    /* 50 */ struct Unk0801C210 *unk50;
    /* 54 */ int unk54;
    /* 58 */ int unk58;
};
/* The per-frame callback of the gUnknown_0848B5AC proc sub_0801C70C starts:
 * the three fields it reads (+0x50, +0x54, +0x58) are exactly the three that
 * function writes, which is what pins the parameter as that proc and fixes the
 * struct below. */
struct Unk0801C754Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x50);
    /* 50 */ struct Unk0801C210 *unk50;
    /* 54 */ int unk54;
    /* 58 */ int unk58;
};

int sub_0801C70C(const void *a1, int a2, int a3, int a4, int a5, u16 a6)
{
    struct Unk0801C210 *h;
    struct Unk0801C70CProc *proc;

    h = sub_0801C210((void *)a1, a6, 1);
    sub_0801C4D4(h, a5);
    h->unk22 = a4;

    proc = Proc_Start(gUnknown_0848B5AC, PROC_TREE_3);
    proc->unk50 = h;
    proc->unk54 = a2;
    proc->unk58 = a3;

    return (int)proc;
}

void sub_0801C754(struct Unk0801C754Proc *proc)
{
    if (sub_0801C254(proc->unk50, proc->unk54, proc->unk58) == 0)
    {
        if (proc->unk50 == NULL || proc->unk50->unk00 == NULL)
            Proc_End(proc);
    }
}
