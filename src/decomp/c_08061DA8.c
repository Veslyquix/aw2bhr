#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08061DA8.
 * sub_08061DA8 @ 0x08061DA8
 */

struct Unk08499598
{
    /* 0x00 */ u8 filler_00[0x0c];
    /* 0x0c */ u8 unk0c;
    /* 0x0d */ u8 unk0d;
    /* 0x0e */ u8 unk0e;
    /* 0x0f */ u8 unk0f;
    /* 0x10 */ u8 filler_10[0x03];
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u8 filler_16[0x05];
    /* 0x1b */ u8 unk1b;
    /* 0x1c */ u8 filler_1c[0x1e];
    /* 0x3a */ u8 unk3a;
    /* 0x3b */ u8 filler_3b[0x01];
};
extern struct Unk08499598 *gUnknown_08499598;

int sub_08061DA8(int index)
{
    struct Unk08499598 *p = &gUnknown_08499598[index];

    return p->unk0c + p->unk0d + p->unk0e + p->unk0f + 1;
}
