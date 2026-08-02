#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08056D8C.
 * sub_08056D8C @ 0x08056D8C
 */

/* sub_08056D8C @ 0x08056D8C.
 *
 * The parameter `a` is held in TWO callee-saved registers (r5 and r7, the copy
 * made in the prologue) and that is not a spelling choice -- it falls straight
 * out of the two arms below, each of which rebuilds the whole subscript from
 * `a` rather than sharing a pointer. Writing it with one pointer local drops
 * r7 from the push.
 *
 * The else arm's addends are in ROM order: the gUnknown_08553858 lookup is
 * ADDRESSED first (its `ldrb` is then deferred past the `* 5`), which is what
 * fixes `gUnknown_08553858[...] + gUnknown_03004580[a][0] * 5` rather than the
 * other way round -- the reversed spelling loads gUnknown_03004580's row 0
 * first and reorders the three pool words.
 */
void sub_08056D8C(u16 a, u16 b, u16 c)
{
    if (b == 0x15 && c == 1)
    {
        if (a == gUnknown_0300450C)
            gUnknown_02029BA8[a].unk10 =
                gUnknown_08557914[gUnknown_08553858[gUnknown_03004580[a][5]]];
        else
            gUnknown_02029BA8[a].unk10 =
                gUnknown_08557914[gUnknown_08553858[gUnknown_03004580[a][6]]
                                + gUnknown_03004580[a][0] * 5];
    }
}
