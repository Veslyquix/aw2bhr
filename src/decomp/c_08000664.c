#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08000664.
 * sub_08000664 @ 0x08000664
 */

/* Two guards, the second reading what the first may have just written -- which
 * is why they are separate ifs and not an if/else.
 *
 * unk06 is read `movs r0,#6; ldrsb r0,[r2,r0]`: the reg+reg form is what agbcc
 * rewrites a plain s8 member load into, and it is the tell that separates a
 * non-volatile s8 from the `ldrb` + shift pair a volatile one keeps.
 *
 * The global pointer is re-loaded between the two stores because writing
 * through it may alias it; that reload is in the ROM and is what two plain
 * statements produce. */
void sub_08000664(void)
{
    if (gActiveMap->unk06 != 0)
    {
        gActiveMap->unk06 = 0;
        gActiveMap->unk02 = 0;
        sub_08003640();
    }

    if (gActiveMap->unk02 == 0)
        sub_080035C8();
}
