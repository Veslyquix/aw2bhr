#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806AAC4.
 * sub_0806AAC4 @ 0x0806AAC4
 */

#include "proc.h"

int sub_0806AAC4(void)
{
    return Proc_Find(gUnknown_0858168C) != 0;
}
