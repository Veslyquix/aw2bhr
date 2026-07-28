#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801A168.
 * sub_0801A168 @ 0x0801A168
 */

/* `return <call>;` and nothing else -- the `pop {r1}; bx r1` epilogue is the
 * returns-a-value one, and the value can only be sub_0801537C's, since nothing
 * touches r0 between the `bl` and the branch.
 *
 * The interesting part is the ABSENCE of a `lsls #0x18; asrs #0x18` after that
 * `bl`. agbcc RE-NARROWS the result of a narrow-returning callee at the call
 * site -- it never trusts a callee to have narrowed its own return -- so while
 * include/unknown-functions.h declared `s8 sub_0801537C(const void *)` this
 * function came out four bytes too long, and it did so with an `int` return,
 * with an `s8` return, and with an `s8` local in between (all three probed).
 * Both this function and sub_0801537C were retyped to `int` in wave 12; the
 * argument for that, and the one alternative the ROM cannot rule out (the
 * `return` keyword simply being absent, which is byte-identical here and draws
 * no warning even under -Werror), is written up on sub_0801537C's declaration.
 *
 * gUnknown_0848A42C is a gUnknown_03001470 slot script: sub_08019F90 starts it
 * with sub_080152EC and this is the matching stopper.
 */
int sub_0801A168(void)
{
    return sub_0801537C(gUnknown_0848A42C);
}
