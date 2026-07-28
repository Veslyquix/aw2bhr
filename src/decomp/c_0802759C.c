#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802759C.
 * sub_0802759C @ 0x0802759C
 */

#include "proc.h"

bool8 sub_0802759C(void)
{
    return Proc_Find(gUnknown_08499CFC) != NULL;
}
