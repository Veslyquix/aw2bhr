#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08037D80.
 * sub_08037D80 @ 0x08037D80, sub_08037DA4 @ 0x08037DA4
 *
 * Named per Xenesis's AW2 Subroutine List: sub_08037D80 = "Calculates Rank
 * in Campaign/War Room (S-C)", sub_08037DA4 = "Obtains ranking on a score
 * for Campaign (199, 249, 279) (C = 2, B = 3, A = 4, S = 5)" -- the three
 * thresholds (0xC7=199, 0xF9=249, 0x117=279) match exactly. Both entries are
 * genuinely byte-identical bodies at two separate addresses (not one calling
 * the other), so they get two distinct names for the same logic. The old
 * sub_XXXXXXXX symbols are kept as linker aliases below so every other unit
 * keeps resolving them unchanged.
 */

/* MATCHED, and the first of a byte-identical pair with sub_08037DA4. A
 * four-way classifier on three thresholds.
 *
 * The LAST test is `if (a <= 0x117) return 4; return 5;` and not
 * `if (a > 0x117) return 5; return 4;`. Both are the same predicate and the
 * first two arms are written the other way round, so this is not a style
 * choice: gcc emits `jump_if_not(cond)` to the code that follows the `if`, so
 * the arm that FALLS THROUGH in the ROM is the one that must be written last.
 * Here the fall-through is 5, which puts 4 inside the `if`. Read the
 * conditional branch's SENSE against the arm order, not against the
 * comparison. */
int GetRankFromScore(int a)
{
    if (a <= 0xC7)
        return 2;
    if (a <= 0xF9)
        return 3;
    if (a <= 0x117)
        return 4;
    return 5;
}

/* MATCHED. Byte-for-byte the same function as GetRankFromScore -- identical
 * instruction stream and identical pool words. One C body, two
 * addresses; read that one for the derivation. */
int GetCampaignScoreRank(int a)
{
    if (a <= 0xC7)
        return 2;
    if (a <= 0xF9)
        return 3;
    if (a <= 0x117)
        return 4;
    return 5;
}

asm(".global sub_08037D80\n.thumb_set sub_08037D80, GetRankFromScore\n"
    ".global sub_08037DA4\n.thumb_set sub_08037DA4, GetCampaignScoreRank\n");
