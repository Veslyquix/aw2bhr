#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804138C.
 * sub_0804138C @ 0x0804138C, sub_08041398 @ 0x08041398
 */

void sub_0804138C(void)
{
    gUnknown_030040A8 = 0;
}

u32 sub_08041398(void)
{
    return gUnknown_030040A8;
}
