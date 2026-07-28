#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08028CD8.
 * sub_08028CD8 @ 0x08028CD8
 */

void sub_08028CD8(void)
{
    if (gUnknown_030032D8 != 0x10)
    {
        gUnknown_030044DC = gUnknown_030032D8;
        gUnknown_030032D8 = 0x10;
    }
}
