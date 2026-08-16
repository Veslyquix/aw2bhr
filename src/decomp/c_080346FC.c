#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080346FC.
 * sub_080346FC @ 0x080346FC
 */

/* MATCHED, wave 43 (W43-C), first attempt.
 *
 * NEEDS ITS .rodata POOL WORD PLACED. Add to this function's
 * data/promoted.json entry:
 *     "rodata": ["0x08090D8C"]
 * then re-run tools/split_rodata.py and tools/gen_lds.py before building.
 * 0x08090D8C holds 0x03003FC0, i.e. &gUnknown_03003FC0. The honest spelling
 * reproduces it exactly, including the reload of the address after the loop
 * (`ldr r3, [r7]`) that the -fforce-addr indirection forces. See the
 * non-consecutive-words promotion warning in sub_08033F1C's note.
 *
 * A `switch`, NOT an `if`/`else if` chain, and the case bodies are in the
 * order written below. The dispatch puts both comparisons at the top
 * (`cmp #1; beq` then `cmp #2; bne`) and then emits case 2's body BEFORE case
 * 1's: expand_case sorts the decision tree by case VALUE but lays the bodies
 * out in SOURCE order, so the physical layout is what pins the source
 * ordering. An `if (x == 1) ... else if (x == 2) ...` chain emits case 1's
 * body first and does not match. This is a second, independent tell for the
 * switch alongside the brief's literal-low-bound one.
 *
 * The literal 2 in case 2 comes out as `strb r1` rather than a fresh `movs`
 * because cse.c's record_jump_equiv knows r1 == 2 on the fall-through of
 * `cmp r1,#2; bne`. Writing the constant is correct; reading the field back
 * would be a different and wrong source.
 *
 * gUnknown_085C77E0 is NOT a global: it is `gUnknown_085C77A0 + 0x40`, and
 * `gUnknown_085C77A0[n].unk40[i]` emits that base as an LICM-hoisted address
 * constant, which trymatch reports as resolving to the same address.
 * gUnknown_03003FC0.unk02 is reloaded every iteration rather than hoisted
 * because the loop stores into unk38 of the same struct and agbcc cannot
 * prove the two do not alias.
 *
 * Named per Xenesis's AW2 Subroutine List: "Clears RAM after a campaign map
 * completion" -- calls SetDefaultRules (the actual reset) and then applies
 * mode-specific overrides on top, rather than clearing memory directly. The
 * old sub_080346FC symbol is kept as a linker alias below so every other
 * unit keeps resolving it unchanged. */

void ResetRulesAfterCampaignMap(void)
{
    int i;

    SetDefaultRules();

    switch (gUnknown_03003FC0.unk01)
    {
    case 2:
        gUnknown_03003FC0.unk38[1] = 1;
        gUnknown_03003FC0.unk38[2] = 2;
        gUnknown_03003FC0.unk38[3] = 2;
        gUnknown_03003FC0.unk38[4] = 2;
        break;

    case 1:
        for (i = 0; i < 4; i++)
        {
            if (gUnknown_085C77A0[gUnknown_03003FC0.unk02].unk40[i] == 5)
                gUnknown_03003FC0.unk38[i + 1] = 2;
            else
                gUnknown_03003FC0.unk38[i + 1] = 1;
        }

        if (gUnknown_085C77A0[gUnknown_03003FC0.unk02].unk17 != 0)
            gUnknown_03003FC0.unk0d = 1;
        break;
    }
}

asm(".global sub_080346FC\n.thumb_set sub_080346FC, ResetRulesAfterCampaignMap\n");
