#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080432E0.
 * sub_080432E0 @ 0x080432E0
 *
 * Not itself Xenesis-documented, but named for what its caller
 * (GetCoAttackBonus and siblings, src/decomp/c_080430B0.c) uses it for:
 * mapping a unit's 3-valued combat-class tag onto which column of the
 * per-CO/power-state stat table to read. The old sub_XXXXXXXX symbol is
 * kept as a linker alias below so every other unit keeps resolving it
 * unchanged.
 */

/* Maps the 3-valued tag at +0x0e onto a column index. `int`, not u8: its
 * caller GetCoAttackBonus does `lsls r0, r0, #2` straight off the `bl` with no
 * re-narrowing.
 *
 * The local has to be `u32`. The whole shape hangs on it: an UNSIGNED
 * comparison gives `cmp #1; bls` for the first test, a signed one gives `ble`
 * -- one bit of encoding, no size difference. And a `switch` statement does
 * not reach this at all in any case order (four spellings probed): it expands
 * to two linear `cmp/beq` equality tests, never the range test plus a single
 * equality test the ROM has, even though the two come out the same 36 bytes.
 */
int GetUnitCombatClassColumn(int a)
{
    u32 v = gUnknown_085D5ABC[a].unk0e;

    if (v > 1)
        return 6;

    if (v == 1)
        return 5;

    return 7;
}

asm(".global sub_080432E0\n.thumb_set sub_080432E0, GetUnitCombatClassColumn\n");
