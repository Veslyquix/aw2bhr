#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08025598.
 * sub_08025598 @ 0x08025598
 */

u8 sub_08025598(s16 a1, s16 a2)
{
    int off;
    int id;

    off = gMap->rowOffset[a2] + a1;
    id = gMap->unitUnk[off];

    if ((u16)id == 0)
        return 0;

    if (gUnknown_08499598[((u16)id >> 6) + 1].unk1c & 2)
        return 1;

    return 0;
}
