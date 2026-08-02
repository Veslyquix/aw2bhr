#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003040.
 * sub_08003040 @ 0x08003040, sub_08003064 @ 0x08003064
 */

void sub_08003040(void)
{
    gUnknown_0200B0B0->unk72[0] = 0;
    gUnknown_0200B0B0->unk72[1] = 0;
    gUnknown_0200B0B0->unk72[2] = 0;
    gUnknown_0200B0B0->unk72[3] = 0;
}

void sub_08003064(void)
{
    gUnknown_0200B0B0->unk72[0] = 0x32;
    gUnknown_0200B0B0->unk72[1] = 0x32;
    gUnknown_0200B0B0->unk72[2] = 0x32;
    gUnknown_0200B0B0->unk72[3] = 0x32;
}
