#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08037D80.
 * sub_08037D80 @ 0x08037D80, sub_08037DA4 @ 0x08037DA4
 */

/* MATCHED, and the first of a byte-identical pair with sub_08037DA4. A
 * four-way classifier on three thresholds.
 *
 * The LAST test is `if (a <= 0x117) return 4; return 5;` and not
 * `if (a > 0x117) return 5; return 4;`. Both are the same predicate and the
 * first two arms are written the other way round, so this is not a style
 * choice: gcc emits `jump_if_not(cond)` to the code that follows the `if`, so
 * the arm that FALLS THROUGH in the ROM is the one that must be written last.
 * Here the fall-through is 5, which puts 4 inside the `if`. Read the
 * conditional branch's SENSE against the arm order, not against the
 * comparison. */
int sub_08037D80(int a)
{
    if (a <= 0xC7)
        return 2;
    if (a <= 0xF9)
        return 3;
    if (a <= 0x117)
        return 4;
    return 5;
}

/* MATCHED. Byte-for-byte the same function as sub_08037D80 -- identical
 * instruction stream and identical pool words. One C body, two
 * addresses; read that one for the derivation. */
int sub_08037DA4(int a)
{
    if (a <= 0xC7)
        return 2;
    if (a <= 0xF9)
        return 3;
    if (a <= 0x117)
        return 4;
    return 5;
}
