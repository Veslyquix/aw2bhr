#include "global.h"
#include "hardware.h"

/* BG tilemap dirty tracking, flushing, clearing, and cell access. */

void sub_08013AC8(void)
{
    sModifiedBGs = 0;
}

void BG_EnableSync(u8 a1)
{
    sModifiedBGs |= 1 << a1;
}

void sub_08013AEC(void)
{
    BG_EnableSyncByMask(1);
}

void sub_08013AFC(void)
{
    BG_EnableSyncByMask(2);
}

void sub_08013B0C(void)
{
    BG_EnableSyncByMask(4);
}

void sub_08013B1C(void)
{
    BG_EnableSyncByMask(8);
}

void FlushBgTilemaps(void)
{
    if (sModifiedBGs & 1)
        sub_08011C68(gBG0TilemapBuffer,
            (void *)(gUnknown_03002B6C.bits.tm_block * 0x800 + 0x06000000), 0x800);

    if (sModifiedBGs & 2)
        sub_08011C68(gBG1TilemapBuffer,
            (void *)(gUnknown_03001FE8.bits.tm_block * 0x800 + 0x06000000), 0x800);

    if (sModifiedBGs & 4)
        sub_08011C68(gBG2TilemapBuffer,
            (void *)(gUnknown_030030B4.bits.tm_block * 0x800 + 0x06000000), 0x800);

    if (sModifiedBGs & 8)
        sub_08011C68(gBG3TilemapBuffer,
            (void *)(gUnknown_0300251C.bits.tm_block * 0x800 + 0x06000000), 0x800);

    sModifiedBGs = 0;
    gUnknown_03000048 = 0;
}

void sub_08013C00(void)
{
    u16 i;

    for (i = 0; i < 0x400; i++)
        gBG0TilemapBuffer[i] = 0;

    for (i = 0; i < 0x10; i++)
        *(u16 *)(0x06000000 + gUnknown_03002B6C.bits.chr_block * 0x4000 + i * 2) = 0;
}

void sub_08013C54(void)
{
    u16 i;

    for (i = 0; i < 0x400; i++)
        gBG1TilemapBuffer[i] = 0;

    for (i = 0; i < 0x10; i++)
        *(u16 *)(0x06000000 + gUnknown_03001FE8.bits.chr_block * 0x4000 + i * 2) = 0;
}

void sub_08013CA8(void)
{
    u16 i;

    for (i = 0; i < 0x400; i++)
        gBG2TilemapBuffer[i] = 0x360;

    for (i = 0; i < 0x10; i++)
        *(u16 *)(0x0600D800 + gUnknown_030030B4.bits.chr_block * 0x4000 + i * 2) = 0;
}

u16 *BG_GetMapTilePointer(int which, int x, int y)
{
    u16 **pp;

    switch (which)
    {
    default:
    case 0:
        pp = &gBG0TilemapBuffer;
        break;
    case 1:
        pp = &gBG1TilemapBuffer;
        break;
    case 2:
        pp = &gBG2TilemapBuffer;
        break;
    case 3:
        pp = &gBG3TilemapBuffer;
        break;
    }

    return *pp + y * 32 + x;
}
