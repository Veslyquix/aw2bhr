#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08031B6C.
 * sub_08031B6C @ 0x08031B6C
 */

void sub_08031B6C(u8 *dst, u8 *src)
{
    int i;

    for (i = 0x10; i > 0; i--)
        *dst++ = *src++;

    *dst = 0;
}
