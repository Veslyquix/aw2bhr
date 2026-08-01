#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004A30.
 * sub_08004A30 @ 0x08004A30
 */

/* `int` and not a narrow parameter: the prologue saves r0 with a bare
 * `adds r4, r0, #0` across three calls, sub_08004A90 passes -1, and
 * sub_08003C48 tests the forwarded value with a signed `bge`. See
 * src/decomp/c_08004A60.c, which reads the same evidence from the other side.
 *
 * The `|=` is the aggregate-member operand swap its neighbour
 * src/decomp/c_08004BC0.c documents -- `orrs` with the CONSTANT's register as
 * the destination. */
void sub_08004A30(int a)
{
    sub_0801A168();
    sub_08003C48(a);
    sub_08002E3C();
    sub_08024268();
    gUnknown_0200B0B0->unk00 |= 0x1000;
}
