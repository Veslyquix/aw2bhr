#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808B6B0.
 * sub_0808B6B0 @ 0x0808B6B0
 */

int sub_0808B6B0(const char *s)
{
    int n;

    n = 0;

    while (*s++ != 0)
        n++;

    return n;
}
