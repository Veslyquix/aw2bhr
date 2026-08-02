#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004E88.
 * sub_08004E88 @ 0x08004E88
 */

void sub_08004E88(void)
{
    sub_0803CEB8(gUnknown_0200B0B0->unk10, gUnknown_0200B204);
    sub_0800CB30(1, sub_0800CAA0());
    sub_08004E38((char *)&gUnknown_0200B0B0->unk9c, (const char *)gUnknown_0200B204);
    sub_080219AC();
    sub_0800C8D8();
    gUnknown_0200B0B0->unk12 = sub_0800C874();
    gUnknown_0200B0B0->unk00 &= 0xEFFF;
}
