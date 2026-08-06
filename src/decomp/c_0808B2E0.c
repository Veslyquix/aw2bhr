#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808B2E0.
 * sub_0808B2E0 @ 0x0808B2E0
 */

/* "Is this sector still blank" -- walks the sector counting down the byte
 * count in gUnknown_03005C78->unk04 and stops at the first byte that is not
 * 0xFF, returning how much was left. A genuine leaf: no push, no callee-saved
 * register written, so nothing here may need a frame.
 *
 * The `b` over the decrement to the test is an unrotated `while` with a
 * `break`, not a `do`/`while`. */
u32 sub_0808B2E0(u8 *p)
{
    u32 n;

    n = gUnknown_03005C78->unk04;

    while (n != 0)
    {
        if (*p++ != 0xff)
            break;

        n--;
    }

    return n;
}
