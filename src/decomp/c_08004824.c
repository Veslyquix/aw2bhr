#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004824.
 * sub_08004824 @ 0x08004824
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file .text as one
 * contiguous block at 0x08004824.
 * sub_08004824 @ 0x08004824
 */

/* Family F055 (data/families.json): `push {lr}; movs r0,#K; bl A; movs r0,#1;
 * bl B; pop {r0}; bx r0` -- 20 bytes, three members. `varies` covers index 1
 * (the first immediate) and the two `bl` targets; index 3 is absent, so the
 * `movs r0, #1` is byte-identical across all three.
 *
 * Two independent calls with their arguments materialised in front of each --
 * no nesting is possible, both callees have their r0 written by a `movs`.
 * `pop {r0}` is the void epilogue.
 */


/* 0x66 is a sound id: sub_0803B4DC is the sound-request wrapper matched in this
 * same wave as a member of family F066, and its `int` parameter is the one
 * already declared in include/unknown-functions.h. Passing a literal into it is
 * an independent check on that reading -- and the check is that this call site
 * does NOT constrain the width at all, since `int`, `s16` and `u16` are
 * byte-identical for a `movs`-sized constant. That is why the width had to be
 * settled from sub_08016104/sub_08016130 and src/proc.c instead.
 */

void sub_08004824(void)
{
    sub_0803B4DC(0x66);
    sub_0800056C(1);
}
