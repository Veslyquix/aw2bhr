#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034F8C.
 * sub_08034F8C @ 0x08034F8C
 *
 * See GetCoPowerDepth/IncrementCoPowerDepth (sub_08034F6C.c) for the trio
 * this completes and the naming caveat. The old sub_XXXXXXXX symbol is kept
 * as a linker alias below so every other unit keeps resolving it unchanged.
 */

void DecrementCoPowerDepthIfNonzero(void)
{
    if (gUnknown_030030F0.unk00 != 0)
        gUnknown_030030F0.unk00--;
}

asm(".global sub_08034F8C\n.thumb_set sub_08034F8C, DecrementCoPowerDepthIfNonzero\n");
