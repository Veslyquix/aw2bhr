#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08035124.
 * sub_08035124 @ 0x08035124, sub_08035144 @ 0x08035144
 */

void sub_08035124(u8 a)
{
    if (a != 0 && gUnknown_03003FC0.unk2c != a)
        sub_080350E4();
}

void sub_08035144(u8 a)
{
    sub_080350E4();
    gUnknown_03004490[0] = 0x32;
    sub_080152EC(gUnknown_0849BD38, 0)->unk20 = a;
}
