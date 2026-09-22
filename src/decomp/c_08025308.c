#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08025308.
 * CountArmyUnits @ 0x08025308
 */

int CountArmyUnits(int a)
{
    int count = 0;
    int i;

    for (i = 1; i <= 50; i++)
    {
        if (gUnits[(a - 1) * 64 + i].unk00 != 0)
            count++;
    }

    return count;
}

asm(".global sub_08025308\n.thumb_set sub_08025308, CountArmyUnits\n");
