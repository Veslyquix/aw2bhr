#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08060930.
 * sub_08060930 @ 0x08060930
 */

void sub_08060930(void)
{
    if (gUnknown_030046C0.unk06 == 0)
    {
        if (gUnknown_030046B8 & 1)
            sub_0806096C();
        sub_080609B8();
        if (gUnknown_030046B8 & 2)
            sub_08060A20();
    }
}
