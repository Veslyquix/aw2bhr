#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800396C.
 * sub_0800396C @ 0x0800396C, sub_08003994 @ 0x08003994
 */

#include "hardware.h"

void sub_0800396C(void)
{
    int v = gUnknown_03001FFC + 1;

    if (v > 6)
    {
        v = 6;
        sub_08015C30(gUnknown_03001FBC);
    }

    gUnknown_03001FFC = v;
}

void sub_08003994(void)
{
    int v = gUnknown_03001FFC - 1;

    if (v <= 0)
    {
        v = 0;
        sub_08015C30(gUnknown_03001FBC);
    }

    gUnknown_03001FFC = v;
}
