#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804BA64.
 * sub_0804BA64 @ 0x0804BA64
 */

/* Copies one halfword out of a two-entry ROM constant onto the stack and, for
 * two of the caller's mode values, installs it as the side's unk0a and sets
 * unk00. The memcpy is real: `sub_0808B6E8(t, gUnknown_0813603C, 4)` moves both
 * halfwords and only then is the copy subscripted `[side]`, which is why the
 * ROM word cannot be read directly.
 *
 * A SWITCH, and with `case 2` written FIRST. The compare chain is ascending
 * whatever the source order, but the BODIES come out in source order, and the
 * ROM has the `== 2` body inline with the `== 1` body after it -- which also
 * lets `cmp #2; beq <fallthrough>` collapse to `cmp #2; bne <end>`. Spelled as
 * `if (b == 1) ... else if (b == 2)` the two bodies swap AND each parameter
 * picks up a spare copy (`adds r6, r4, #0`), costing 8 bytes. */
void sub_0804BA64(u16 a, u16 b)
{
    u16 t[2];

    sub_0808B6E8(t, gUnknown_0813603C, 4);

    switch (b)
    {
    case 2:
        gUnknown_02029690[a].unk0a = t[a];
        gUnknown_02029690[a].unk00 = b;
        break;
    case 1:
        gUnknown_02029690[a].unk0a = t[a];
        gUnknown_02029690[a].unk00 = 2;
        break;
    }
}
