#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080433B8.
 * sub_080433B8 @ 0x080433B8, sub_080433C8 @ 0x080433C8, sub_080433D8 @ 0x080433D8, sub_080433E8 @ 0x080433E8
 *
 * sub_080433D8 is named per Xenesis's AW2 Subroutine List: "Subroutine that
 * gets the unit's base cost". The other three in this family aren't
 * separately cited there, but each feeds exactly one Xenesis-named "+ CO
 * Boosts" total in src/decomp/c_08042C24.c (base movement into
 * GetUnitMovementWithCoBonus, base firing range into
 * GetUnitFiringRangeWithCoBonus, base vision into
 * GetUnitVisionWithCoBonus), so they're named by that structural analogy
 * rather than a direct citation. The old sub_XXXXXXXX symbols are kept as
 * linker aliases below so every other unit keeps resolving them unchanged.
 */

/* All four return `int`, not the u8/u16 they were first promoted with. The
 * bodies are bare ldrb/ldrh member loads and are byte-identical either way, so
 * the width was a body-side guess with no oracle. Wave 26 produced the first
 * promoted callers and they settle it: sub_08042C9C does `bl sub_080433D8;
 * adds r6, r0, #0` and multiplies with r6 later -- no re-narrowing after the
 * bl with the value used, which a u16 return cannot produce (agbcc re-narrows
 * a narrow-returning callee's result at every call site). sub_08042D1C,
 * sub_08042D50 and sub_08042D84 show the same for the other three. Settled
 * from the callers; all four re-verified byte-exact after the change. */

int GetUnitBaseMovement(int a)
{
    return gUnknown_085D5ABC[a].unk0a;
}

int GetUnitBaseFiringRange(int a)
{
    return gUnknown_085D5ABC[a].unk0f;
}

int GetUnitBaseCost(int a)
{
    return gUnknown_085D5ABC[a].unk06;
}

int GetUnitBaseVision(int a)
{
    return gUnknown_085D5ABC[a].unk0c;
}

asm(".global sub_080433B8\n.thumb_set sub_080433B8, GetUnitBaseMovement\n"
    ".global sub_080433C8\n.thumb_set sub_080433C8, GetUnitBaseFiringRange\n"
    ".global sub_080433D8\n.thumb_set sub_080433D8, GetUnitBaseCost\n"
    ".global sub_080433E8\n.thumb_set sub_080433E8, GetUnitBaseVision\n");
