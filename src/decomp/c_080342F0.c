#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080342F0.
 * sub_080342F0 @ 0x080342F0
 */

#include "proc.h"

int sub_080342F0(void)
{
    return Proc_Find(gUnknown_0849B3CC) != 0;
}
