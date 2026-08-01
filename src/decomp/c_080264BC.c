#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080264BC.
 * sub_080264BC @ 0x080264BC
 */

/* The same percentage ramp as sub_080263A4, but over a unit's own current and
 * maximum values instead of a chapter threshold, and with a mode-dependent
 * baseline of 10 or 20.
 *
 * sub_08025CF0 / sub_08025D08 are taken with a bare `adds rN, r0, #0` and NO
 * re-narrowing, which is what re-typed both from `u8` to `int` this wave; see
 * the correction in include/unknown-functions.h.
 *
 * The `- 100` is a statement of its own. Folded into one expression agbcc
 * computes `(n + 100) - q` and spends an extra `adds` on the constant; the ROM
 * subtracts 100 from the quotient and only then negates against n.
 *
 * The result is assigned back into `x`, not to a fresh local. That is what puts
 * it in r4 -- x's own register, dead by then -- rather than r0. */
u8 sub_080264BC(u8 a)
{
    int n;
    int x;
    int y;
    int p;

    if (sub_080266DC(a))
    {
        n = gUnknown_03003FC0.unk01 == 1 ? 0x14 : 0xa;
        x = sub_08025CF0(a);
        y = sub_08025D08(a);

        if (x != 0 && x >= y)
        {
            p = y * 100 / x - 100;
            x = n - p;
            if (x > 0x63)
                return 100;
            if (x >= 0)
                return x;
        }
    }
    return 0;
}
