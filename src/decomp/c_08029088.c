#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08029088.
 * sub_08029088 @ 0x08029088, sub_0802909C @ 0x0802909C
 */

/* A two-argument forwarder that adds a literal third. Every instruction is the
 * s16 parameters being sign-extended for sub_080290B0's `int` parameters -- the
 * cast at a use, not the prologue; PROMOTE_MODE's own narrowing would be
 * `lsls/lsrs`, and these are `lsls/asrs`.
 *
 * sub_0802909C is the identical function with 1 for the last argument. */
void sub_08029088(s16 x, s16 y)
{
    sub_080290B0(x, y, 0);
}

/* sub_08029088 with 1 instead of 0 -- see that file. The pair is what fixes
 * sub_080290B0's third parameter as a two-valued u8 flag rather than anything
 * wider. */
void sub_0802909C(s16 x, s16 y)
{
    sub_080290B0(x, y, 1);
}
