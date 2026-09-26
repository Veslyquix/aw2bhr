#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034F8C.
 * DecrementMapLock @ 0x08034F8C
 *
 * See GetMapLock/IncrementMapLock (c_08034F6C.c) and RemoveMapLock
 * (c_08034FA4.c) for the rest of the map lock and the naming caveat. The old
 * sub_XXXXXXXX symbol is kept as a linker alias below so every other unit keeps
 * resolving it unchanged.
 */

void DecrementMapLock(void)
{
    if (gGameLock.map != 0)
        gGameLock.map--;
}

asm(".global sub_08034F8C\n.thumb_set sub_08034F8C, DecrementMapLock\n");
