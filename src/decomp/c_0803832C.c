#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803832C.
 * sub_0803832C @ 0x0803832C
 */

void sub_0803832C(void)
{
    sub_0803CA28(gUnknown_03003FC0.unk02, 1);

    switch (gUnknown_03003FC0.unk01)
    {
    case 1:
        sub_08038484();
        break;
    case 2:
        sub_08038548();
        break;
    case 3:
        sub_08038568();
        break;
    }
}
