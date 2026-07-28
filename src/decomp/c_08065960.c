#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08065960.
 * sub_08065960 @ 0x08065960
 */

void sub_08065960(void)
{
    if (gUnknown_03004008 & 1)
    {
        gUnknown_0300200C++;
        gUnknown_03002000--;
    }
}
