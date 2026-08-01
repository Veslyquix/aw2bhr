#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807BA3C.
 * sub_0807BA3C @ 0x0807BA3C, sub_0807BA68 @ 0x0807BA68
 */

#include "hardware.h"
#include "proc.h"

void sub_0807BA3C(void)
{
    if (gUnknown_085C77A0[gUnknown_03003FC0.unk02].unk58 == 3)
        sub_0803B524(0x195);
}

void sub_0807BA68(ProcPtr proc)
{
    if (gpKeySt->held & 8)
        Proc_Start(gUnknown_08616570, proc);
}
