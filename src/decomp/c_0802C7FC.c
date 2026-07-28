#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802C7FC.
 * sub_0802C7FC @ 0x0802C7FC
 */

bool8 sub_0802C7FC(void)
{
    if (gUnknown_085C77A0[gUnknown_03003FC0.unk02].unk08 != 0)
        return FALSE;

    return TRUE;
}
