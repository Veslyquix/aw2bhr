#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080787B8.
 * sub_080787B8 @ 0x080787B8
 */

#include "proc.h"

/* A conditional variant of the family-F035 display-list builders that
 * src/decomp/c_08078790.c documents. Two of the four builders are CHAINED --
 * `bl sub_08078658` then `bl sub_08078608` with no argument setup between them
 * is a nest, exactly as in src/decomp/c_08078864.c -- and the third is applied
 * only when sub_0803CBD8(0x6b) holds.
 *
 * The two `adds r4, r0, #0` copies, the first of which is dead, are the tell
 * for ONE binding local assigned twice rather than two locals or a nested
 * expression: the pseudo lives in r4 across the sub_0803CBD8 call, so each
 * assignment emits its copy even though only the second is read. */

void sub_080787B8(void)
{
    s32 i;

    sub_080785FC();
    i = sub_08078658(0);
    i = sub_08078608(i);

    if (sub_0803CBD8(0x6b))
    {
        sub_080786A4(i);
        sub_08078770();
    }
    else
    {
        sub_08078740();
    }
}
