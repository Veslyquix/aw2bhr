#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803A4A8.
 * sub_0803A4A8 @ 0x0803A4A8
 */

void sub_0803A4A8(void)
{
    sub_08071948(gUnknown_08499580, gUnknown_0849D89C->unk00 >> 3, 0, gUnknown_080D4228, 0x8360);
    sub_08013AD4(2);
    sub_0803A190(gUnknown_0849D89C->unk00, gUnknown_0849D89C->unk04);
    sub_08013AD4(0);
    sub_0802465C();
    sub_08014740((gUnknown_0849D89C->unk00 >> 3) + 1, 0xa, gUnknown_08499578,
                 gUnknown_0849E398[gUnknown_081BA068[gUnknown_0849D89C->unk04->unk00] - 1][0],
                 0x8000, 0xf8)->unk3a = 1;
}
