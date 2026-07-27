#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803CAF0.
 * sub_0803CAF0 @ 0x0803CAF0, sub_0803CB0C @ 0x0803CB0C
 */

int sub_0803CAF0(u32 id)
{
    struct Unk02028030 *s = &gUnknown_02028030;
    u32 idx = id >> 3;
    u8 *b = s->unk08;
    u8 *p = b + idx;

    return (1 << (id & 7)) & *p;
}

int sub_0803CB0C(u32 id)
{
    struct Unk02028030 *s = &gUnknown_02028030;
    u32 idx = id >> 3;
    u8 *b = s->unk00;
    u8 *p = b + idx;

    return (1 << (id & 7)) & *p;
}
