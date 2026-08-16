#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803CA54.
 * sub_0803CA54 @ 0x0803CA54
 *
 * Named per Xenesis's AW2 Subroutine List: "Checks if a map has been
 * unlocked. r0 = Map ID". The old sub_XXXXXXXX symbol is kept as a linker
 * alias below so every other unit keeps resolving it unchanged.
 */

int IsCampaignMapUnlocked(u32 id)
{
    struct Unk02028030 *s = &gUnknown_02028030;
    u32 idx = id >> 3;
    u8 *b = s->unk12;
    u8 *p = b + idx;

    return (1 << (id & 7)) & *p;
}

asm(".global sub_0803CA54\n.thumb_set sub_0803CA54, IsCampaignMapUnlocked\n");
