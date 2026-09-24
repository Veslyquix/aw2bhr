#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034F48.
 * LockUnitSelection @ 0x08034F48
 *
 * INFERRED name -- see the gGameLock.unitSelection note in include/lock.h for
 * the single read site it is inferred from. UnlockUnitSelection and
 * GetUnitSelectionLock are in c_08034F54.c. The old sub_XXXXXXXX symbol is kept
 * as a linker alias below so every other unit keeps resolving it unchanged.
 */

void LockUnitSelection(void)
{
    gGameLock.unitSelection = 1;
}

asm(".global sub_08034F48\n.thumb_set sub_08034F48, LockUnitSelection\n");
