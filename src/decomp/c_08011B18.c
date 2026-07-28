#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08011B18.
 * sub_08011B18 @ 0x08011B18
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08011B18.
 * sub_08011B18 @ 0x08011B18
 */

void sub_08011B18(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
        gUnknown_03000000[i] = 0;
}
