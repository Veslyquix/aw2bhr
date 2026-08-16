#include "global.h"

extern u8 gUnknown_0200C420[];

u8 GetLoadedCoPalette(int co)
{
    u8 *p = gUnknown_0200C420;
    p += 0x20;
    return p[co];
}

void SetLoadedCoPalette(int co, u8 palette)
{
    u8 *p = gUnknown_0200C420;
    p += 0x20;
    p[co] = palette;
}
