#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08005838.
 * sub_08005838 @ 0x08005838
 */

/* THREE parameters, only the third read. It arrives `lsls #0x18; lsrs #0x18`
 * in place at entry, i.e. PROMOTE_MODE on a `u8`; the first two are dead here,
 * so `int` is the weakest model for them rather than a measurement. */
void sub_08005838(int a1, int a2, u8 a3)
{
    if (a3 == 2)
    {
        sub_080193B0(gUnknown_08488594);
    }
    else
    {
        gUnknown_0200B0B0->unk02 = 0;
        sub_0801A614();
        sub_0801A168();
        sub_080152C0((s32)gUnknown_08488614, 0);
    }
}
