#include "global.h"

void sub_0801C01C(u16 a1, u16 a2, void *a3, struct UnkVec a4, int a5)
{
    u64 pair;
    u16 lo;
    u16 x;
    u16 y;
    u16 z;

    pair = a4.unk00;
    pair &= 0xFFFF0000;
    pair >>= 16;
    lo = a4.unk00;
    x = (((u32)(a1 & 0x1FF) << 16) | ((u32)pair << 16)) >> 16;
    y = (a2 & 0xFF) | lo;
    z = a4.unk04;
    PutSpriteExt(a5, x, y, (u16 *)a3, z);
}
