#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807B790.
 * sub_0807B790 @ 0x0807B790, sub_0807B7A4 @ 0x0807B7A4
 */

#include "proc.h"

void sub_0807B790(void)
{
    Proc_Start(gUnknown_08615FB4, PROC_TREE_3);
}

int sub_0807B7A4(void)
{
    return Proc_Find(gUnknown_08615FB4) != 0;
}
