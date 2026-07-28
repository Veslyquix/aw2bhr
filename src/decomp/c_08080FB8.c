#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08080FB8.
 * sub_08080FB8 @ 0x08080FB8
 */

void sub_08080FB8(void)
{
    if (gUnknown_03005920 != 0 && gUnknown_030033FC == 6)
        gUnknown_030033FC = 0xc;
}
