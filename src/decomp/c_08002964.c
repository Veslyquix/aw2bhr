#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08002964.
 * sub_08002964 @ 0x08002964
 */

void sub_08002964(int a1, int a2, int a3, int a4, int a5, int a6)
{
    int idx;
    int attr0, attr1;

    sub_08001230(a4);
    if (a1 != 0)
        idx = a1 * 8 + 0x2B2;
    else
        idx = 0x262;

    if (a6)
        sub_08011E54((void *)sub_0802A85C(a4 & 0x1F),
                     (void *)(0x06010000 + (idx << 5)), 0x100);

    attr1 = (a2 - 4) & 0x1FF;
    attr0 = (a3 & 0xFF) | 0x400;
    if (a5)
        attr0 |= 0x100;
    sub_0801BD00(attr1, attr0, gUnknown_08485CF4[a1], 0x1000);
}
