#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803B414.
 * sub_0803B414 @ 0x0803B414, sub_0803B48C @ 0x0803B48C
 */

/* Seven identical sub_08071420 calls over the 0x03005xxx object group, all
 * with the same 0xFFFF mask and the same gUnknown_030005CC frame value. Both
 * shared arguments are materialised once and kept in r5/r4 for the whole run;
 * gUnknown_030005CC is RELOADED at each call because the callee may change it,
 * which is why only its address is hoisted. */
void sub_0803B414(void)
{
    sub_08071420(gUnknown_03005B20, 0xFFFF, gUnknown_030005CC);
    sub_08071420(gUnknown_03005C30, 0xFFFF, gUnknown_030005CC);
    sub_08071420(gUnknown_03005BA0, 0xFFFF, gUnknown_030005CC);
    sub_08071420(gUnknown_030059E0, 0xFFFF, gUnknown_030005CC);
    sub_08071420(gUnknown_03005A60, 0xFFFF, gUnknown_030005CC);
    sub_08071420(gUnknown_03005AA0, 0xFFFF, gUnknown_030005CC);
    sub_08071420(gUnknown_03005BF0, 0xFFFF, gUnknown_030005CC);
}

/* Guarded on gUnknown_030005CC being both non-zero and not 0x100 -- the two
 * ends of a fade -- this pokes the sound driver and makes sure the
 * gUnknown_0849E710 script is running.
 *
 * The three tests NEST rather than chaining with `&&`: the first two failures
 * go to the epilogue but the `a != 0` failure goes to the SECOND test, which
 * an `&&` could not produce. `lsls r0,r1,#0x10; cmp r0,#0` is the `!= 0` on
 * the parameter's low halfword and is the same for s16 and u16. */
void sub_0803B48C(s16 a)
{
    if (gUnknown_030005CC != 0)
    {
        if (a != 0)
            sub_08070478(a);

        if (gUnknown_030005CC != 0x100)
        {
            if (sub_08015BD0((s32)gUnknown_0849E710) == -1)
                sub_080152EC(gUnknown_0849E710, 0);
        }
    }
}
