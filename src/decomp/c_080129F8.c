#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080129F8.
 * sub_080129F8 @ 0x080129F8
 */

/* A percent-chance roll: draw from the sub_080129E0 LCG, reduce mod 10000 and
 * compare against a * 100, so the parameter is a percentage in hundredths.
 * `__umodsi3` and `blo` make both sides unsigned, which follows from
 * sub_080129E0's declared u32 return.
 *
 * `movs #0; b` / `movs #1` split across the pool is the if/else-return form,
 * not a returned comparison -- a returned comparison would preset the false
 * value and arrive via `adds r0, r1, #0` with no unconditional branch. */
int sub_080129F8(u16 a)
{
    if (sub_080129E0() % 10000 < a * 100)
        return 1;

    return 0;
}
