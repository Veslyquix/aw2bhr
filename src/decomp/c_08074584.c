#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08074584.
 * sub_08074584 @ 0x08074584, sub_08074598 @ 0x08074598, sub_080745A8 @ 0x080745A8
 */

const struct Unk08074584 *sub_08074584(void)
{
    return sub_08035000(gUnknown_03003FC0.unk02)->unk04;
}

/* The `lsls #0x18; lsrs #0x18` in front of the `pop` is THIS function's own u8
 * return narrowing, not a re-narrowing of sub_0804423C's -- agbcc emits the
 * epilogue pair for a declared-narrow return whether or not the value it is
 * returning is already narrow.
 */
u8 sub_08074598(void)
{
    return sub_0804423C(1);
}

/* `movs #0` / `movs #1` split across a `b` is the two-return spelling, not
 * `return f() != 0;`.  Which constant falls through fixes the sense: the ROM
 * reaches `movs r0, #0` by falling through, so the `return 1;` is the THEN arm
 * and the test is `!= 0`.
 */
bool8 sub_080745A8(void)
{
    if (sub_08044094(1) != 0)
        return 1;

    return 0;
}
