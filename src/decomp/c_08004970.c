#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004970.
 * sub_08004970 @ 0x08004970
 */

#include "hardware.h"

void sub_08004970(void)
{
    sub_08002F1C();

    if ((gpKeySt->held & 7) != 0)
    {
        sub_08012BC8(gUnknown_08499580, 9, 2, 0xB, 0x11, 0x360);
        sub_08013B0C();
        sub_08002E5C();
        sub_08002E3C();
        sub_08015C30(gUnknown_03001FBC);

        if ((gpKeySt->held & 2) == 0)
            gUnknown_03002F1C = 1;
    }
}
