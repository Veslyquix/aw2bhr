#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803E560.
 * sub_0803E560 @ 0x0803E560
 */

/* Appends one 8-byte record to *gUnknown_03003338 at the index held in
 * gUnknown_03003F40 and bumps the index. Byte-identical duplicate of
 * sub_080413B4, which uses gUnknown_030040A8 as the index instead -- both are
 * real IWRAM counters, not pool words.
 *
 * The BASE pointer is bound to a local so its address constant is created
 * first: written as `gUnknown_03003338[gUnknown_03003F40].unkNN` the index
 * global's pool word comes first and the two `ldr`s swap. The four parameters
 * are `int` -- they reach `strh` with no prologue narrowing at all, which
 * PROMOTE_MODE would have added for any sub-word type. */
void sub_0803E560(int a, int b, int c, int d)
{
    struct Unk03003338 *p;

    p = gUnknown_03003338;
    p[gUnknown_03003F40].unk04 = a;
    p[gUnknown_03003F40].unk06 = b;
    p[gUnknown_03003F40].unk00 = c;
    p[gUnknown_03003F40].unk02 = d;
    gUnknown_03003F40++;
}
