#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803647C.
 * sub_0803647C @ 0x0803647C
 */

#include "proc.h"
struct Unk3647CProc
{
    /* 0x00 */ PROC_HEADER;
    /* 0x29 */ STRUCT_PAD(0x29, 0x35);
    /* 0x35 */ u8 unk35;
};

void sub_0803647C(ProcPtr procArg)
{
    struct Unk3647CProc *proc = procArg;

    sub_08036024();
    proc->unk35 = 1;
    gUnknown_030040E4 = 0;
}
