#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801D96C.
 * sub_0801D96C @ 0x0801D96C
 */

struct UnkVec
{
    u32 unk00;
    u32 unk04;
};
struct UnkFoo
{
    /* 0x00 */ u8 filler_00[0x14];
    /* 0x14 */ s32 unk14;
    /* 0x18 */ s32 unk18;
    /* 0x1c */ u8 filler_1c[0x14];
    /* 0x30 */ struct UnkVec unk30;
    /* 0x38 */ u8 filler_38[4];
    /* 0x3c */ u16 unk3c;
    /* 0x3e */ u16 unk3e;
    /* 0x40 */ u8 filler_40[0xc];
};
extern struct UnkFoo gUnknown_0200E438[];

void sub_0801D96C(int index, s16 x, s16 y)
{
    struct UnkFoo *p = &gUnknown_0200E438[index];

    p->unk14 = x << 8;
    p->unk18 = y << 8;
}
