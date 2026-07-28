#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019C24.
 * sub_08019C24 @ 0x08019C24
 */

void sub_08019C24(void)
{
    u16 *p;
    int i;

    p = gUnknown_08499578;

    for (i = 0; i < 0x400; i++)
        p[i] = 0;
}
