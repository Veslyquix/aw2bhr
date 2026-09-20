#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080266DC.
 * sub_080266DC @ 0x080266DC
 *
 * Named per Xenesis's AW2 Datasheet: "Checks whether current player (P1-4)
 * is active and is alive. Returns 1 if true, 0 if false." unk1b is already
 * documented above (unknown-globals.h) as the slot-occupied flag; unk14 == 0
 * is the "alive" half of that. The old sub_XXXXXXXX symbol is kept as a
 * linker alias below so every other unit keeps resolving it unchanged.
 */

bool8 IsPlayerAliveAndActive(u8 index)
{
    if (gPlayers[index].aiControlled != 0 && gPlayers[index].defeated == 0)
        return TRUE;

    return FALSE;
}

asm(".global sub_080266DC\n.thumb_set sub_080266DC, IsPlayerAliveAndActive\n");
