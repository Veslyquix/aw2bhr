#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08013AD4.
 * sub_08013AD4 @ 0x08013AD4, sub_08013AEC @ 0x08013AEC, sub_08013AFC @ 0x08013AFC, sub_08013B0C @ 0x08013B0C
 */

extern u16 gUnknown_03002F00;

void sub_08013AD4(u8 a1)
{
    gUnknown_03002F00 |= 1 << a1;
}

void sub_08013AEC(void)
{
    gUnknown_03002F00 |= 1;
}

void sub_08013AFC(void)
{
    gUnknown_03002F00 |= 2;
}

void sub_08013B0C(void)
{
    gUnknown_03002F00 |= 4;
}
