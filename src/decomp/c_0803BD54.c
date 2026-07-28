#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803BD54.
 * sub_0803BD54 @ 0x0803BD54, sub_0803BD60 @ 0x0803BD60, sub_0803BD6C @ 0x0803BD6C
 */

void sub_0803BD54(void)
{
    gUnknown_030030F0.unk02 = 1;
}

void sub_0803BD60(void)
{
    gUnknown_030030F0.unk02 = 0;
}

u8 sub_0803BD6C(void)
{
    return gUnknown_030030F0.unk02;
}
