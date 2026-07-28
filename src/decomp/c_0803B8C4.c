#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803B8C4.
 * sub_0803B8C4 @ 0x0803B8C4
 */

#include "proc.h"

void sub_0803B8C4(void)
{
    gUnknown_03003FC0.unk01 = 3;
    Proc_Start(gUnknown_0849ECE0, PROC_TREE_3);
}
