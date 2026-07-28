#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802C5F0.
 * sub_0802C5F0 @ 0x0802C5F0
 */

bool8 sub_0802C5F0(void)
{
    if (gUnknown_03003FC0.unk01 == 3)
        return FALSE;

    return TRUE;
}
