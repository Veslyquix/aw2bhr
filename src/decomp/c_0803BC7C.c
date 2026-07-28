#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803BC7C.
 * sub_0803BC7C @ 0x0803BC7C, sub_0803BC88 @ 0x0803BC88, sub_0803BC94 @ 0x0803BC94
 */

u8 sub_0803BC7C(void)
{
    return gUnknown_03003F30[1];
}

u8 sub_0803BC88(void)
{
    return gUnknown_03003F30[3];
}

u8 sub_0803BC94(void)
{
    return gUnknown_03003F30[2];
}
