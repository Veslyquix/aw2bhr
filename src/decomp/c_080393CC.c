#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080393CC.
 * sub_080393CC @ 0x080393CC, sub_0803941C @ 0x0803941C
 */

/* The +0x20 IS A SEPARATE STATEMENT, and that is the whole difference between
 * this and a one-line version. `v = call(); v += 0x20;` narrows twice, and
 * combine cancels the inner `asrs`/`lsls` pair against each other, leaving the
 * first narrowing's `lsls #0x10`, the addend scaled into the high half
 * (`movs r1,#0x80; lsls r1,#0xe` == 0x20 << 16) and one final `asrs #0x10`.
 * Written as `v = call() + 0x20;` the add happens in the low half first
 * (`adds r4,#0x20; lsls; asrs`) and the function is 4 bytes short --
 * src/decomp/c_0803B264.c records the same lever from the other direction. */
void sub_080393CC(void)
{
    s16 v;

    sub_080156FC(gUnknown_03001FBC, 0);

    v = sub_080157D0(gUnknown_03001FBC);
    v += 0x20;

    sub_080157A4(gUnknown_03001FBC, v);
    sub_080157F4(gUnknown_03001FBC, v);

    if (v == 0x200)
        sub_08015C30(gUnknown_03001FBC);
}

/* The parameterised twin of src/decomp/c_0803B264.c's sub_0803B2BC: identical
 * seven-callee sprite install, with the OBJ attribute's tile field and the
 * sprite's y taken from arguments instead of literals.
 *
 * THE TILE TERM IS ITS OWN STATEMENT, and that is the only thing separating a
 * match from 86.8%. Written as one expression the `& 0xFFFFFC00` is emitted
 * the instant its operand is ready, ahead of the tile arithmetic, and the pool
 * words come out 0xFFFFFC00 before 0x30A -- the mirror image of the ROM. The
 * two-statement form WITHOUT the temporary is byte-identical to the
 * one-statement form (measured), because dead-store elimination collapses the
 * intermediate store; and swapping the operands of the final `|` fixes the
 * order but reverses the copy (`adds r2,r5,#0` for the ROM's `adds r2,r0,#0`).
 * Binding the tile to a local BETWEEN the two halves gets both.
 *
 * 0x3FF is written as itself even though agbcc emits it as `adds r3,#0xf5` on
 * top of the 0x30A already in r3: that is the compiler reusing a live
 * constant, not a source-level relationship between the two numbers. */
void sub_0803941C(int a, int b)
{
    struct UnkVec v;
    s8 i;
    int t;

    i = sub_08015438(gUnknown_0849D73C, 0, gUnknown_0849D730, 0, 0);

    v = sub_08015638(i);
    v.unk04 = (v.unk04 & 0xFFFF0FFF) | 0x3000;
    t = (b * 8 + 0x30A) & 0x3FF;
    v.unk04 = (v.unk04 & 0xFFFFFC00) | t;
    sub_08015608(i, v);

    sub_080155C0(i, a + 0x14, 0x50);
    sub_08016824(i);
    sub_08016944(i);
    sub_080157A4(i, 0x200);
    sub_080157F4(i, 0x200);
}
