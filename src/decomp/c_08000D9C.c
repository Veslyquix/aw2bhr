#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08000D9C.
 * sub_08000D9C @ 0x08000D9C
 */

void sub_08000D9C(void)
{
    if (gUnknown_0200B0B0->unk11 == 0)
    {
        gUnknown_0200B0B0->unk11 = 0x14;
        gUnknown_0200B0B0->unk00 |= 0x2000;
    }
}
