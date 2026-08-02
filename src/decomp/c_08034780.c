#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034780.
 * sub_08034780 @ 0x08034780
 */

void sub_08034780(void)
{
    gUnknown_030040F0 = 0;
    gUnknown_030044A0 = 0;

    gUnknown_03003FC0.unk38[1] = 1;
    gUnknown_03003FC0.unk38[2] = 1;
    gUnknown_03003FC0.unk38[3] = 1;
    gUnknown_03003FC0.unk38[4] = 1;
    gUnknown_03003FC0.unk33[1] = 1;
    gUnknown_03003FC0.unk33[2] = 2;
    gUnknown_03003FC0.unk33[3] = 3;
    gUnknown_03003FC0.unk33[4] = 4;
    gUnknown_03003FC0.unk3d[1] = 1;
    gUnknown_03003FC0.unk3d[2] = 2;
    gUnknown_03003FC0.unk3d[3] = 4;
    gUnknown_03003FC0.unk3d[4] = 0xb;

    sub_08026900();

    gUnknown_03003FC0.unk30 = 0;
    gUnknown_03003FC0.unk31 = 0;
    gUnknown_03003FC0.unk28 = 1000;
    gUnknown_03003FC0.unk24 = 0;
    gUnknown_03003FC0.unk10[1] = 0;
    gUnknown_03003FC0.unk10[2] = 0;
    gUnknown_03003FC0.unk10[3] = 0;
    gUnknown_03003FC0.unk10[4] = 0;
    gUnknown_03003FC0.unk0d = 0;
    gUnknown_03003FC0.unk2f = 0;
    gUnknown_03003FC0.unk2c = 0;
    gUnknown_03003FC0.unk2d = 0;
    gUnknown_03003FC0.unk2e = 0;
    gUnknown_03003FC0.unk04 = 3;
    gUnknown_03003FC0.unk05 = 1;
    gUnknown_03003FC0.unk06 = 0;
    gUnknown_03003FC0.unk08 = 1;
    gUnknown_03003FC0.unk07 = 1;
    gUnknown_03003FC0.unk09 = gUnknown_0200C420.unk0e;
    gUnknown_03003FC0.unk0c = (gUnknown_0200C420.unk14 == 0);
}
