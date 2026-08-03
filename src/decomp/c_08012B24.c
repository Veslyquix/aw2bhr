#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08012B24.
 * sub_08012B24 @ 0x08012B24
 */

void sub_08012B24(u16 *src, u16 *dst, u16 size, u16 add)
{
    while (size != 0)
    {
        *dst = *src + add;
        src++;
        dst++;
        size -= 2;
    }
}
