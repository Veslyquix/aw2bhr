#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080457A4.
 * sub_080457A4 @ 0x080457A4, sub_080457BC @ 0x080457BC, sub_080457D0 @ 0x080457D0, sub_080457E8 @ 0x080457E8, sub_08045800 @ 0x08045800, sub_08045818 @ 0x08045818, sub_08045830 @ 0x08045830
 */

#include "proc.h"


/* `!= 0` rather than the if/else pair: the original reuses the r0 that `cmp`
 * just tested as the zero result, so there is no `movs r0, #0` anywhere. The
 * two if/else spellings both emit one. */

int sub_080457A4(void)
{
    return Proc_Find(gUnknown_084A0A3C) != 0;
}

int sub_080457BC(void)
{
    if (gUnknown_03002EE4 != 0)
        return 0;

    return 1;
}

int sub_080457D0(void)
{
    if (sub_0803E388(5) == 0)
        return 1;

    return 0;
}

int sub_080457E8(void)
{
    if (sub_0803E388(1) == 0)
        return 1;

    return 0;
}

int sub_08045800(void)
{
    if (sub_0803E388(3) == 0)
        return 1;

    return 0;
}

int sub_08045818(void)
{
    if (sub_0803E388(4) == 0)
        return 1;

    return 0;
}

int sub_08045830(void)
{
    if (sub_08045650() == 0)
        return 1;

    return 0;
}
