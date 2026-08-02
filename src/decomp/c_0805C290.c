#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805C290.
 * sub_0805C290 @ 0x0805C290
 */

/* Picks one of three variants at random and forwards both arguments to it.
 *
 * `sub_080129E0() % 3` is an UNSIGNED modulo (`bl __umodsi3`) because
 * sub_080129E0 is declared u32; the signed form would have called __modsi3 and
 * needed a correction sequence. The three arms share one `lsls #0x18;
 * lsrs #0x18` tail, which is the re-narrowing agbcc applies to a u8-returning
 * callee -- written as three assignments to one u8 local, gcc merges them onto
 * the common edge. The default arm keeps the 0 the local was seeded with.
 *
 * The parameter widths come from the prologue's two PROMOTE_MODE pairs, which
 * is why include/unknown-functions.h's prototype-less `u8 sub_0805C290();` is
 * corrected to `(u16, u8)` this wave. */
u8 sub_0805C290(u16 a, u8 b)
{
    u8 r;

    r = 0;

    switch (sub_080129E0() % 3)
    {
    case 0:
        r = sub_0805C2DC(a, b);
        break;
    case 1:
        r = sub_0805C514(a, b);
        break;
    case 2:
        r = sub_0805C720(a, b);
        break;
    }

    return r;
}
