#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015578.
 * sub_08015578 @ 0x08015578, sub_080155A0 @ 0x080155A0, sub_080155C0 @ 0x080155C0, sub_080155E8 @ 0x080155E8
 */

/* Dispatch on the sentinel 0xff: with a real `a` the four-argument
 * sub_0801D778 gets it, otherwise `a` is dropped and the three-argument
 * sub_0801D804 takes over. Neither callee's arity is visible here -- both are
 * read off the callee bodies (sub_0801D778 supplies a fifth 0 to
 * sub_0801D6E8; sub_0801D804 writes r3 itself).
 *
 * The SINGLE `lsls #0x18; asrs #0x18` at the merge is this function's own s8
 * return. If either callee returned s8, agbcc would have re-narrowed after
 * each `bl` and there would be two. Written through a result local so the two
 * arms share one narrowing; `return <call>;` in both arms is identical here.
 */
s8 sub_08015578(s16 a, int b, int c, u8 d)
{
    int r;

    if (a != 0xff)
        r = sub_0801D778(a, b, c, d);
    else
        r = sub_0801D804(b, c, d);

    return r;
}

/* The "no first argument" entry point to sub_08015578: it supplies the 0xff
 * sentinel and shifts its own three arguments up by one.
 */
s8 sub_080155A0(int a, int b, u8 c)
{
    return sub_08015578(0xff, a, b, c);
}

/* The position setter: hand the slot's sprite index and an (x, y) pair to
 * sub_0801D96C, which stores them as 8.8 fixed point in .unk14/.unk18.
 */
void sub_080155C0(s16 a, s16 b, s16 c)
{
    sub_0801D96C(gUnknown_03001470[a].unk26, b, c);
}

/* sub_080155C0's reader: sub_0801D9E4 writes the same 8.8 pair back out
 * through two `s16 *`.
 *
 * THE ARITY IS INVISIBLE HERE and comes from the callee. This body touches
 * only r0; `x` and `y` are forwarded unchanged and cost zero instructions, so
 * nothing in these thirty-two bytes says whether there are one, two or three
 * parameters. sub_0801D9E4 `strh`s into [r1] and [r2], which is what settles
 * it at three.
 */
void sub_080155E8(s16 a, s16 *x, s16 *y)
{
    sub_0801D9E4(gUnknown_03001470[a].unk26, x, y);
}
