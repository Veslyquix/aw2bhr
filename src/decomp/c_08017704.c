#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017704.
 * sub_08017704 @ 0x08017704
 *
 * Named per Xenesis's AW2 Subroutine List: "Routine that subtracts battle
 * maps points upon a purchase." Returns 0 (can't afford) or, via the UB
 * fallthrough documented below, the amount just spent. The old sub_XXXXXXXX
 * symbol is kept as a linker alias below so every other unit keeps
 * resolving it unchanged.
 */

/* No return on the fall-through path: the original leaves the argument in r0.
 * UB in C, correct here -- adding `return a;` flips both the block layout and
 * the register allocation. */
u32 TrySpendBattleMapPoints(u32 a)
{
    if (gUnknown_0200C420.unk00 < a)
        return 0;
    gUnknown_0200C420.unk00 -= a;
}

asm(".global sub_08017704\n.thumb_set sub_08017704, TrySpendBattleMapPoints\n");
