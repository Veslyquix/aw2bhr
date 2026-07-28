#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803FF2C.
 * sub_0803FF2C @ 0x0803FF2C
 */

#include "proc.h"
struct Unk3FF2CProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x54);
    /* 54 */ int unk54;
};

/* sub_0803FF48 passes this to Proc_ForEach over the 0849FB04 script right
 * after setting gUnknown_030044D4 from its own third argument and stashing the
 * same value at +0x54 of the proc it then starts. So this ends every stale
 * instance and spares the one just refreshed.
 */
void sub_0803FF2C(struct Unk3FF2CProc *proc)
{
    if (proc->unk54 != gUnknown_030044D4)
        Proc_End(proc);
}
