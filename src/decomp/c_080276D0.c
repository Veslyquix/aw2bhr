#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080276D0.
 * sub_080276D0 @ 0x080276D0, sub_080276F0 @ 0x080276F0
 */

/* The 0 half of a pair with sub_080276F0, which is the same three lines with 1
 * and gUnknown_08090A98[1]. The `ldrsh` element is named twice in the source --
 * once into gUnknown_03003130.unk04 and once as sub_0804360C's argument -- and
 * CSE leaves it in r0 across the store. */
void sub_080276D0(void)
{
    gUnknown_03003130.unk00 = 0;
    gUnknown_03003130.unk04 = gUnknown_08090A98[0];
    sub_0804360C(gUnknown_08090A98[0]);
}

/* The 1 half of the sub_080276D0 pair -- see there. */
void sub_080276F0(void)
{
    gUnknown_03003130.unk00 = 1;
    gUnknown_03003130.unk04 = gUnknown_08090A98[1];
    sub_0804360C(gUnknown_08090A98[1]);
}
