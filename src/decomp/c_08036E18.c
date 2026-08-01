#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08036E18.
 * sub_08036E18 @ 0x08036E18, sub_08036E54 @ 0x08036E54
 */

#include "hardware.h"

/* The soft-reset combo check: A+B+Select+Start (the low four KEYINPUT bits)
 * re-inits the save area unless its 0xAA/0x55 signature is already there.
 *
 * `keys` MUST be bound, and bound as `u16`. Written inline as
 * `((~REG_KEYINPUT & 0x3ff) & 0xf) == 0xf` the two masks fold to a single
 * `& 0xf` and the 0x3FF pool word disappears -- 8 bytes. Bound as `int` the
 * masks stay apart but the `adds r0, r2, #0` copy of the pool word does not
 * appear. `u16` gives both, and it is the same spelling AgbMain already uses
 * for this register in src/decomp/c_08036B34.c.
 *
 * The `||` is a real short-circuit: `bne` on the first byte jumps straight to
 * the call, `beq` on the second skips it. */
void sub_08036E18(void)
{
    u16 keys;

    keys = ~REG_KEYINPUT & 0x3ff;

    if ((keys & 0xf) == 0xf)
    {
        if (gUnknown_02028E41[0] != 0xaa || gUnknown_02028E41[1] != 0x55)
            sub_0804A010();

        sub_08036CB4();
    }
}

void sub_08036E54(void)
{
    sub_08036B4C();
    sub_0801B780(0);
    sub_080152EC(gUnknown_0849D1AC, 0);
}
