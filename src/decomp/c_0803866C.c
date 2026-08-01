#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803866C.
 * sub_0803866C @ 0x0803866C
 */

int sub_0803866C(void)
{
    if (gUnknown_03003FC0.unk01 == 1 && sub_0803CBD8(0x60) != 0)
        return 1;
    return 0;
}
