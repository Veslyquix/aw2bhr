#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803B5F4.
 * sub_0803B5F4 @ 0x0803B5F4
 *
 * Named per src/aw2e-names.s (proc-table labels auto-generated from
 * AW2E.lua). The old sub_XXXXXXXX symbols are kept as linker aliases
 * below so every other unit keeps resolving them unchanged.
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803B5F4.
 * FadeSound_0803B5F5 @ 0x0803B5F4
 */

void FadeSound_0803B5F5(void)
{
    gUnknown_030005CA = 0xFFFF;
}

asm(".global sub_0803B5F4\n.thumb_set sub_0803B5F4, FadeSound_0803B5F5\n");
