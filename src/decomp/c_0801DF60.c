#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801DF60.
 * sub_0801DF60 @ 0x0801DF60, sub_0801DF74 @ 0x0801DF74
 */

u8 sub_0801DF60(int offset)
{
    u8 *p = (u8 *)gUnknown_03002520;

    return p[offset & 0x3FF];
}

void sub_0801DF74(int offset, u8 value)
{
    volatile u8 *p = (volatile u8 *)gUnknown_03002520;

    p[offset & 0x3FF] = value;
}
