#include "global.h"

int sub_08068038(u8 *str, u16 a2)
{
    int i;
    int next;
    int dst;
    u8 *src;

    i = 0;
    gUnknown_0202F208 = 0;

    while (str[i] != 0)
    {
        dst = 0x06010000 + i * 512;
        next = i + 1;

    scan:
        if (gUnknown_08581160[gUnknown_0202F208].chr == 0xff)
            src = gUnknown_08581160[12].data;
        else if (str[i] == gUnknown_08581160[gUnknown_0202F208].chr
              || str[i] == gUnknown_08581160[gUnknown_0202F208].chr + 0x20)
            src = gUnknown_08581160[gUnknown_0202F208].data;
        else
            goto advance;

        Decompress(src, (void *)(dst + a2 * 32));
        i = next;
        gUnknown_0202F208 = 0;
        continue;

    advance:
        gUnknown_0202F208++;
        goto scan;
    }

    return i;
}
