#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803CA00.
 * sub_0803CA00 @ 0x0803CA00
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

void sub_0803CA00(u32 id, u8 value)
{
    struct Unk02028030 *s = &gUnknown_02028030;
    u32 idx = id >> 3;
    u8 *b = s->unk00;
    u8 *p = b + idx;
    u32 bit = id & 7;

    *p = (*p & ~(1 << bit)) | (value << bit);
}
