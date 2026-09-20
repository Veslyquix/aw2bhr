#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034780.
 * sub_08034780 @ 0x08034780
 */

/* Named per Xenesis's AW2 Subroutine List: "Sets the default rules (Used
 * for War Room, used to clear after a campaign map)". The old sub_08034780
 * symbol is kept as a linker alias below so every other unit keeps
 * resolving it unchanged. */
void SetDefaultRules(void)
{
    gUnknown_030040F0 = 0;
    gUnknown_030044A0 = 0;

    gPlaySt.aiControlled[1] = 1;
    gPlaySt.aiControlled[2] = 1;
    gPlaySt.aiControlled[3] = 1;
    gPlaySt.aiControlled[4] = 1;
    gPlaySt.armyColor[1] = 1;
    gPlaySt.armyColor[2] = 2;
    gPlaySt.armyColor[3] = 3;
    gPlaySt.armyColor[4] = 4;
    gPlaySt.co[1] = 1;
    gPlaySt.co[2] = 2;
    gPlaySt.co[3] = 4;
    gPlaySt.co[4] = 0xb;

    sub_08026900();

    gPlaySt.unk30 = 0;
    gPlaySt.unk31 = 0;
    gPlaySt.propertyFunds = 1000;
    gPlaySt.unk24 = 0;
    gPlaySt.unk10[1] = 0;
    gPlaySt.unk10[2] = 0;
    gPlaySt.unk10[3] = 0;
    gPlaySt.unk10[4] = 0;
    gPlaySt.unk0d = 0;
    gPlaySt.unk2f = 0;
    gPlaySt.unk2c = 0;
    gPlaySt.unk2d = 0;
    gPlaySt.unk2e = 0;
    gPlaySt.unk04 = 3;
    gPlaySt.dispMiniPanel = 1;
    gPlaySt.unk06 = 0;
    gPlaySt.coAbilities = 1;
    gPlaySt.unk07 = 1;
    gPlaySt.unk09 = gUnknown_0200C420.unk0e;
    gPlaySt.unk0c = (gUnknown_0200C420.unk14 == 0);
}

asm(".global sub_08034780\n.thumb_set sub_08034780, SetDefaultRules\n");
