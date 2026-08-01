#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802490C.
 * sub_0802490C @ 0x0802490C, sub_08024944 @ 0x08024944, sub_08024984 @ 0x08024984
 */

/* `ldr r1,=0xFF4C0000; adds r0,r0,r1; lsrs r0,#0x10` is the id range test
 * `(u16)(a1 - 0xb4) <= 0xb` done on the still-shifted parameter -- one add and
 * one shift instead of a pair of compares. The 12 ids 0xb4..0xbf are the ones
 * sub_0803CD14 owns; everything else reads the row's own unk18.
 *
 * The branch polarity is load-bearing: agbcc branches on the TRUE condition to
 * the FIRST return's block and leaves the second in the fall-through, so
 * writing the range test the other way round swaps the two bodies. Measured.
 *
 * The `lsls #0x18; lsrs #0x18` before the `bl` is the conversion to
 * sub_0803CD14's `u8`; the one AFTER it is this function's own `u8` return
 * conversion, not a re-narrowing -- sub_0803CD14 returns `int`. */

u8 sub_0802490C(u16 a1)
{
    if ((u16)(a1 - 0xB4) <= 0xB)
        return sub_0803CD14(a1 + 0x4C);

    return gUnknown_085C77A0[a1].unk18;
}

/* The name-string twin of sub_0802490C -- same 0xb4..0xbf range test, same
 * branch polarity. Here the fallback is gUnknown_08610A38[row.unk14], a table
 * of `u8 *`, which is why the return is a pointer and nothing narrows
 * sub_0803CCEC's result. */

u8 *sub_08024944(u16 a1)
{
    if ((u16)(a1 - 0xB4) <= 0xB)
        return sub_0803CCEC(a1 + 0x4C);

    return gUnknown_08610A38[gUnknown_085C77A0[a1].unk14];
}

/* One accumulator, not two returns: the value lives in r1 across both arms and
 * only reaches r0 in the shared `adds r0, r1, #0` at the end, which is what an
 * assigned local gives and a pair of `return`s does not.
 *
 * The `||` is read off the branch pair -- `beq` into the second block on the
 * first test and `bne` past it on the second, i.e. either condition enters the
 * override. The tail is src/decomp/c_080249C8.c's shape: `i = a & 0xe0`, zero
 * short-circuits, and `i >> 5` is an ARITHMETIC shift, so a1 is signed. */

int sub_08024984(int a1)
{
    int r = gUnknown_085C77A0[gUnknown_03003FC0.unk02].unk58;

    if (r == 0 || (a1 & 0x1F) == 8)
    {
        int i = a1 & 0xE0;

        if (i != 0)
            r = sub_08042DE0(i >> 5);
        else
            r = 0;
    }

    return r;
}
