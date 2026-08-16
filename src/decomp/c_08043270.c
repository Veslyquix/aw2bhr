#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043270.
 * sub_08043270 @ 0x08043270, sub_080432A8 @ 0x080432A8
 *
 * Named per Xenesis's AW2 Subroutine List: sub_08043270 = "Gathers Cost
 * Bonus of CO. Input of CO ID, Power Status and Unit ID. Outputs cost
 * bonuses in r0", sub_080432A8 = "Gathers vision bonus of CO". The old
 * sub_XXXXXXXX symbols are kept as linker aliases below so every other unit
 * keeps resolving them unchanged.
 */

/* Family F038, the shape of the dozen accessors in src/decomp/c_08042E2C.c.
 * The address arithmetic `(a * 65 + b * 17) * 4` is already encoded by
 * struct Unk085D3DD0 (0x104) holding struct Unk085D3DD0Entry unk38[3] (0x44),
 * so the only thing to read out of the assembly is the member: the ROM's
 * `adds r0, #0x4c` is 0x38 + 0x14, i.e. unk14.
 *
 * `movs r1, #0; ldrsh r0, [r0, r1]` is not a variation on the matched siblings
 * -- every member of F038 uses it, including sub_08042E2C/E84/FC4 -- it is just
 * how an s16 member is reached once the offset has been folded onto the base.
 * No re-narrowing after the load, so the return is `int`.
 *
 * THREE parameters, not the two this was first promoted with. The third is
 * unused in this member's body, so the body cannot tell you -- the evidence is
 * the call site: sub_08042C9C (wave 26, byte-exact) materialises `adds r2, r5,
 * #0` immediately before the bl, which only an argument produces, and the
 * sibling sub_08043200 takes and uses the same three. An unused trailing
 * parameter is byte-neutral here; re-verified with trymatch after the change. */

int GetCoCostBonus(int a, int b, int c)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk38[b].unk14;
}

/* Family F038, the twin of GetCoCostBonus one member down: the ROM's
 * `adds r0, #0x44` is 0x38 + 0x0c, i.e. unk0c. See the note on GetCoCostBonus. */

int GetCoVisionBonus(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk38[b].unk0c;
}

asm(".global sub_08043270\n.thumb_set sub_08043270, GetCoCostBonus\n"
    ".global sub_080432A8\n.thumb_set sub_080432A8, GetCoVisionBonus\n");
