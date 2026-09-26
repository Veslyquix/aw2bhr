#include "global.h"

int sub_0800CAA0(void)
{
    int i;
    int r;

    r = 0;

    for (i = 0; i <= 0xF; i++)
    {
        if (gUnknown_084888B0[i] >> 1 == gUnknown_03003FC0.unk33[1]
         && gUnknown_084888D0[i] >> 1 == gUnknown_03003FC0.unk33[2]
         && gUnknown_084888F0[i] >> 1 == gUnknown_03003FC0.unk33[3]
         && gUnknown_08488900[i + 0x10] >> 1 == gUnknown_03003FC0.unk33[4])
        {
            r = i;
            break;
        }
    }

    return r;
}
