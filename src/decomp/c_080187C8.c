#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080187C8.
 * sub_080187C8 @ 0x080187C8, sub_08018800 @ 0x08018800
 */

/* sub_08018800's twin, differing only in the constant stored to
 * gUnknown_03003FC0.unk05. */
bool8 sub_080187C8(s16 a)
{
    gUnknown_03003FC0.unk05 = 1;
    sub_0802DCA4();
    gUnknown_0200C528[a].unk04++;
    return TRUE;
}

bool8 sub_08018800(s16 a)
{
    gUnknown_03003FC0.unk05 = 0;
    sub_0802DCA4();
    gUnknown_0200C528[a].unk04++;
    return TRUE;
}
