#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080719C0.
 * sub_080719C0 @ 0x080719C0
 */

#include "proc.h"

void sub_080719C0(void)
{
    Proc_Start(gUnknown_08613E08, PROC_TREE_3);
}
