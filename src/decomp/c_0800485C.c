#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800485C.
 * sub_0800485C @ 0x0800485C
 */

void sub_0800485C(void)
{
    sub_0801A664();
    sub_0803B4DC(0x66);
    gUnknown_0200B0B0->unk04 = 3;
    sub_08004C5C();
}
