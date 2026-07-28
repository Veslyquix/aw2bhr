#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08001CE8.
 * sub_08001CE8 @ 0x08001CE8
 */

/* The `ldrsh` fixes gUnknown_0200B224[].unk00 as a signed halfword; the `lsls
 * #2` on gUnknown_0200B0B0->unk28 fixes the element stride at 4.
 */
s16 sub_08001CE8(void)
{
    return gUnknown_0200B224[gUnknown_0200B0B0->unk28].unk00;
}
