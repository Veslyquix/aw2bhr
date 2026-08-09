#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08059E00.
 * sub_08059E00 @ 0x08059E00
 */

/* gUnknown_0816D96C is five ascending u16 thresholds ending in 0xFFFF; the
 * ROM copies all ten bytes onto its own stack before walking them, so the
 * copy is in the source rather than a direct table read.
 *
 * The `return` INSIDE the loop is load-bearing. Written as `while (a > v[i])
 * i++;` agbcc rotates the loop -- it copies the test to the bottom, jumps into
 * the middle, and const-folds the first address computation into a preheader
 * `mov r0, sp` -- which is 2 bytes over. A loop whose only exit is a `return`
 * has no loop-exit test to rotate, so the test stays at the top and the bottom
 * is the bare `b`, which is the ROM. */
u8 sub_08059E00(u16 a)
{
    u16 v[5];
    u8 i;

    sub_0808B6E8(v, gUnknown_0816D96C, 10);
    i = 0;
    while (1)
    {
        if (a <= v[i])
            return i + 1;
        i++;
    }
}
