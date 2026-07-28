#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003040.
 * sub_08003040 @ 0x08003040, sub_08003064 @ 0x08003064
 */

void sub_08003040(void)
{
    gUnknown_0200B0B0->unk72 = 0;
    gUnknown_0200B0B0->unk73 = 0;
    gUnknown_0200B0B0->unk74 = 0;
    gUnknown_0200B0B0->unk75 = 0;
}

void sub_08003064(void)
{
    gUnknown_0200B0B0->unk72 = 0x32;
    gUnknown_0200B0B0->unk73 = 0x32;
    gUnknown_0200B0B0->unk74 = 0x32;
    gUnknown_0200B0B0->unk75 = 0x32;
}
