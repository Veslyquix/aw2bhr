#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803431C.
 * sub_0803431C @ 0x0803431C
 */

#include "proc.h"

int sub_0803431C(void)
{
    return Proc_Find(gUnknown_0849B8B8) != 0;
}
