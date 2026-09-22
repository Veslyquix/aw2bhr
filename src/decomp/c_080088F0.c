#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080088F0.
 * sub_080088F0 @ 0x080088F0
 */

void sub_080088F0(void)
{
    gActiveMap->unk13 = CountArmyUnits(1);
    gActiveMap->unk14 = CountArmyUnits(2);
    gActiveMap->unk15 = CountArmyUnits(3);
    gActiveMap->unk16 = CountArmyUnits(4);
}
