#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080088F0.
 * sub_080088F0 @ 0x080088F0
 */

void sub_080088F0(void)
{
    gUnknown_0200B0B0->unk13 = sub_08025308(1);
    gUnknown_0200B0B0->unk14 = sub_08025308(2);
    gUnknown_0200B0B0->unk15 = sub_08025308(3);
    gUnknown_0200B0B0->unk16 = sub_08025308(4);
}
