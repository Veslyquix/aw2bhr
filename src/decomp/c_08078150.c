#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078150.
 * sub_08078150 @ 0x08078150, sub_08078168 @ 0x08078168, sub_08078180 @ 0x08078180
 */

#include "proc.h"

int sub_08078150(void)
{
    return Proc_Find(gUnknown_086147FC) != 0;
}

int sub_08078168(void)
{
    return Proc_Find(gUnknown_0861485C) != 0;
}

int sub_08078180(void)
{
    return Proc_Find(gUnknown_08614894) != 0;
}
