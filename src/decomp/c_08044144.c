#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044144.
 * SetPlayerCoPowerStatus @ 0x08044144
 *
 * Named per Xenesis's AW2 Subroutine List: "Sets CO Power/Super CO Power
 * Status". Copies unk1f (staged/queued CO power value) into unk1e (the
 * active status), which is what names both fields -- see the sibling clear
 * function (ClearPlayerCoPowerStatus, promoted as ClearPlayerCoPowerStatus) for
 * corroboration: it zeroes the same unk1e alongside unk26/unk28. The old
 * sub_XXXXXXXX symbol is kept as a linker alias below so every other unit
 * keeps resolving it unchanged.
 */

void SetPlayerCoPowerStatus(int a1)
{
    gPlayers[a1].coMode = gPlayers[a1].coActivationMode;
}

asm(".global sub_08044144\n.thumb_set sub_08044144, SetPlayerCoPowerStatus\n");
