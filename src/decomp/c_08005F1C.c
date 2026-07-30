#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08005F1C.
 * sub_08005F1C @ 0x08005F1C
 */

/* MATCHED, and the first of a byte-identical pair with sub_08007B74. Releases
 * the sprite id parked at gUnknown_0200B0B0->unk6b and marks the slot empty.
 *
 * unk6b is `s8` -- `ldrsb` and a test against -1 -- but the value written back
 * is spelled `0xFF`, not `-1`: the ROM has `movs r1,#0xff; strb`, where `-1`
 * into an s8 would have gone through the `movs #1; negs` pair. The pointer is
 * re-loaded after the call because sub_08015328 may clobber memory. */
void sub_08005F1C(void)
{
    if (gUnknown_0200B0B0->unk6b != -1)
    {
        sub_08015328(gUnknown_0200B0B0->unk6b);
        gUnknown_0200B0B0->unk6b = 0xFF;
    }
}
