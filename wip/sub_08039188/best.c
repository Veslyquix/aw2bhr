#include "global.h"

/* Draws the overworld marker sprites: walk gUnknown_0849D5F8's parallel
 * per-slot tables from the last slot down, and for every marker whose 16x16
 * box is on screen put a sprite at the camera-relative position, with the tile
 * looked up in gUnknown_0849D5C4 by whatever sub_080390CC and sub_08039064
 * classify the slot as.
 *
 * WAVE 88 (W88-D) probe: parameter 0 of sub_08039140 retyped u16 -> int in
 * include/unknown-functions.h, with the definition compensating explicitly.
 * See work/sub_08039188/W88-notes.md. */
void sub_08039188(void)
{
    s8 i;
    int x;
    int y;

    if (gUnknown_0849D5F8->unk45 == 0)
        return;

    for (i = gUnknown_0849D5F8->unk45; i >= 0; i--)
    {
        x = gUnknown_0849D5F8->unk20[i];
        y = gUnknown_0849D5F8->unk2c[i];

        if (sub_08039140(x * 16, y * 16, 0x10, 0x10) != 0)
        {
            PutSprite(3,
                      (x * 16 - *(s16 *)(gUnknown_08499590 + 4)) & 0x1FF,
                      (y * 16 - *(s16 *)(gUnknown_08499590 + 6)) & 0xFF,
                      gUnknown_0848B690,
                      0x3000 | gUnknown_0849D5C4[sub_080390CC(i)][sub_08039064(i)]);
        }
    }
}
