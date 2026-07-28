#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803DF98.
 * sub_0803DF98 @ 0x0803DF98
 */

/* Fills a {u16, u16} pair out of a mode id in 2..8. void, not int: its caller
 * sub_0803E108 allocates the pair on its own stack and re-reads both halves
 * with `ldrh` after the `bl`, never touching r0.
 *
 * The three tails cross-jump automatically, so the only thing the source has
 * to get right is the ORDER of the case blocks -- GCC emits them in source
 * order, and putting the {1,1} arm second (the natural reading order of the
 * case labels) puts the two `strh`-sharing blocks the wrong way round.
 */
void sub_0803DF98(int a, u16 *out)
{
    switch (a)
    {
    case 3:
    case 5:
        out[0] = 1;
        out[1] = 1;
        break;

    case 2:
    case 7:
    case 8:
        out[0] = 1;
        out[1] = 2;
        break;

    default:
        out[0] = 0;
        out[1] = 0;
        break;
    }
}
