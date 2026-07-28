#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803D960.
 * sub_0803D960 @ 0x0803D960
 */

#include "proc.h"
/* Only the halfword at +0x64 is ever touched here; the rest of the proc is
 * whatever struct Proc already describes. */
struct UnkD960Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ u16 unk64;
};

void sub_0803D960(ProcPtr parent)
{
    struct UnkD960Proc *proc = Proc_StartBlocking(gUnknown_0849F5D0, parent);

    proc->unk64 = 6;
}
