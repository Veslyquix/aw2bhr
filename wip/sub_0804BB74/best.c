#include "global.h"

void sub_0804BB74(int a, void *dst, u32 c, int d)
{
    int i;
    int j;
    int k;

    LZ77UnCompWram(gUnknown_08555850[a].unk08, gUnknown_0200FC50);

    if (d != 0)
    {
        if ((u32)(u8)(gUnknown_08555850[a].unk02 - 1) <= 1)
        {
            k = 0;
            for (j = 0; j <= 0x40 && k != 0x800; j++)
            {
                for (i = 31; i >= 0; i--, k++)
                    gUnknown_085519FC[k] = ((u16 *)gUnknown_0200FC50)[j * 32 + i] + 0x4400;
            }
        }
        else
        {
            k = 0;
            for (j = 0; k + 15 <= 0x800 && j <= 0x2c; j++)
            {
                for (i = 16; i >= 0; i--, k++)
                    gUnknown_085519FC[k + 13] = ((u16 *)gUnknown_0200FC50)[j * 32 + i] + 0x4400;
                k += 15;
            }
        }
    }
    else
    {
        for (k = 0; k <= 0x7ff; k++)
            gUnknown_085519FC[k] = ((u16 *)gUnknown_0200FC50)[k] + 0x1000;
    }

    CpuFastSet(gUnknown_085519FC, dst, (c >> 2) & 0x1FFFFF);
}
