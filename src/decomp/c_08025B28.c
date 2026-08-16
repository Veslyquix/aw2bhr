#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08025B28.
 * sub_08025B28 @ 0x08025B28, sub_08025B58 @ 0x08025B58, sub_08025B80 @ 0x08025B80
 *
 * Named per Xenesis's AW2 Datasheet/Subroutine List (community RE notes,
 * cross-referenced independently of this fork's own wave process). The
 * original sub_XXXXXXXX symbol is kept as a linker alias (see the bottom of
 * this file) so every other unit -- asm/ and already-promoted C alike --
 * keeps resolving it under the old name without needing to change.
 */

/* Binding the deref to a local is what keeps `ldr r3,[r2]` out of the second
 * and third statements: repeating gUnknown_08499598[a] would reload the
 * pointer after each store (see sub_08044178), and the target loads it once.
 */
/* Xenesis's Datasheet: a caller of this function is annotated "Checks
 * whether repairs can be afforded" -- consistent with subtracting a cost
 * from funds (unk00) while accumulating it into unk04, the same 999999 clamp
 * AddPlayerFunds applies to unk00. */
void SubtractPlayerFunds(u16 a, u32 b)
{
    struct Unk08499598 *arr = gUnknown_08499598;

    arr[a].unk00 -= b;
    arr[a].unk04 += b;
    if (arr[a].unk04 > 999999)
        arr[a].unk04 = 999999;
}

/* Xenesis's Datasheet: "Fund Adder subroutine, input r0 = Player, r1 = Funds". */
void AddPlayerFunds(u16 a, u32 b)
{
    struct Unk08499598 *arr = gUnknown_08499598;

    arr[a].unk00 += b;
    if (arr[a].unk00 > 999999)
        arr[a].unk00 = 999999;
}

/* unk06_0 is a 7-bit field: the clear path emits `movs #0x80; rsbs` (= ~0x7f)
 * where a bare movs would have done, and the read is the two-instruction
 * `lsls #25; lsrs #25` double shift rather than a shift/mask triple.
 */
/* Xenesis's Datasheet: "Fuel Subtraction applicator function (runs after a
 * unit's move is completed). Input of r0 = Unit Pointer, r1 = Fuel to
 * Subtract". */
void SubtractUnitFuel(struct Unk08499594 *s, u8 b)
{
    if (s->unk06_0 >= b)
        s->unk06_0 -= b;
    else
        s->unk06_0 = 0;
}

asm(".global sub_08025B28\n.thumb_set sub_08025B28, SubtractPlayerFunds\n"
    ".global sub_08025B58\n.thumb_set sub_08025B58, AddPlayerFunds\n"
    ".global sub_08025B80\n.thumb_set sub_08025B80, SubtractUnitFuel\n");
