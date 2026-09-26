#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034FA4.
 * RemoveMapLock @ 0x08034FA4
 *
 * The fourth map-lock accessor: a bare clear, where DecrementMapLock
 * (c_08034F8C.c) steps the depth down by one. The old sub_XXXXXXXX symbol is
 * kept as a linker alias below so every other unit keeps resolving it
 * unchanged.
 */

void RemoveMapLock(void)
{
    gGameLock.map = 0;
}

asm(".global sub_08034FA4\n.thumb_set sub_08034FA4, RemoveMapLock\n");
