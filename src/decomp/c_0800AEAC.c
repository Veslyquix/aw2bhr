#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800AEAC.
 * sub_0800AEAC @ 0x0800AEAC
 */

/* MATCHED, wave 57 (W57-F). 120 bytes, byte-for-byte identical.
 *
 * Wave 52 parked this size-exact at 50.8% with ONE extra `b` and diagnosed it
 * as "a jump.c block-placement tie, so the permuter is the right tool". It is
 * not a tie, it is a source shape, and the rule is now a chapter in
 * docs/agbcc-codegen.md:
 *
 *   The value returned by the LAST statement gets the block that falls into
 *   the epilogue. Every other returned value's block is placed at the LAST
 *   site of that value inside the FIRST if/else arm, and sites in later arms
 *   reach it by a BACKWARD conditional branch.
 *
 * The ROM has `movs r0,#1; b _0800AF1C` mid-function at the mask chain's
 * fall-through and `movs r0,#0` falling into the epilogue, so `return 0;` is
 * the trailing statement and every `return 1;` is a conditional return inside
 * an arm. Wave 52's draft closed the `v != 0` block with a plain `return 1;`,
 * which makes agbcc keep the merged block at the TAIL and pay a `b` at the
 * mask chain's fall-through -- the whole 2-byte residual.
 *
 * Identified with one compile_probe carrying three variants: the mirror image
 * (conditional `return 0;`s in the arms, single trailing `return 1;`) emits the
 * ROM's instruction COUNT with the two blocks swapped.
 *
 * Settled by wave 52 and unchanged: the return is `int`; `w <= 0` not `w < 0`;
 * the second `sub_0800A6AC(x, y)` really is a second call with the same
 * arguments; this is NOT do_store_flag.
 */

int sub_0800AEAC(int x, int y)
{
    int v;
    int w;

    v = sub_0800A6AC(x, y);
    if (v < 0)
        return 0;
    if (v != 0)
    {
        w = sub_0800A95C(x, y);
        if (w == 0)
            return 1;
        if (w > 0)
        {
            if ((v & 0xFE00) == 0x4000)
                return 1;
            if ((v & 0xFE00) == 0x2000)
                return 1;
            if ((v & 0xFE00) == 0)
                return 1;
        }
    }
    else
    {
        if (sub_0800A6AC(x, y) < 0)
            return 0;
        v = sub_0800A884(x, y);
        if (v == 0)
            return 0;
        w = sub_0800A95C(x, y);
        if (w != 0)
            v = w;
        if (v > 0)
            return 1;
    }
    return 0;
}
