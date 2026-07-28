#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803CBD8.
 * sub_0803CBD8 @ 0x0803CBD8
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803CBD8.
 * sub_0803CBD8 @ 0x0803CBD8
 */

int sub_0803CBD8(int id)
{
    if (id >= 0x60 && id < 0xa0)
    {
        id -= 0x60;
        return (gUnknown_02028030.unk08[id >> 3] >> (id % 8)) & 1;
    }

    if (id >= 0x20 && id < 0x60)
    {
        id -= 0x20;
        return (gUnknown_02028030.unk00[id >> 3] >> (id % 8)) & 1;
    }

    if (id >= 0 && id < 0x20)
        return (gUnknown_030033F4[id >> 3] >> id) & 1;
}
