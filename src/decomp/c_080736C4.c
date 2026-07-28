#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080736C4.
 * sub_080736C4 @ 0x080736C4
 */

#include "proc.h"

void sub_080736C4(void)
{
    Proc_Start(gUnknown_0861418C, PROC_TREE_VSYNC);
}
