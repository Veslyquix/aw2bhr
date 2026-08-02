#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08027984.
 * sub_08027984 @ 0x08027984
 */

void sub_08027984(void)
{
    int v;
    s16 w;

    v = sub_080157D0(gUnknown_03001FBC);
    sub_080157A4(gUnknown_03001FBC, v - 0x10);

    v = sub_08015820(gUnknown_03001FBC);
    sub_080157F4(gUnknown_03001FBC, v - 0x10);

    v = sub_08015900(gUnknown_03001FBC);
    w = v - 2;
    sub_080158D4(gUnknown_03001FBC, w);

    if (w == 0)
    {
        sub_08016974(gUnknown_03001FBC);
        sub_080156FC(gUnknown_03001FBC, 1);
        sub_08015C30(gUnknown_03001FBC);
    }
}
