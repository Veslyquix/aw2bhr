#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08016E04.
 * sub_08016E04 @ 0x08016E04, sub_08016E14 @ 0x08016E14, sub_08016E3C @ 0x08016E3C
 */

/* `if (C) return A; return B;` in that order, not a ternary and not
 * `return a != 0;` -- a returned comparison goes through do_store_flag and
 * arrives with no unconditional branch at all. Which way round the two
 * constants sit is the whole content here: writing it as
 * `if (a) return TRUE; else return FALSE;` inverts the branch and lays the 0
 * out first. The bare `lsls #0x10` with no `lsrs` is the truth test of a
 * 16-bit parameter. */
bool8 sub_08016E04(u16 a)
{
    if (a == 0)
        return FALSE;
    return TRUE;
}

/* The save half: sub_08016B2C copies the live blocks into the buffer and
 * returns the byte count 0x5CC, which becomes sub_0801A7D8's third argument.
 * The nesting is real -- sub_0801A7D8 reads r2 -- and the argument setup order
 * (`adds r2,r0,#0`, then `movs r0,#0`, then `adds r1,r4,#0`) is the ordinary
 * grouping by operand class. */
void sub_08016E14(void)
{
    sub_08016A14();
    sub_0801A7D8(0, gUnknown_02000000, sub_08016B2C(gUnknown_02000000));
    sub_0803D48C();
}

/* The load half of sub_08016E14: sub_0801AC58 reads the buffer back and returns
 * non-zero on failure, in which case the unpack is skipped. That branch is what
 * proves sub_0801AC58 is `int` and not the `void` it was declared as. */
void sub_08016E3C(void)
{
    if (sub_0801AC58(0, gUnknown_02000000) == 0)
        sub_08016BC0(gUnknown_02000000);
}
