#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08058224.
 * sub_08058224 @ 0x08058224
 */

/* +0x06 is a 7-BIT BITFIELD, not a byte masked at the use: `ldrb; lsls #0x19;
 * lsrs #0x19` is extract_bit_field's shape for bitsize 7 at bit 0, and the
 * shifted intermediate is CSEd into the else arm's `lsrs r0, r2, #0x19`.
 * sub_08042D1C is called twice on purpose -- the ROM recomputes it rather than
 * keeping it live across the compare. */
struct Unk58224
{
    u8 unk00;
    u8 filler_01[0x05];
    u8 unk06_0 : 7;
    u8 unk06_7 : 1;
};

int sub_08058224(struct Unk58224 *p)
{
    if (sub_08042D1C(gUnknown_030033EC, p->unk00) > p->unk06_0)
        return p->unk06_0;
    return sub_08042D1C(gUnknown_030033EC, p->unk00);
}
