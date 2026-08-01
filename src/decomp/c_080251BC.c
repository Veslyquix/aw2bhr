#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080251BC.
 * sub_080251BC @ 0x080251BC
 */

/* THREE parameters, and the third is invisible here: sub_08024F20 reads r2 as
 * a pointer (`ldrh [r2]`, `ldrh [r2,#2]`) and this function never writes r2, so
 * it forwards a parameter it does not otherwise touch -- the pass-through
 * wrapper case in docs/agbcc-codegen.md, settled on the callee's prologue.
 * sub_080251D8 reads r0 the same way, which is why the then-arm's `bl` has no
 * argument setup at all.
 *
 * a1 and a2 are `int`: a2 is tested raw (`cmp r1,#0` with no entry narrowing,
 * so no PROMOTE_MODE), and the `lsls #0x10; asrs #0x10` pair on each is the
 * CONVERSION to sub_08024F20's s16 parameters at the call. */

void sub_080251BC(int a1, int a2, struct Unk802C57C *a3)
{
    if (a2 == 0)
        sub_080251D8(a1);
    else
        sub_08024F20(a1, a2, a3);
}
