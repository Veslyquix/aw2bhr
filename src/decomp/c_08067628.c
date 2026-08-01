#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08067628.
 * sub_08067628 @ 0x08067628
 */

#include "proc.h"
struct Unk67628Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};

/* Hands sub_08067564's dismiss flag on as the screen's exit code. `movs r1,#0;
 * ldrsh r0,[r0,r1]` is an s16 OBJECT read rather than a cast -- ldrsh has no
 * immediate-offset form, hence the scratch register -- so +0x64 is s16 here
 * even though sub_08067554/sub_08067564 only ever store 0 and 1 into it.
 *
 * sub_0806CC00 is defined in src/title-screen.c, which is upstream's own
 * matching source and must not be edited; its prototype in
 * include/unknown-functions.h is the contract. */
void sub_08067628(struct Unk67628Proc *proc)
{
    sub_0806CC00(proc->unk64);
}
