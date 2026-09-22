#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080247A4.
 * LoadMapData @ 0x080247A4
 */

void LoadMapData(u16 a1)
{
    void *p;

    if (a1 >= 0xb4 && a1 <= 0xbf)
    {
        sub_08037B84(sub_08014E44(0x724));
        sub_0801AC58(8, gUnknown_03003F68);
    }
    else
    {
        sub_08037B84(sub_08014E44(0xa14));

        p = gUnknown_085C77A0[a1].mapData[IsHardCampaignMode()];
        if (p == NULL)
            p = gUnknown_085C77A0[a1].mapData[0];

        LZ77UnCompWram(p, gUnknown_03003F68);
    }
}

asm(".global sub_080247A4\n.thumb_set sub_080247A4, LoadMapData\n");
