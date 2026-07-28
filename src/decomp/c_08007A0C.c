#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08007A0C.
 * sub_08007A0C @ 0x08007A0C
 */

/* Same shape as sub_08005D50, different constants. */
void sub_08007A0C(void)
{
    struct Unk0200B0B0 *p = gUnknown_0200B0B0;

    p->unk6e = 0x780;
    p->unk70 = 0x970;
    p->unk6c = 0;
}
