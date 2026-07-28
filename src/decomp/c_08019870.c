#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019870.
 * sub_08019870 @ 0x08019870, sub_0801987C @ 0x0801987C, sub_08019888 @ 0x08019888, sub_08019894 @ 0x08019894, sub_080198A0 @ 0x080198A0
 */

void sub_08019870(void)
{
    gUnknown_03003FC0.unk06 = 0;
}

void sub_0801987C(void)
{
    gUnknown_03003FC0.unk06 = 1;
}

void sub_08019888(void)
{
    gUnknown_03003FC0.unk07 = 1;
}

void sub_08019894(void)
{
    gUnknown_03003FC0.unk07 = 0;
}

void sub_080198A0(void (*func)(void))
{
    gUnknown_03002F20 = func;
}
