#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034F54.
 * sub_08034F54 @ 0x08034F54, sub_08034F60 @ 0x08034F60
 */

void sub_08034F54(void)
{
    gUnknown_030030F0.unk01 = 0;
}

u8 sub_08034F60(void)
{
    return gUnknown_030030F0.unk01;
}
