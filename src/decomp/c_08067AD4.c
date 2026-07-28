#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08067AD4.
 * sub_08067AD4 @ 0x08067AD4
 */

#include "proc.h"
struct Unk67AD4Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x38);
    /* 38 */ u32 unk38;
};

void sub_08067AD4(struct Unk67AD4Proc *proc)
{
    if (proc->unk38 != 0)
        Proc_Break(proc);
}
