#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080158D4.
 * sub_080158D4 @ 0x080158D4, sub_08015900 @ 0x08015900
 */

struct UnkFoo
{
    u8 filler_00[0x30];
    u32 unk30;
    u32 unk34;
    u8 filler_38[4];
    u16 unk3c;
    u16 unk3e;
    s16 unk40;
    u8 filler_42[0xa];
};
struct UnkBar
{
    u8 filler_00[0x26];
    u16 unk26;
    u8 filler_28[0x38];
};
extern struct UnkFoo gUnknown_0200E438[];
extern struct UnkBar gUnknown_03001470[];

void sub_080158D4(s16 a, s16 b)
{
    gUnknown_0200E438[gUnknown_03001470[a].unk26].unk40 = b;
}

s16 sub_08015900(s16 a)
{
    return gUnknown_0200E438[gUnknown_03001470[a].unk26].unk40;
}
