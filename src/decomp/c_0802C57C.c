#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802C57C.
 * sub_0802C57C @ 0x0802C57C, sub_0802C594 @ 0x0802C594
 */

struct Unk802C57C
{
    u16 unk00;
    u16 unk02;
};
extern struct Unk802C57C gUnknown_03003F24;
extern struct Unk802C57C gUnknown_030044A4;

void sub_0802C57C(void)
{
    gUnknown_030044A4.unk00 = gUnknown_03003F24.unk00;
    gUnknown_030044A4.unk02 = gUnknown_03003F24.unk02;
}

void sub_0802C594(void)
{
    gUnknown_03003F24.unk00 = gUnknown_030044A4.unk00;
    gUnknown_03003F24.unk02 = gUnknown_030044A4.unk02;
}
