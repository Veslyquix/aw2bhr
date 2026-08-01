#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004B7C.
 * sub_08004B7C @ 0x08004B7C
 */

void sub_08004B7C(void)
{
    sub_0801A614();
    sub_0801A168();
    sub_0801B780(0x70);
    sub_0801A148(gUnknown_084872FC, 2, 2, 0);
    sub_0800056C(7);
    sub_08002DEC();
    gUnknown_0200B0B0->unk46 = 0x15;
    gUnknown_0200B0B0->unk48 = 0x10;
}
