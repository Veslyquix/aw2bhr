#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08026340.
 * sub_08026340 @ 0x08026340, sub_08026368 @ 0x08026368
 */

u8 sub_08026340(void)
{
    u8 count = 0;
    u8 i;

    for (i = 1; i <= 4; i++)
    {
        if (gUnknown_03003FF8[i] != 0)
            count++;
    }

    return count;
}

/* Xenesis's AW2 Subroutine List names this "Checks if Rank >999 Points" --
 * the body is a sum-and-clamp (three per-army score components summed,
 * capped at 9999 once past 999), not a boolean predicate; named for what it
 * does. The old sub_08026368 symbol is kept as a linker alias below so
 * every other unit keeps resolving it unchanged. */
u32 GetClampedRankScoreSum(u8 a)
{
    u32 v = gUnknown_08499598[a].unk34 + gUnknown_08499598[a].unk35 + gUnknown_08499598[a].unk36;

    if (v > 999)
        v = 9999;

    return v;
}

asm(".global sub_08026368\n.thumb_set sub_08026368, GetClampedRankScoreSum\n");
