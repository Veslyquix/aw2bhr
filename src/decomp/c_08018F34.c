#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08018F34.
 * sub_08018F34 @ 0x08018F34, sub_08018F74 @ 0x08018F74, sub_08018FB4 @ 0x08018FB4
 */

/* sub_08018BCC with sub_0803CBD8 in place of the node's own predicate; same
 * inverted arms and the same sub_08018BAC re-narrow. */
s16 sub_08018F34(s16 a)
{
    if (sub_0803CBD8((s16)gUnknown_0200C528[a].unk04->unk08) != 0)
        return sub_08018BAC(a);
    else
    {
        gUnknown_0200C528[a].unk04++;
        return TRUE;
    }
}

/* sub_08018F34 with the predicate inverted. */
s16 sub_08018F74(s16 a)
{
    if (sub_0803CBD8((s16)gUnknown_0200C528[a].unk04->unk08) == 0)
        return sub_08018BAC(a);
    else
    {
        gUnknown_0200C528[a].unk04++;
        return TRUE;
    }
}

bool8 sub_08018FB4(s16 a)
{
    sub_08019940(gUnknown_0200C528[a].unk04->unk08, 0x80);
    gUnknown_0200C528[a].unk04++;
    return TRUE;
}
