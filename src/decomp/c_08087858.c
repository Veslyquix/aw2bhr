#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08087858.
 * sub_08087858 @ 0x08087858, sub_0808786C @ 0x0808786C
 */

#include "proc.h"

void sub_08087858(void)
{
    Proc_Start(gUnknown_08616C54, PROC_TREE_3);
}

int sub_0808786C(void)
{
    return Proc_Find(gUnknown_08616C54) != 0;
}
