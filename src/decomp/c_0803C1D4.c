#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803C1D4.
 * sub_0803C1D4 @ 0x0803C1D4
 */

/* The four-array copy in the middle is what settles gUnknown_03003FC0's 0x33 /
 * 0x38 / 0x3d / 0x42 as four parallel 5-byte per-slot arrays indexed 1..4: the
 * loop increment `adds r2, r6, #1` is computed once and used as the index
 * against all four bases, which no 0x34/0x39/0x3e/0x43-based spelling can
 * produce (those would index with r6 and fold the +1 into the constant).
 *
 * gUnknown_08580934's +0x20 table is the fourth sibling of +0x09/+0x0d/+0x11,
 * carved out of what wave 36 had guessed as unk1c[8].
 *
 * `case 1:` is a real case and not the default: gcc's balanced dispatch for
 * {0,1,2,3} opens with `cmp #1; beq` / `cmp #1; bgt`, and for {0,2,3} it would
 * pivot on 2 instead. Its arm is identical to the default's, so the two share
 * one block.
 *
 * The `strb r3` stores of 0 and 2 in the case-0 and case-2 arms are cse2
 * reusing the switch value, which it knows equals the case constant inside the
 * arm -- the source writes plain literals. */

void sub_0803C1D4(void)
{
    u8 i;

    gUnknown_03003FC0.unk09 = gUnknown_08580934->unk02;
    gUnknown_0200C420.unk0e = gUnknown_08580934->unk02;
    gUnknown_03003FC0.unk0d = gUnknown_08580934->unk00;
    gUnknown_03003FC0.unk30 = gUnknown_08580934->unk03;
    gUnknown_03003FC0.unk28 = gUnknown_08580934->unk04;
    gUnknown_03003FC0.unk31 = gUnknown_08580934->unk07;
    gUnknown_03003FC0.unk08 = gUnknown_08580934->unk01;

    for (i = 0; i < 4; i++)
    {
        gUnknown_03003FC0.unk3d[i + 1] = gUnknown_08580934->unk20[i];
        gUnknown_03003FC0.unk38[i + 1] = gUnknown_08580934->unk09[i];
        gUnknown_03003FC0.unk33[i + 1] = gUnknown_08580934->unk0d[i];
        gUnknown_03003FC0.unk42[i + 1] = gUnknown_08580934->unk11[i];
    }

    switch (gUnknown_08580934->unk06)
    {
    case 0:
        gUnknown_03003FC0.unk2d = 1;
        gUnknown_03003FC0.unk2c = 0;
        gUnknown_03003FC0.unk2e = 0;
        gUnknown_03003FC0.unk2f = 0;
        break;
    case 2:
        gUnknown_03003FC0.unk2d = 3;
        gUnknown_03003FC0.unk2c = 2;
        gUnknown_03003FC0.unk2e = 2;
        gUnknown_03003FC0.unk2f = 2;
        break;
    case 3:
        gUnknown_03003FC0.unk2d = 3;
        gUnknown_03003FC0.unk2c = 1;
        gUnknown_03003FC0.unk2e = 1;
        gUnknown_03003FC0.unk2f = 1;
        break;
    case 1:
    default:
        gUnknown_03003FC0.unk2d = 0;
        gUnknown_03003FC0.unk2c = 0;
        gUnknown_03003FC0.unk2e = 0;
        gUnknown_03003FC0.unk2f = 0;
        break;
    }
}
