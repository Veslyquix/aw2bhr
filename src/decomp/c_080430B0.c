#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080430B0.
 * sub_080430B0 @ 0x080430B0, sub_08043120 @ 0x08043120, sub_08043190 @ 0x08043190, sub_08043200 @ 0x08043200
 *
 * Named per Xenesis's AW2 Subroutine List: "Attack Value of CO" / "Defence
 * Value of CO" / "Movement Bonus of CO" / "Range Bonus of CO" for the four
 * functions in this family respectively -- matches the `varies` s16 index K
 * (0/1/2/3) documented below, which selects which of the four stats to read
 * out of the same per-CO/power-state/unit-class table. Parameters named from
 * that: `a` indexes gUnknown_085D3DD0 (a CO), `b` indexes its `.unk38` (a CO
 * Power state), `c` indexes gUnknown_085D5ABC (a unit type) both directly and
 * via GetUnitCombatClassColumn. The old sub_XXXXXXXX symbols are kept as
 * linker aliases below so every other unit keeps resolving them unchanged.
 */

/* Family F049: four copies of one body that differ ONLY in the s16 index K
 * (0, 1, 2, 3 -- `movs rN, #0/2/4/6` at the three `ldrsh` sites), exactly as
 * data/families.json `varies` says.
 *
 * Three things had to be read off the ROM rather than guessed:
 *
 * 1. struct Unk085D3DD0Entry.unk24 is an array of POINTERS. The ROM does
 *    `ldr r7,[r3]` on the table word and then `ldrsh r0,[r7,r2]` through the
 *    result. 0x24 + 8*4 == 0x44 fills the record exactly, and the two indices
 *    in use (gUnknown_085D5ABC[c].unk18, and GetUnitCombatClassColumn's 5/6/7) span it.
 *
 * 2. Both lookups happen BEFORE the gUnknown_03003FC0.unk08 early-out. That is
 *    not scheduling -- agbcc will not hoist a load above a branch -- so the
 *    two assignments really are the first two statements, unlike the F038
 *    accessors in c_08042E2C.c where the early-out comes first.
 *
 * 3. gUnknown_085D5ABC is NOT const, and that is what the second
 *    `ldrb r0,[r6,#0x18]` proves. With the header's old `const` the load is
 *    CSEd across `bl GetUnitCombatClassColumn`, the value rather than the address lives in
 *    r6, and the function is two bytes short. See the note on the declaration
 *    in include/unknown-globals.h.
 *
 * The dead `ldr r7, =gUnknown_085D3DD0` at the top and the folded pool word
 * `gUnknown_085D3DD0 + 0x5c` (which asm/ symbolises as gUnknown_085D3E2C) both
 * fall straight out of the plain member spelling under -fforce-addr; neither
 * is something to reproduce by hand. */

int GetCoAttackBonus(int a, int b, int c)
{
    s16 *p;
    s16 *q;

    p = gUnknown_085D3DD0[a].unk38[b].unk24[gUnknown_085D5ABC[c].unk18];
    q = gUnknown_085D3DD0[a].unk38[b].unk24[GetUnitCombatClassColumn(c)];

    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    if (gUnknown_085D5ABC[c].unk18 == 0)
        return p[0];

    return p[0] + q[0];
}

/* See GetCoAttackBonus above for the shared analysis this family relies on. */

int GetCoDefenceBonus(int a, int b, int c)
{
    s16 *p;
    s16 *q;

    p = gUnknown_085D3DD0[a].unk38[b].unk24[gUnknown_085D5ABC[c].unk18];
    q = gUnknown_085D3DD0[a].unk38[b].unk24[GetUnitCombatClassColumn(c)];

    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    if (gUnknown_085D5ABC[c].unk18 == 0)
        return p[1];

    return p[1] + q[1];
}

/* See GetCoAttackBonus above for the shared analysis this family relies on. */

int GetCoMovementBonus(int a, int b, int c)
{
    s16 *p;
    s16 *q;

    p = gUnknown_085D3DD0[a].unk38[b].unk24[gUnknown_085D5ABC[c].unk18];
    q = gUnknown_085D3DD0[a].unk38[b].unk24[GetUnitCombatClassColumn(c)];

    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    if (gUnknown_085D5ABC[c].unk18 == 0)
        return p[2];

    return p[2] + q[2];
}

/* See GetCoAttackBonus above for the shared analysis this family relies on. */

int GetCoRangeBonus(int a, int b, int c)
{
    s16 *p;
    s16 *q;

    p = gUnknown_085D3DD0[a].unk38[b].unk24[gUnknown_085D5ABC[c].unk18];
    q = gUnknown_085D3DD0[a].unk38[b].unk24[GetUnitCombatClassColumn(c)];

    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    if (gUnknown_085D5ABC[c].unk18 == 0)
        return p[3];

    return p[3] + q[3];
}

asm(".global sub_080430B0\n.thumb_set sub_080430B0, GetCoAttackBonus\n"
    ".global sub_08043120\n.thumb_set sub_08043120, GetCoDefenceBonus\n"
    ".global sub_08043190\n.thumb_set sub_08043190, GetCoMovementBonus\n"
    ".global sub_08043200\n.thumb_set sub_08043200, GetCoRangeBonus\n");
