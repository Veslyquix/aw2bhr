#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017870.
 * sub_08017870 @ 0x08017870
 *
 * Named per Xenesis's AW2 Datasheet/Subroutine List: "Updates what palette
 * has been stored for a CO" -- the writer paired with sub_08017860
 * (GetLoadedCoPalette). The old sub_XXXXXXXX symbol is kept as a linker
 * alias below so every other unit keeps resolving it unchanged.
 */

void SetLoadedCoPalette(int index, u8 value)
{
    gUnknown_0200C420.unk20[index] = value;
}

asm(".global sub_08017870\n.thumb_set sub_08017870, SetLoadedCoPalette\n");
