#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08000D9C.
 * sub_08000D9C @ 0x08000D9C
 */

void sub_08000D9C(void)
{
    if (gActiveMap->inputDelay == 0)
    {
        gActiveMap->inputDelay = 0x14;
        gActiveMap->flags |= 0x2000;
    }
}
