#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034F6C.
 * sub_08034F6C @ 0x08034F6C, sub_08034F7C @ 0x08034F7C
 */

s8 sub_08034F6C(void)
{
    return gUnknown_030030F0.unk00;
}

void sub_08034F7C(void)
{
    gUnknown_030030F0.unk00++;
}
