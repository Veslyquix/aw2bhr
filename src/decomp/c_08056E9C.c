#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08056E9C.
 * sub_08056E9C @ 0x08056E9C
 */

struct Unk02029A10
{
    /* 0x00 */ u8 filler_00[0x08];
    /* 0x08 */ u16 x;
    /* 0x0a */ u16 y;
    /* 0x0c */ u16 xSub;
    /* 0x0e */ u16 ySub;
    /* 0x10 */ u16 xStep;
    /* 0x12 */ u16 yStep;
    /* 0x14 */ u16 frame;
    /* 0x16 */ u16 frameCount;
    /* 0x18 */ u8 filler_18[0x0c];
};
struct Unk02029A10Group
{
    /* 0x00 */ struct Unk02029A10 entries[5];
};
extern struct Unk02029A10Group gUnknown_02029A10[];

void sub_08056E9C(u16 group, u16 index)
{
    struct Unk02029A10 *p =
        (struct Unk02029A10 *)(index * sizeof(struct Unk02029A10)
                             + group * sizeof(struct Unk02029A10Group)
                             + (u8 *)gUnknown_02029A10);

    if (p->frame != p->frameCount)
    {
        p->frame++;
        p->xSub += p->xStep;
        p->x += (s16)p->xSub >> 8;
        p->ySub += p->yStep;
        p->y += (s16)p->ySub >> 8;
    }
}
