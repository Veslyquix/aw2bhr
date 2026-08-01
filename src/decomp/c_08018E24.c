#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08018E24.
 * sub_08018E24 @ 0x08018E24
 */

/* A gUnknown_0200C528 list-script handler: starts the gUnknown_0848A378 script
 * and hands the new slot a pointer to THIS script's current node in its +0x14
 * word, which is where sub_08018DF8 and friends read their node from.
 *
 * The store is a whole word into a member declared `u32` (wave 26, from
 * sub_08019818's `str`), so the node pointer is cast rather than the member
 * retyped -- the same direction c_08018DF8.c casts it back. */
bool8 sub_08018E24(s16 a)
{
    if (gUnknown_03002514 != 1)
        sub_080193B0(gUnknown_0848A378)->unk14 = (u32)gUnknown_0200C528[a].unk04;
    gUnknown_0200C528[a].unk04++;
    return TRUE;
}
