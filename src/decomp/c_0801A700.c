#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801A700.
 * sub_0801A700 @ 0x0801A700
 */

u32 sub_0801A700(void)
{
    struct Unk0808E5C8 *p = gUnknown_030020A8.unk04;

    if (p == NULL)
        return 0;

    gUnknown_030020A8.unk04 = p->unk04;
    return p->unk00;
}
