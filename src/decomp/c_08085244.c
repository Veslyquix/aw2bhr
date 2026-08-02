#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08085244.
 * sub_08085244 @ 0x08085244
 */

void sub_08085244(s16 *p)
{
    sub_0801F34C(0x67, 0xBD, 0x98, 0, 1);
    sub_08085708(p, p[0x33]);
    sub_080853B0();
    sub_08043B60(0x78, 8, 0x82AC, 3);
    sub_0804402C(0x10D0, 0x18, 0x62B8, 5);
}
