#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080328EC.
 * sub_080328EC @ 0x080328EC
 */

void sub_080328EC(void)
{
    if (sub_0803CD2C(0x200, gUnknown_0849B060->unk04) == 0)
    {
        sub_08012BC8(gUnknown_0849957C, 0, 0, 0x20, 0x14, 0);

        if (gUnknown_0849B060->unk09 != gUnknown_0849B018->unk06)
            sub_080328C0(gUnknown_0849957C + 0x83);

        sub_08013AFC();
    }
}
