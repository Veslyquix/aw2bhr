#include "global.h"

void sub_080029F4(int a1, int a2, int a3, int a4, int a5, int a6)
{
    int g;
    int attr0, attr1;
    void *src;

    g = gUnknown_02028E40;
    a4 &= 0x3F;
    if (a6)
    {
        if (a1 == 0)
        {
            if (a4 != 0x19)
                src = (void *)sub_0802A838(a4);
            else
                src = gUnknown_08489190[g];
            sub_08011E54(src, (void *)0x06014BC0, 0x100);
        }
        else
        {
            if (a4 != 0x19)
                src = (void *)sub_0802A838(a4);
            else
                src = gUnknown_08489190[g];
            sub_08011E54(src,
                         (void *)((((a1 - 1) * 8 + 0x28C) * 32) + 0x06010000),
                         0x100);
        }
    }

    attr1 = (a2 - 4) & 0x1FF;
    attr0 = (a3 & 0xFF) | 0x400;
    if (a5)
        attr0 |= 0x100;
    sub_0801BD00(attr1, attr0, gUnknown_08485D68[a1], 0x1000);
}
