#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080846C8.
 * sub_080846C8 @ 0x080846C8, sub_080846DC @ 0x080846DC
 */

#include "proc.h"

void sub_080846C8(void)
{
    Proc_Start(gUnknown_08616990, PROC_TREE_3);
}

int sub_080846DC(void)
{
    return Proc_Find(gUnknown_08616990) != 0;
}
