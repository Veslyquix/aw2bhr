#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080742FC.
 * sub_080742FC @ 0x080742FC
 */

/* One of six identical null-guards, differing only in which slot of
 * struct Unk08074584 they run and what they forward as arguments 2 and 3.
 */
u8 sub_080742FC(void)
{
    const struct Unk08074584 *p = sub_08074584();

    if (p != 0 && p->unk04 != 0)
        return sub_08074484(p->unk04, 0, 0);

    return 0;
}
