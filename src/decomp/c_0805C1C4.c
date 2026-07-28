#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805C1C4.
 * sub_0805C1C4 @ 0x0805C1C4
 */

/* `bls` is an unsigned compare, so the global is u32 and the guard is the
 * canonical `i < N` form (`cmp #N-1; bls`). The pool sitting between the two
 * return blocks is the `if (C) return A; return B;` shape rather than a
 * ternary, which would compute into r1 and put the pool after the `bx lr`. */
int sub_0805C1C4(void)
{
    if (gUnknown_03004770 < 2)
        return 1;

    return 0;
}
