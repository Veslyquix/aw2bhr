#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044178.
 * sub_08044178 @ 0x08044178
 *
 * Named per Xenesis's AW2 Subroutine List: "Clears CO Power/Super CO Power
 * Status". The old sub_XXXXXXXX symbol is kept as a linker alias below so
 * every other unit keeps resolving it unchanged.
 */

void ClearPlayerCoPowerStatus(int a1)
{
    gUnknown_08499598[a1].unk1e = 0;
    gUnknown_08499598[a1].unk26 = 0;
    gUnknown_08499598[a1].unk28 = 0;
}

asm(".global sub_08044178\n.thumb_set sub_08044178, ClearPlayerCoPowerStatus\n");
