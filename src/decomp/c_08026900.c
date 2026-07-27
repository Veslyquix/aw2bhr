#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08026900.
 * sub_08026900 @ 0x08026900
 */

struct Unk03003FC0
{
    /* 0x00 */ u8 filler_00[0x43];
    /* 0x43 */ u8 unk43;
    /* 0x44 */ u8 unk44;
    /* 0x45 */ u8 unk45;
    /* 0x46 */ u8 unk46;
};
extern struct Unk03003FC0 gUnknown_03003FC0;

void sub_08026900(void)
{
    gUnknown_03003FC0.unk43 = 0;
    gUnknown_03003FC0.unk44 = 1;
    gUnknown_03003FC0.unk45 = 2;
    gUnknown_03003FC0.unk46 = 3;
}
