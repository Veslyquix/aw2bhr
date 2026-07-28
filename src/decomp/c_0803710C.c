#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803710C.
 * sub_0803710C @ 0x0803710C
 */

#include "proc.h"

int sub_0803710C(void)
{
    return Proc_Find(gUnknown_0849D3BC) != 0;
}
