#include "global.h"

u16 sub_0801B120(u16 a1)
{
    u8 cnt[0x10];
    u8 ids[0x10];
    int i;
    u8 *meta;
    int j;
    int k;
    int n;
    int best;
    u16 key;
    u32 v;

    key = a1;

    if (a1 == 0xff)
        key = 0;

    for (i = 0; i < 0x10; i++)
    {
        ids[i] = gUnknown_0200CC38.unk00[i];
        gUnknown_0200CC38.unk20[i] &= 0xef;
    }

    for (;;)
    {
        best = -1;

        for (i = 0; i < 0x10; i++)
        {
            meta = &gUnknown_0200CC38.unk30[i];
            if (ids[i] == key
                && (a1 != 0xff || gUnknown_0200CC88[i] == 0))
            {
                if (best == -1)
                {
                    best = i;

                    for (j = 0; j < 0x10; j++)
                    {
                        cnt[j] = 0;
                        gUnknown_0200CC38.unk20[j] &= 0xef;
                    }
                }
                else if (best > -1
                    && gUnknown_0200CC88[best] <= gUnknown_0200CC88[i])
                {
                    if (gUnknown_0200CC88[best] != gUnknown_0200CC88[i])
                    {
                        best = i;

                        for (j = 0; j < 0x10; j++)
                        {
                            cnt[j] = 0;
                            gUnknown_0200CC38.unk20[j] &= 0xef;
                        }
                    }
                }
                else
                {
                    continue;
                }

                cnt[*meta >> 4]++;
                gUnknown_0200CC38.unk20[i] |= 0x10;
            }
        }

        if (best == -1)
            return 0xffff;

        n = (gUnknown_0200CC38.unk30[best] & 0xf) + 1;

        for (k = 0; k < n; k++)
            if (cnt[k] != 1)
                break;

        if (k == n)
        {
            for (; k < 0x10; k++)
                if (cnt[k] != 0)
                    break;

            if (k == 0x10)
                return best;
        }

        v = gUnknown_0200CC88[best];

        for (i = 0; i < 0x10; i++)
        {
            if (ids[i] == key && gUnknown_0200CC88[i] == v)
                ids[i] |= 0xff;

            gUnknown_0200CC38.unk20[i] &= 0xef;
        }
    }
}













