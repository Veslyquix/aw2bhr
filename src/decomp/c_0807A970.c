#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807A970.
 * sub_0807A970 @ 0x0807A970, sub_0807A984 @ 0x0807A984
 */

#include "proc.h"

void sub_0807A970(void)
{
    Proc_Start(gUnknown_08615CB0, PROC_TREE_3);
}

int sub_0807A984(void)
{
    return Proc_Find(gUnknown_08615CB0) != 0;
}
