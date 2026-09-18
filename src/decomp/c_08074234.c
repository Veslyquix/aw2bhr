#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08074234.
 * Interpolate @ 0x08074234
 */

/* Interpolate @ 0x08074234, 200 bytes. Matched in wave 66.
 *
 * Two narrow fixed-register bindings are load-bearing. The case-1 square must
 * be formed in r0 before multiplication by `to - from`, while the result shared
 * by reverse cases 4 and 5 must be allocated to r0 so the final subtraction is
 * emitted directly into the return register. Without the latter binding agbcc
 * emits `subs r4, r4, r0; adds r0, r4, #0`, making the function two code bytes
 * longer and adding two alignment bytes. */

s32 Interpolate(s32 kind, s32 from, s32 to, s32 t, s32 tmax)
{
    s32 num;
    s32 den;
    s32 s;
    register s32 result asm("r0");

    if (tmax == 0)
        return to;

    switch (kind) {
    case 0:
        num = (to - from) * t;
        return from + Div(num, tmax);
    case 1:
    {
        register s32 square asm("r0");

        square = t * t;
        num = square * (to - from);
        den = tmax * tmax;
        return from + Div(num, den);
    }
    case 2:
        num = t * t * t * (to - from);
        den = tmax * tmax * tmax;
        return from + Div(num, den);
    case 3:
        num = t * t * t * t * (to - from);
        den = tmax * tmax * tmax * tmax;
        return from + Div(num, den);
    case 4:
        s = tmax - t;
        num = s * s * (to - from);
        den = tmax * tmax;
        result = from + (to - from) - Div(num, den);
        return result;
    case 5:
        s = tmax - t;
        num = s * s * s * (to - from);
        den = tmax * tmax * tmax;
        result = from + (to - from) - Div(num, den);
        return result;
    }

    return 0;
}
