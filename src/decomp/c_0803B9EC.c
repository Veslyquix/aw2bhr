#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803B9EC.
 * sub_0803B9EC @ 0x0803B9EC, sub_0803BA00 @ 0x0803BA00
 */

#include "proc.h"

void sub_0803B9EC(void)
{
    Proc_Start(gUnknown_0849EAAC, PROC_TREE_3);
}

/* Same shape as sub_0803B8C4 (unk01 = 3) and sub_0803BADC (unk01 = 1). */
void sub_0803BA00(void)
{
    gUnknown_03003FC0.unk01 = 2;
    Proc_Start(gUnknown_0849EC1C, PROC_TREE_3);
}
