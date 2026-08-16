#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017860.
 * sub_08017860 @ 0x08017860
 *
 * Xenesis's AW2 Datasheet/Subroutine List calls this "Updates what palette
 * has been loaded for a CO", but the body is a plain read with no store --
 * named for what it does (GetLoadedCoPalette) rather than the docs' wording,
 * paired with sub_08017870 (SetLoadedCoPalette) which is the actual writer.
 * The old sub_XXXXXXXX symbol is kept as a linker alias below so every
 * other unit keeps resolving it unchanged.
 */

int GetLoadedCoPalette(int index)
{
    return gUnknown_0200C420.unk20[index];
}

asm(".global sub_08017860\n.thumb_set sub_08017860, GetLoadedCoPalette\n");
