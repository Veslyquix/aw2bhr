#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803D88C.
 * sub_0803D88C @ 0x0803D88C, sub_0803D8C0 @ 0x0803D8C0
 */

#include "proc.h"
/* Copies sub_0803D73C's proc field into the script record sub_080193B0
 * installs. The `adds r4,#0x64` before the `ldrh` is not a choice: 0x64 is past
 * the `ldrh` immediate's range. */
struct UnkD8C0Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ u16 unk64;
};

/* Two tests, one `&&`: both `bne`s land on the same sub_0803B524 arm. The
 * `lsls #0x18; cmp #0` on sub_0803861C's result is the bool8 truth test. */
void sub_0803D88C(ProcPtr proc)
{
    if (gUnknown_03003FC0.unk01 == 1 && !sub_0803861C())
        Proc_GotoScript(proc, gUnknown_0849F388);
    else
        sub_0803B524(0xcd);
}

void sub_0803D8C0(struct UnkD8C0Proc *proc)
{
    sub_080193B0(gUnknown_0849F3A8)->unk10 = proc->unk64;
}
