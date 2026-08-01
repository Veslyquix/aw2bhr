#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08007F68.
 * sub_08007F68 @ 0x08007F68
 */

/* THREE parameters, and the third is invisible until you notice what is
 * missing: the first `bl sub_08001158` sets r0 and r1 and leaves r2 alone, so
 * r2 arrives from this function's own caller and is forwarded untouched.
 *
 * The rest is the row above: if the cell at (x, y - 1) already holds kind 1,
 * rewrite it as 1, then hand (x, y) to sub_08007D70. sub_0800119C returns int
 * -- the ROM tests r0 with no narrowing, and its body returns a plain 0 or 1
 * through `adds r0, r2, #0`. */
void sub_08007F68(int x, int y, int v)
{
    int y2;

    sub_08001158(x, y, v);

    y2 = y - 1;

    if (sub_0800119C(x, y2, 1))
        sub_08001158(x, y2, 1);

    sub_08007D70(x, y);
}
