#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015928.
 * sub_08015928 @ 0x08015928
 */

struct UnkFoo
{
    u8 filler_00[0x30];
    u32 unk30;
    u32 unk34;
    u8 filler_38[4];
    u16 unk3c;
    u16 unk3e;
    u8 filler_40[4];
    u32 unk44;
    u8 filler_48[4];
};
struct UnkBar
{
    u8 filler_00[0x26];
    u16 unk26;
    u8 filler_28[0x38];
};
extern struct UnkFoo gUnknown_0200E438[];
extern struct UnkBar gUnknown_03001470[];

void sub_08015928(s16 a, u32 b)
{
    gUnknown_0200E438[gUnknown_03001470[a].unk26].unk44 = b;
}
