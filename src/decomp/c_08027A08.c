#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08027A08.
 * sub_08027A08 @ 0x08027A08
 */

/* sub_08027844's twin on the other axis: sub_080157D0 / sub_080157A4 instead of
 * sub_08015820 / sub_080157F4, and a threshold of 4 instead of 0x10. */
void sub_08027A08(void)
{
    s16 v = sub_080157D0(gUnknown_03001FBC);

    v = v - v / 2;

    if (v <= 4)
    {
        sub_080157A4(gUnknown_03001FBC, 1);
        sub_08015328(gUnknown_03001FBC);
    }
    else
    {
        sub_080157A4(gUnknown_03001FBC, v);
    }
}
