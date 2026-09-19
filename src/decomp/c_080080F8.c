#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080080F8.
 * sub_080080F8 @ 0x080080F8
 */

/* Repaints one cell through four independent terrain tests, each a
 * sub_0800119C query on the same (x, y). The first re-reads the cell's own
 * tile through gMap->tile and, when it is one of the two bridge ids, clears it
 * unless the cell below is joinable.
 *
 * sub_0800B61C returns s16 -- the `lsls #0x10 / asrs #0x10` before the sign
 * test is agbcc re-narrowing a narrow-returning callee, and the narrowed value
 * in r2 is then handed straight to sub_08001158 as its third argument.
 *
 * Permuter-derived, so byte-exact but not claimed to be the original source:
 * the cell's tile has to land in r2 rather than r0, which the `v` local plus
 * the split-out sub_080016D0 call achieves. */
void sub_080080F8(int x, int y)
{
    s16 height;

    if (sub_0800119C(x, y, 1))
    {
        int off;
        int v;

        off = gMap->rowOffset[y] + x;
        v = gMap->tile[off];

        if (v == 0x43 || v == 3)
        {
            if (!sub_0800119C(x, y + 1, 3))
                sub_08001158(x, y, 1);
        }

        v = sub_080016D0(x, y);
        sub_08001158(x, y, v);
    }

    if (sub_0800119C(x, y, 3))
        sub_0800B048(x, y);

    if (sub_0800119C(x, y, 5))
    {
        sub_08001158(x, y, sub_0800F418(x, y));
        sub_08001158(x, y, sub_080016D0(x, y));
    }

    if (sub_0800119C(x, y, 0xd))
    {
        s16 w;

        height = sub_0800B61C(x, y);
        w = height;

        if (w < 0)
            sub_08007CA0(x, y);
        else
            sub_08001158(x, y, w);
    }
}
