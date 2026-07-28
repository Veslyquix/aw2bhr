#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801DA94.
 * sub_0801DA94 @ 0x0801DA94
 */

void sub_0801DA94(void)
{
    u16 i;

    for (i = 0; i < 0x20; i++)
        gUnknown_03001430[i] = 0;
}
