#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08036F68.
 * sub_08036F68 @ 0x08036F68
 */

#include "proc.h"

void sub_08036F68(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7, u8 a8,
                  u8 a9, u8 a10, u8 a11, u8 a12, u8 a13, u8 a14, u8 a15,
                  u8 a16, u16 a17)
{
    gUnknown_03002B5C = 0;
    gUnknown_0300450C = a15;

    gUnknown_03004580[0][0] = a2 - 1;
    gUnknown_03004580[1][0] = a9 - 1;
    gUnknown_03004580[0][1] = a4 - 1;
    gUnknown_03004580[1][1] = a11 - 1;
    gUnknown_03004580[0][2] = a5;
    gUnknown_03004580[1][2] = a12;
    gUnknown_03004580[0][3] = a3;
    gUnknown_03004580[1][3] = a10;
    gUnknown_03004580[0][4] = a1;
    gUnknown_03004580[1][4] = a8;
    gUnknown_03004580[0][5] = a6;
    gUnknown_03004580[1][5] = a13;
    gUnknown_03004580[0][6] = a7;
    gUnknown_03004580[1][6] = a14;
    gUnknown_03004580[0][7] = gUnknown_085D583C[a3].unk10 * 10;
    gUnknown_03004580[1][7] = gUnknown_085D583C[a10].unk10 * 10;

    gUnknown_02027F68[1] = 0;
    gUnknown_03004528[0] = gUnknown_02027F68;
    gUnknown_03004528[1] = gUnknown_02027F68;
    gUnknown_03004520 = a16;

    sub_080546BC();

    gUnknown_03004504.bit0 = 1;
    gUnknown_03004504.bit1 = 0;
    gUnknown_03004504.bit2 = 0;
    gUnknown_03004504.bit3 = 0;
    gUnknown_03004504.bit4 = 0;
    gUnknown_03004504.bit5 = 0;
    gUnknown_03004504.bit6 = 0;
    gUnknown_03004504.unk02 = a17;

    Proc_Start(gUnknown_0849D3BC, PROC_TREE_3);
}
