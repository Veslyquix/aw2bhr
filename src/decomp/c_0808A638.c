#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808A638.
 * sub_0808A638 @ 0x0808A638, sub_0808A64C @ 0x0808A64C
 */

#include "proc.h"

void sub_0808A638(void)
{
    Proc_Start(gUnknown_08616DFC, PROC_TREE_3);
}

int sub_0808A64C(void)
{
    return Proc_Find(gUnknown_08616DFC) != 0;
}
