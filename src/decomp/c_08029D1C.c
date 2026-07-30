#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08029D1C.
 * sub_08029D1C @ 0x08029D1C
 */

/* MATCHED, and the first of a byte-identical pair with sub_0802A2E4. Returns
 * the sum of two counters over the same object.
 *
 * `return f(p, 0) + g(p, 0);` -- the two results are summed, so neither call is
 * a tail call and the function keeps a frame. The `pop {r1}; bx r1` epilogue is
 * the return-a-value shape, against the `pop {r0}` that means void. */
int sub_08029D1C(void *p)
{
    return sub_08029978(p, 0) + sub_08029A48(p, 0);
}
