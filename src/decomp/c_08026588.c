#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08026588.
 * sub_08026588 @ 0x08026588
 */

/* unk16 is a running count and unk18 its high-water mark. The two are sibling
 * members at constant offsets, so the `strh` does not kill the cached deref
 * and the plain repeated spelling gets one index computation. The `cmp; bls`
 * is unsigned, which is what types both halfwords. */
void sub_08026588(u8 a)
{
    gUnknown_08499598[a].unk16++;

    if (gUnknown_08499598[a].unk16 > gUnknown_08499598[a].unk18)
        gUnknown_08499598[a].unk18 = gUnknown_08499598[a].unk16;
}
