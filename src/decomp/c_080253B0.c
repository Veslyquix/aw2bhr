#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080253B0.
 * sub_080253B0 @ 0x080253B0
 */

/* MATCHED, wave 77 (W77-J). Parked at 97.6% from wave 34 to wave 77.
 *
 * The whole 6-byte / three-instruction residual was the DECLARED TYPE OF
 * `cell`. It was `int cell;` holding a value loaded from a u8 array; making
 * it `u8 cell;` -- the honest width of `tiles[off]` -- reproduces the ROM's
 * `ldr r0,=g / movs r1,#0xe0 / ldrh r0,[r0] / ands r3,r1 / cmp r0,r3`
 * exactly, on the first compile. Nothing else in the function changed.
 *
 * Waves 34 and 39 diagnosed the residual correctly as a register assignment
 * (the constant needs r1 so the scheduler can hoist it above `ldrh r0,[r0]`)
 * and then spent five try_match attempts and a 300 s permuter run on
 * SOURCE-EXPRESSION spellings of the comparison -- operand order, binding the
 * mask to a local, `cell &= 0xe0`, `cell & ~0x1f`. None of those can move an
 * allocation, and the notes said so. The lever was one declaration away and
 * was never on the ruled-out list because the type of a local that only ever
 * holds a byte reads as settled.
 *
 * AT PROMOTION this needs its .rodata pool word placed, exactly as
 * sub_080254AC does:  "rodata": ["0x08090A48"]  (agbcc's -fforce-addr word
 * holding &gUnknown_085D5ABC). trymatch reports it as
 * `a8: R_ARM_ABS32 .rodata`; that is the wave-18 honest-spelling flow.
 *
 * Two type findings this function established are in
 * include/unknown-globals.h: struct Unk085D5ABC.unk58 (a `const u8 *`
 * per-terrain cost table, carved out of filler_52) and gUnknown_084995DA
 * (one ROM terrain code per unit type).
 */

bool8 sub_080253B0(struct Unk08499594 *a1)
{
    u8 *p;
    u8 *rows;
    u8 *tiles;
    int t;
    int off;
    u8 cell;
    u8 cost;
    int sum;

    p = gUnknown_08499590;
    t = a1->unk03 * 2;
    rows = p + 0x417A;
    off = *(u16 *)(rows + t) + a1->unk02;
    tiles = p + 0x1432;
    cell = tiles[off];

    cost = gUnknown_085D5ABC[a1->unk00].unk58[cell & 0x1f];

    if (a1->unk01 & 8)
        return FALSE;

    if (gUnknown_03004084 == (cell & 0xe0) && gUnknown_084995DA[a1->unk00] == (cell & 0x1f))
        return FALSE;

    if (a1->unk01 & 0x20)
        cost = 5;

    sum = (s8)cost + sub_08042C68(gUnknown_030033EC, a1->unk00);
    cost = sum;

    if ((s8)sum < 0)
        cost = 0;

    if (a1->unk06_0 <= (s8)cost)
        a1->unk06_0 = 0;
    else
        a1->unk06_0 -= cost;

    if (a1->unk06_0 != 0)
        return FALSE;

    if ((gUnknown_085D5ABC[a1->unk00].unk1a & 0x30) == 0)
        return FALSE;

    return TRUE;
}
