#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08026F04.
 * sub_08026F04 @ 0x08026F04
 *
 * Named per Xenesis's AW2 Datasheet: "Loads a player's current income and
 * adds it to the player's current funds." The old sub_XXXXXXXX symbol is
 * kept as a linker alias below so every other unit keeps resolving it
 * unchanged.
 */

/* One statement. gUnknown_030033EC is loaded once and serves as both
 * AddPlayerFunds's `u16` first argument and the index of the element whose unk08
 * supplies the second -- which is why the `ldrh` sits before the array's own
 * pool word. unk08 was filler until wave 29; the whole-word `ldr` at +8 and
 * AddPlayerFunds's declared `u32` parameter are what name it. */

void AddPlayerIncomeToFunds(void)
{
    AddPlayerFunds(gUnknown_030033EC, gUnknown_08499598[gUnknown_030033EC].unk08);
}

asm(".global sub_08026F04\n.thumb_set sub_08026F04, AddPlayerIncomeToFunds\n");
