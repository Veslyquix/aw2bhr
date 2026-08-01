#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08060A7C.
 * sub_08060A7C @ 0x08060A7C
 */

void sub_08060A7C(void)
{
    int r;

    if (gUnknown_030046C0.unk06 == 0)
    {
        r = sub_08057FA8(0x18);
        if (gUnknown_030045D8 > r)
        {
            if (sub_08060ED4(6) != 0)
                gUnknown_030046C0.unk06 = 0x18;
        }
    }
}
