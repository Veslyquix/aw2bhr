#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808B678.
 * sub_0808B678 @ 0x0808B678
 */

/* strcpy. Its neighbours are the rest of the string block: sub_0808B6B0 is
 * strlen and sub_0808B6E8 is memcpy. */

char *sub_0808B678(char *dst, const char *src)
{
    char *d;

    d = dst;

    while (*src != 0)
        *d++ = *src++;

    *d = 0;

    return dst;
}
