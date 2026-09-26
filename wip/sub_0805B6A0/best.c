#include "global.h"

struct Unk2029ED8Rec
{
    /* 0x00 */ u8 filler_00[0x60];
    /* 0x60 */ u8 x;
    /* 0x61 */ u8 y;
};

int sub_0805B6A0(int *a1, int *a2, int *a3, int *a4)
{
    int i;

    i = gUnknown_02029ED8[*a2 + *a1 * 0x20 + gUnknown_030033EC * 0xc00];

    while (i != 0xff)
    {
        if (((struct Unk2029ED8Rec *)&gUnknown_02029ED8[i * 8 + *a1 * 0x3e0
                                                        + gUnknown_030033EC
                                                              * 0xc00])
                ->x
            == 0xfe)
        {
            ++*a2;
            if (*a2 > 0x1f)
                return 0;
            i = gUnknown_02029ED8[*a2 + *a1 * 0x20 + gUnknown_030033EC * 0xc00];
            continue;
        }

        *a3 = ((struct Unk2029ED8Rec *)&gUnknown_02029ED8[i * 8 + *a1 * 0x3e0
                                                          + gUnknown_030033EC
                                                                * 0xc00])
                  ->x;
        *a4 = ((struct Unk2029ED8Rec *)&gUnknown_02029ED8[i * 8 + *a1 * 0x3e0
                                                          + gUnknown_030033EC
                                                                * 0xc00])
                  ->y;
        return 1;
    }

    return 0;
}
