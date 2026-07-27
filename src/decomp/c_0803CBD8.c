#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803CBD8.
 * sub_0803CBD8 @ 0x0803CBD8
 */

struct Unk02028030
{
    /* 0x00 */ u8 unk00[8];
    /* 0x08 */ u8 unk08[8];
    /* 0x10 */ u8 unk10[2];
    /* 0x12 */ u8 unk12[0x18];
    /* 0x2A */ u8 unk2A[3];
    /* 0x2D */ u8 unk2D[3];
    /* 0x30 */ u8 unk30[0x18];
};
extern struct Unk02028030 gUnknown_02028030;
extern u8 gUnknown_030033F4[];

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
