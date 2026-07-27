#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080261C8.
 * sub_080261C8 @ 0x080261C8
 */

struct Unk08499598
{
    /* 0x00 */ u8 filler_00[0x13];
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u8 filler_16[0x04];
    /* 0x1a */ u8 unk1a;
    /* 0x1b */ u8 unk1b;
    /* 0x1c */ u8 filler_1c[0x20];
};
extern struct Unk08499598 *gUnknown_08499598;
extern u8 gUnknown_0810E6E0[];

u8 *sub_080261C8(int index)
{
    u8 *base = gUnknown_0810E6E0;

    return base + (gUnknown_08499598[index].unk1a - 1) * 0x20;
}
