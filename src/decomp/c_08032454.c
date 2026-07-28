#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08032454.
 * sub_08032454 @ 0x08032454, sub_08032468 @ 0x08032468
 */

#include "proc.h"

void sub_08032454(ProcPtr parent)
{
    Proc_Start(gUnknown_0849B62C, parent);
}

void sub_08032468(void)
{
    Proc_EndEach(gUnknown_0849B62C);
    gUnknown_0849B060->unk02 = 3;
}
