#include "global.h"

/* Wave 65 final hand probe. Binding `(u32)(u16)x << 16` and the corresponding
 * y value per switch arm improves the active draft from 508 to 516 bytes
 * (target 540; 21.1%), proving the missing sequence belongs to retained shifted
 * coordinate pseudos. gcc still coalesces each pseudo into the now-dead
 * parameter register, so the ROM's `adds r7,r0,#0` / `adds r5,r0,#0` copies
 * remain absent: exactly one 2-byte copy for each coordinate in each of three
 * cases, plus the allocation/cross-jump consequences. Keep this improved
 * spelling; parameter signedness and casts were already ruled out. */








void sub_08022BB8(s16 x, s16 y, s16 kind)
{
    struct UnkVec oam = { 0, 0 };
    u8 i;
    void *anim;
    u32 sx;
    u32 sy;

    i = (u32)gUnknown_03004008 % 0x21;

    if (i <= 4)
    {
        i = 0;
    }
    else if (i > 8)
    {
        if (i <= 0x1C)
            i = 4;
        else
            i = 2;
    }
    else
    {
        i = 2;
    }

    switch (kind)
    {
    case 4:
        sx = (u32)(u16)x << 16;
        if ((s32)sx >> 16 > 0xCF)
        {
            sy = (u32)(u16)y << 16;
            if ((s32)sy >> 16 > 0x8F)
            {
                i += 6;
                anim = gUnknown_08499BA0;
            }
            else
            {
                anim = gUnknown_08499BB4;
            }
        }
        else
        {
            sy = (u32)(u16)y << 16;
            if ((s32)sy >> 16 > 0x7F)
            {
                i += 0x12;
                anim = gUnknown_08499BC8;
            }
            else
            {
                i += 0xC;
                anim = gUnknown_08499B8C;
            }
        }
        ((struct OamData *)&oam)->tileNum = 0x365;
        ((struct OamData *)&oam)->paletteNum = 1;
        sub_0801C01C(((s32)sx >> 16) + gUnknown_080909B8[i],
                     ((s32)sy >> 16) + gUnknown_080909B8[i + 1], anim, oam, 1);
        break;
    case 5:
        sx = (u32)(u16)x << 16;
        if ((s32)sx >> 16 > 0xCF)
        {
            sy = (u32)(u16)y << 16;
            if ((s32)sy >> 16 > 0x8F)
            {
                i += 6;
                anim = gUnknown_08499BF0;
            }
            else
            {
                anim = gUnknown_08499C04;
            }
        }
        else
        {
            sy = (u32)(u16)y << 16;
            if ((s32)sy >> 16 > 0x7F)
            {
                i += 0x12;
                anim = gUnknown_08499C18;
            }
            else
            {
                i += 0xC;
                anim = gUnknown_08499BDC;
            }
        }
        ((struct OamData *)&oam)->tileNum = 0x365;
        ((struct OamData *)&oam)->paletteNum = 1;
        sub_0801C01C(((s32)sx >> 16) + gUnknown_080909B8[i],
                     ((s32)sy >> 16) + gUnknown_080909B8[i + 1], anim, oam, 1);
        break;
    case 6:
        sx = (u32)(u16)x << 16;
        if ((s32)sx >> 16 > 0xCF)
        {
            sy = (u32)(u16)y << 16;
            if ((s32)sy >> 16 > 0x8F)
            {
                i += 6;
                anim = gUnknown_08499C40;
            }
            else
            {
                anim = gUnknown_08499C54;
            }
        }
        else
        {
            sy = (u32)(u16)y << 16;
            if ((s32)sy >> 16 > 0x7F)
            {
                i += 0x12;
                anim = gUnknown_08499C68;
            }
            else
            {
                i += 0xC;
                anim = gUnknown_08499C2C;
            }
        }
        ((struct OamData *)&oam)->tileNum = 0x365;
        ((struct OamData *)&oam)->paletteNum = 1;
        sub_0801C01C(((s32)sx >> 16) + gUnknown_080909B8[i],
                     ((s32)sy >> 16) + gUnknown_080909B8[i + 1], anim, oam, 1);
        break;
    }
}




