#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803866C.
 * IsHardCampaignMode @ 0x0803866C
 */

/* Named per Xenesis's AW2 Subroutine List: "Checks game mode and whether
 * Hard Campaign is on". The old IsHardCampaignMode symbol is kept as a linker
 * alias below so every other unit keeps resolving it unchanged. */
int IsHardCampaignMode(void)
{
    if (gPlaySt.gameMode == 1 && IsCampaignCompletionFlagSet(0x60) != 0)
        return 1;
    return 0;
}

asm(".global sub_0803866C\n.thumb_set sub_0803866C, IsHardCampaignMode\n");
