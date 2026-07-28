#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08037508.
 * sub_08037508 @ 0x08037508, sub_0803753C @ 0x0803753C, sub_08037570 @ 0x08037570
 */

void sub_08037508(void)
{
    s16 i;

    for (i = 0; i <= 0x29; i++)
        gUnknown_02027F78[i] = i + 0x6c;

    gUnknown_02027F74.unk36 = 0;
    gUnknown_02027F74.unk37 = 0xFF;
}

void sub_0803753C(void)
{
    s16 i;

    for (i = 0; i <= 0x6a; i++)
        gUnknown_02027F78[i] = i + 1;

    gUnknown_02027F74.unk36 = 0;
    gUnknown_02027F74.unk37 = 0x6a;
}

void sub_08037570(void)
{
    s16 i;

    for (i = 0; i <= 0x6a; i++)
        gUnknown_02027F78[i] = i + 1;

    gUnknown_02027F74.unk36 = 0;
    gUnknown_02027F74.unk37 = 0x6a;
}
