#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801BEBC.
 * PutSprite @ 0x0801BEBC, PutSpriteExt @ 0x0801BEFC
 */

void PutSprite(u32 layer, u32 x, u32 y, u16 * object, u32 oam2)
{
    gUnknown_03002B24->next = gUnknown_0200D510[layer].next;
    gUnknown_03002B24->oam1 = x & 0x1FF;
    gUnknown_03002B24->oam0 = y & 0xFF;
    gUnknown_03002B24->oam2 = oam2;
    gUnknown_03002B24->object = object;

    gUnknown_0200D510[layer].next = gUnknown_03002B24;
    gUnknown_03002B24++;
}

void PutSpriteExt(u32 layer, u32 x_oam1, u32 y_oam0, u16 * object, u32 oam2)
{
    gUnknown_03002B24->next = gUnknown_0200D510[layer].next;
    gUnknown_03002B24->oam1 = x_oam1;
    gUnknown_03002B24->oam0 = y_oam0;
    gUnknown_03002B24->oam2 = oam2;
    gUnknown_03002B24->object = object;

    gUnknown_0200D510[layer].next = gUnknown_03002B24;
    gUnknown_03002B24++;
}
