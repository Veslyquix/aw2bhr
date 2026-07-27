#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034F8C.
 * sub_08034F8C @ 0x08034F8C
 */

extern s8 gUnknown_030030F0;

void sub_08034F8C(void)
{
    if (gUnknown_030030F0 != 0)
        gUnknown_030030F0--;
}
