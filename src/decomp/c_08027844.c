#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08027844.
 * sub_08027844 @ 0x08027844
 */

/* `v - v / 2` on an s16 local: the `lsrs r0, r0, #0x1f` is the sign bit of the
 * ALREADY-SHIFTED return value being reused as the signed-divide bias, which is
 * why the `lsls #0x10` that re-narrows sub_08015820's s16 result feeds two
 * consumers. The `else` arm passes `v` in r1 without reloading it -- that is
 * the only place sub_080157F4's second argument is visible here. */
void sub_08027844(void)
{
    s16 v = sub_08015820(gUnknown_03001FBC);

    v = v - v / 2;

    if (v <= 0x10)
    {
        sub_080157F4(gUnknown_03001FBC, 1);
        sub_08015328(gUnknown_03001FBC);
    }
    else
    {
        sub_080157F4(gUnknown_03001FBC, v);
    }
}
