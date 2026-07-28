#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08031E44.
 * sub_08031E44 @ 0x08031E44
 */

#include "proc.h"
/* All three members are past the strh displacement limit of 62, so each store
 * carries its own base add; the source order is +0x68, +0x64, +0x66, which is
 * what lets the second reuse the first's register with `subs #4`.
 */
struct Unk31E44Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ u16 unk64;
    /* 66 */ u16 unk66;
    /* 68 */ u16 unk68;
};

void sub_08031E44(ProcPtr parent)
{
    struct Unk31E44Proc *proc = Proc_Start(gUnknown_0849B2A4, parent);

    proc->unk68 = 100;
    proc->unk64 = 100;
    proc->unk66 = 72;
}
