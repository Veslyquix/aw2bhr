#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08028874.
 * sub_08028874 @ 0x08028874
 */

struct Unk08499598
{
    /* 0x00 */ u8 filler_00[0x13];
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u8 filler_16[0x05];
    /* 0x1b */ u8 unk1b;
    /* 0x1c */ u8 filler_1c[0x1e];
    /* 0x3a */ u8 unk3a;
    /* 0x3b */ u8 filler_3b[0x01];
};
extern struct Unk08499598 *gUnknown_08499598;
extern u16 gUnknown_03004080;

void sub_08028874(int index, u8 value)
{
    gUnknown_08499598[index].unk14 = gUnknown_03004080;
    gUnknown_08499598[index].unk13 = value;
}
