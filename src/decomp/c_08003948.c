#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003948.
 * sub_08003948 @ 0x08003948
 */

void sub_08003948(void)
{
    gUnknown_0200B0B0->unk00 &= ~8;
}
