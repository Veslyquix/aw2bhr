#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807C55C.
 * sub_0807C55C @ 0x0807C55C, sub_0807C570 @ 0x0807C570
 */

#include "proc.h"

void sub_0807C55C(void)
{
    Proc_Start(gUnknown_086164A0, PROC_TREE_3);
}

int sub_0807C570(void)
{
    return Proc_Find(gUnknown_086164A0) != 0;
}
