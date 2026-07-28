#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802C644.
 * sub_0802C644 @ 0x0802C644
 */

/* Byte-for-byte the same function as sub_0802C62C 0x18 bytes above it --
 * same global, same offset, same shape. A duplicate, not a family member. */
bool8 sub_0802C644(void)
{
    if (gUnknown_03003FC0.unk32 == 0)
        return FALSE;

    return TRUE;
}
