#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802C78C.
 * sub_0802C78C @ 0x0802C78C, sub_0802C7A0 @ 0x0802C7A0
 */

bool8 sub_0802C78C(void)
{
    if (gPlaySt.bgmOn == 1)
        return FALSE;

    return TRUE;
}

bool8 sub_0802C7A0(void)
{
    if (gPlaySt.bgmOn == 0)
        return FALSE;

    return TRUE;
}
