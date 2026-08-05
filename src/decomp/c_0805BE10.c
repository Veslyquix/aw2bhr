#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805BE10.
 * sub_0805BE10 @ 0x0805BE10, sub_0805BE54 @ 0x0805BE54
 */

void sub_0805BE10(int x, int y, u16 *out)
{
    gUnknown_030013EC(x, y, 1, gUnknown_085766E0->unk0f, 0);

    if (sub_08058318() < sub_0805848C())
    {
        out[0] = x;
        out[1] = y;
    }
}

void sub_0805BE54(int x, int y, u16 *out)
{
    gUnknown_030013EC(x, y, gUnknown_030046D4, gUnknown_085766E0->unk0f, 0);

    if (sub_08058318() < sub_080585D4() + 5)
    {
        out[0] = x;
        out[1] = y;
    }
}
