#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08016E8C.
 * sub_08016E8C @ 0x08016E8C
 */

extern u32 gUnknown_0200C420[2];
extern u32 gUnknown_0200C500[2];

void sub_08016E8C(void)
{
    gUnknown_0200C420[0] = gUnknown_0200C500[0];
    gUnknown_0200C420[1] = gUnknown_0200C500[1];
}
