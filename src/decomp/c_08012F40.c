#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08012F40.
 * sub_08012F40 @ 0x08012F40
 */

void sub_08012F40(u16 x, u16 y, const u8 *s)
{
    while (*s != 0)
    {
        sub_08012E9C(x, y, *s++);
        x++;
    }
}
