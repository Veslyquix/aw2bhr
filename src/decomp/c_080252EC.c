#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080252EC.
 * sub_080252EC @ 0x080252EC
 */

/* F010: `push {lr}; ldr r0,=g1; bl S1; ldr r0,=g2; bl S2; pop {r0}; bx r0` --
 * two statements, each with its own pool word, result of each discarded.
 * src/decomp/c_08044924.c is the matched exemplar.
 * Both calls go to the same callee -- sub_080252E8, a bare `bx lr` stub -- and
 * the two pool words are DIFFERENT symbols (0x030013D0 then 0x030013B0), so
 * this is not the 'agbcc emits two loads of one symbol' case. They are the two
 * instances of one RAM record; source order is D0 first, which is not address
 * order. */
void sub_080252EC(void)
{
    sub_080252E8(gUnknown_030013D0);
    sub_080252E8(gUnknown_030013B0);
}
