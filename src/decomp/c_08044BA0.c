#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044BA0.
 * sub_08044BA0 @ 0x08044BA0
 */

/* `lo` is a local rather than a literal, and that is the whole function: agbcc
 * folds a comparison against a LITERAL 10 into `<= 9` (`cmp r0,#9; ble`),
 * where the ROM has `cmp r0,#10; blt`. Bound to a single-assignment local the
 * comparison is variable-vs-variable at tree-fold time, so the LT survives and
 * RTL later substitutes the 10 straight into the compare's immediate. Binding
 * the upper bound too is byte-neutral, so only this one is load-bearing.
 */
int sub_08044BA0(int a1)
{
    int lo;

    lo = 0xa;
    if (a1 > 0xe)
        return 0;
    if (a1 < lo)
        return 0;
    return 1;
}
