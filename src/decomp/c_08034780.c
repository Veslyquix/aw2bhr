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
    gUnknown_03003FC0.unk34 = 1;
    gUnknown_03003FC0.unk35 = 2;
    gUnknown_03003FC0.unk36 = 3;
    gUnknown_03003FC0.unk37 = 4;
    gUnknown_03003FC0.unk3e[0] = 1;
    gUnknown_03003FC0.unk3e[1] = 2;
    gUnknown_03003FC0.unk3e[2] = 4;
    gUnknown_03003FC0.unk3e[3] = 0xb;

    sub_08026900();

    gUnknown_03003FC0.unk30 = 0;
    gUnknown_03003FC0.unk31 = 0;
    gUnknown_03003FC0.unk28 = 1000;
    gUnknown_03003FC0.unk24 = 0;
    gUnknown_03003FC0.unk14 = 0;
    gUnknown_03003FC0.unk18 = 0;
    gUnknown_03003FC0.unk1c = 0;
    gUnknown_03003FC0.unk20 = 0;
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
