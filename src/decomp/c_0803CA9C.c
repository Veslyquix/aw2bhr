#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803CA9C.
 * sub_0803CA9C @ 0x0803CA9C, sub_0803CAB8 @ 0x0803CAB8
 */

int sub_0803CA9C(u32 id)
{
    struct Unk02028030 *s = &gUnknown_02028030;
    u32 idx = id >> 3;
    u8 *b = s->unk10;
    u8 *p = b + idx;

    return (1 << (id & 7)) & *p;
}

int sub_0803CAB8(u32 id)
{
    struct Unk02028030 *s = &gUnknown_02028030;
    u32 idx = id >> 3;
    u8 *b = s->unk2a;
    u8 *p = b + idx;

    return (1 << (id & 7)) & *p;
}
