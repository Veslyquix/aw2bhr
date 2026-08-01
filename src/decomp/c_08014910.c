#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014910.
 * sub_08014910 @ 0x08014910, sub_0801496C @ 0x0801496C
 */

/* Seeds slot `d` of the three gUnknown_0200BC14 arrays and then forwards the
 * untouched arguments to sub_0801489C with a fifth argument of 0. That 0 is
 * ONE quantity: it is both the unk000 store and the stack argument, which is
 * what costs the extra callee-saved register (sb) -- sub_0801496C, whose fifth
 * argument is 1, needs one fewer.
 *
 * The +0x400 word array is new in wave 32; see struct Unk0200BC14. */
u16 sub_08014910(int a1, u16 b, u16 c, u16 d)
{
    gUnknown_0200BC14.unk000[d] = 0;
    gUnknown_0200BC14.unk400[d] = a1;
    gUnknown_0200BC14.unk408[d] = b;

    return sub_0801489C(a1, b, c, d, 0);
}

/* sub_08014910 with sub_0801489C's fifth argument 1 instead of 0. See that
 * function for why this one is eight bytes shorter: the 0 there is shared
 * between the unk000 store and the stack word, here they are two constants. */
u16 sub_0801496C(int a1, u16 b, u16 c, u16 d)
{
    gUnknown_0200BC14.unk000[d] = 0;
    gUnknown_0200BC14.unk400[d] = a1;
    gUnknown_0200BC14.unk408[d] = b;

    return sub_0801489C(a1, b, c, d, 1);
}
