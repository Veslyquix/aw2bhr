#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080156FC.
 * sub_080156FC @ 0x080156FC
 */

struct UnkFoo
{
    u8 filler_00[4];
    u32 unk04;
    u32 unk08;
    u8 filler_0c[0x10];
    u16 unk1c;
    u8 filler_1e[0x2a];
    u32 *unk48;
};
struct UnkBar
{
    u8 filler_00[0x26];
    u16 unk26;
    u8 filler_28[0x38];
};
extern struct UnkFoo gUnknown_0200E438[];
extern struct UnkBar gUnknown_03001470[];

void sub_080156FC(s16 a, u16 b)
{
    struct UnkFoo *p = &gUnknown_0200E438[gUnknown_03001470[a].unk26];
    u32 v;

    p->unk1c = 0;
    v = p->unk48[b + 1];
    p->unk04 = v;
    p->unk08 = v;
}
