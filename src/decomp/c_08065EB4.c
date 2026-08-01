#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08065EB4.
 * sub_08065EB4 @ 0x08065EB4
 */

#include "hardware.h"

/* The SAME s8 member is read two different ways, and both are correct: `ldrb`
 * for `unk32 & 1`, because only bit 0 survives the mask and the sign cannot
 * matter, and `ldrsb` for `unk32 / 2`, where it does. Reading the pair as two
 * different fields is the trap. `lsrs #0x1f; adds; asrs #1` is the signed
 * divide-by-2 correction, not a shift in the source. */
void sub_08065EB4(void)
{
    if (gUnknown_08580934->unk32 & 1)
        sub_08065D20();
    else
        sub_08065DAC(gUnknown_08580934->unk32 / 2, gpKeySt->unk02, 1);
}
