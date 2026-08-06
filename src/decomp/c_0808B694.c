#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808B694.
 * sub_0808B694 @ 0x0808B694
 */

/* strcmp on unsigned bytes: the difference is the zero-extended byte values
 * subtracted, so a high byte compares greater. A leaf with no frame.
 *
 * ONE exit through `r`, not two `return`s: spelled with a `return` in each arm
 * agbcc sinks the mismatch block past the loop and the two blocks come out in
 * the other order. See the chapter in docs/agbcc-codegen.md. Matches under the
 * default build -- unlike the rest of this flash block, this one is not -O1
 * sensitive (identical output at both levels). */
int sub_0808B694(const void * a1, const void * a2)
{
    const u8 *a;
    const u8 *b;
    u8 c1;
    u8 c2;
    int r;

    a = (const u8 *)a1;
    b = (const u8 *)a2;

    for (;;)
    {
        c1 = *a++;
        c2 = *b++;

        if (c1 != c2)
        {
            r = c1 - c2;
            break;
        }

        if (c1 == 0)
        {
            r = 0;
            break;
        }
    }

    return r;
}
