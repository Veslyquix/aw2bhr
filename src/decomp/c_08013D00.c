#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08013D00.
 * sub_08013D00 @ 0x08013D00
 */

/* The switch selects the ADDRESS of one of four pointer variables and the
 * dereference happens ONCE, in the return expression -- `u16 **pp`, not
 * `u16 *base = gUnknown_...`. The two spellings compute the same thing and
 * agbcc cross-jumps the `ldr r0, [r0]` into the shared tail either way, but
 * they schedule differently: with `u16 *` the load happens FIRST and the tail
 * is `ldr r3,[r0]; lsl r0,r2,#6; ...`, where the ROM computes `lsls r1, r2, #6`
 * BEFORE the load. Making the deref part of the returned expression is what
 * puts the multiply first, and that in turn is what forces `x` out of r1 into
 * r3 with the leading `adds r3, r1, #0` -- an instruction the `u16 *` form
 * does not emit at all, leaving it 4 bytes short. Five spellings probed.
 *
 * `case 0:` alongside `default:` and written FIRST: the case set {0,1,2,3}
 * is what makes agbcc pivot its decision tree on 1 (`cmp #1 beq / cmp #1 ble`)
 * rather than on 2, and source order is what puts the 08499578 arm first.
 *
 * The index is `base + y * 32 + x` and not `&base[y * 32 + x]`: pointer
 * addition is left-associative, so each term is scaled and added separately
 * (`lsls #6` then `lsls #1`), where the subscript form would add first and
 * scale once. */
u16 *sub_08013D00(int which, int x, int y)
{
    u16 **pp;

    switch (which)
    {
    default:
    case 0:
        pp = &gUnknown_08499578;
        break;
    case 1:
        pp = &gUnknown_0849957C;
        break;
    case 2:
        pp = &gUnknown_08499580;
        break;
    case 3:
        pp = &gUnknown_08499584;
        break;
    }

    return *pp + y * 32 + x;
}
