#include "global.h"

/* sub_0805634C @ 0x0805634C
 *
 * `c = sub_0805653C(c, b)` -- the callee's arguments are the THIRD and SECOND
 * of this function's, in that order, read off the call site. t is u32: the ROM
 * keeps it in r8 with no re-narrowing and both loops below compare it `blo` /
 * `bhs` against a u16 counter.
 *
 * The `p = gUnknown_08551E64[...]` binding is source-written and not a LICM
 * hoist: the ROM's `ldr`/`mov sl` pair sits BEFORE the `movs r4, #0` that is
 * the first `for`'s init, and everything after that init (`side * 0x6c`,
 * `side * 2`, the address of gUnknown_030045A0[side ^ 1]) is the loop
 * optimiser's and must not be spelled.
 *
 * gUnknown_08551D22 and gUnknown_08551D2A are two DECLARED objects, not two
 * columns of one: the ROM reaches column 3 of the first as a bare pool word
 * plus a run-time `adds rB,#6` (the array-row fold) and column 4 through a
 * pool word that already carries the +8, in the same statement and off the
 * same CSEd `x * 10`.
 */

void sub_0805634C(u16 a, u16 b, u16 c)
{
    u16 *p;
    u16 i;
    u16 j;

    if (c == 0)
        return;

    c = sub_0805653C(c, b);
    sub_080564B8(a, b, c);

    p = gUnknown_08551E64[gUnknown_030045A0[gUnknown_0300450C]];

    for (i = 0; i < c; i++)
        gUnknown_02029822[b][i] =
            p[gUnknown_08551E7C[b * 2 + gUnknown_0300450C] * 5 + i]
            + gUnknown_08551D2A[gUnknown_030045A0[b ^ 1]][0];

    for (i = 0; i < c; i++)
    {
        for (j = 0; j < 5; j++)
        {
            if (gUnknown_0202980A[b][i] == gUnknown_020298E0[b].unk1a[j])
            {
                gUnknown_02029822[b][i] =
                    gUnknown_020298EC[b][j]
                    - gUnknown_08551D22[gUnknown_030045A0[b ^ 1]][3]
                    + gUnknown_08551D2A[gUnknown_030045A0[b ^ 1]][0];
            }
        }
    }

    sub_08056638(b);
}
