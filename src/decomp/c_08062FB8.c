#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08062FB8.
 * sub_08062FB8 @ 0x08062FB8
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08062FB8.
 * sub_08062FB8 @ 0x08062FB8
 */

#include "hardware.h"
struct Unk08062FB8
{
    /* 0x00 */ u8 filler_00[0x16];
    /* 0x16 */ u16 unk16;
    /* 0x18 */ u8 unk18;
    /* 0x19 */ u8 filler_19[0x04];
    /* 0x1d */ u8 unk1d;
    /* 0x1e */ u8 unk1e;
    /* 0x1f */ u8 filler_1f[0x29];
    /* 0x48 */ u8 unk48;
    /* 0x49 */ u8 filler_49[0x01];
    /* 0x4a */ u8 unk4a;
};

void sub_08062FB8(struct Unk08062FB8 *p)
{
    p->unk1e = 0;
    p->unk18 = 0;
    p->unk1d = 0;
    p->unk4a = 15;
    p->unk48 = 0;
    p->unk16 = 0;

    REG_RCNT = 0;
    REG_SIOCNT = 0x2003;
    REG_SIODATA8 = 0;
}
