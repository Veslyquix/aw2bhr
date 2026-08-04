#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08003640.
 * sub_08003640 @ 0x08003640
 */

void sub_08003640(void)
{
    u8 v[4];
    int i;

    sub_0808B6E8(v, gUnknown_0808D77C, 4);
    for (i = 0; i < 4; i++)
    {
        sub_08011E54((void *)(sub_0802A880(v[i], 0) + 0x40),
                     (void *)(gUnknown_08485C9C[i + 1] * 32 + 0x06010000), 0xC0);
        sub_08011E54(gUnknown_08485A2C,
                     (void *)(gUnknown_08485C9C[i + 1] * 32 + 0x060100C0), 0x40);
    }
}
