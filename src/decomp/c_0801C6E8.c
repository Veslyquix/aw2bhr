#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801C6E8.
 * sub_0801C6E8 @ 0x0801C6E8
 */

struct Unk0801C210 *sub_0801C6E8(int a1)
{
    int i;

    for (i = 0; i < 16; i++)
        if (gUnknown_03000288[i].unk00 == a1)
            return (struct Unk0801C210 *)&gUnknown_03000288[i];

    return NULL;
}
