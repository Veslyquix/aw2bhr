#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803CEB8.
 * sub_0803CEB8 @ 0x0803CEB8
 */

void sub_0803CEB8(u8 a1, const void *a2)
{
    sub_0801AC58(a1 + 5, gUnknown_02000000);
    sub_0803D3D8((int)a2, gUnknown_02000000);
    sub_08026040(gUnknown_03003FC0.unk33[1], gUnknown_03003FC0.unk33[2],
                 gUnknown_03003FC0.unk33[3], gUnknown_03003FC0.unk33[4]);
    sub_08024268();
}
