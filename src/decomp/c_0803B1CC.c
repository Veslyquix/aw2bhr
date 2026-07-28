#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803B1CC.
 * sub_0803B1CC @ 0x0803B1CC
 */

#include "hardware.h"

void sub_0803B1CC(void)
{
    if (gpKeySt->unk00 & 0x100)
        gUnknown_03002F1C = 1;
}
