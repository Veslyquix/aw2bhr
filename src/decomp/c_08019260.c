#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019260.
 * sub_08019260 @ 0x08019260
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019260.
 * sub_08019260 @ 0x08019260
 */

int sub_08019260(void)
{
    s16 i;

    for (i = 0; i < 10; i++)
    {
        if (gUnknown_0200C528[i].unk00 != NULL)
            return 1;
    }
    return 0;
}
