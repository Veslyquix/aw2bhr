#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080225CC.
 * sub_080225CC @ 0x080225CC
 */

/* The gBG2TilemapBuffer twin of sub_080223E0 -- same 2x2 block, same address
 * form (see the comment there), but filled with 0x360, the same value
 * sub_08013CA8 clears that whole tilemap to. */
void sub_080225CC(u16 x, u16 y)
{
    int cx;
    int cy;

    cx = (x - gMap->camX) & 0xf;
    cy = (y - gMap->camY) & 0xf;

    *(gBG2TilemapBuffer + cx * 2 + cy * 64) = 0x360;
    *(gBG2TilemapBuffer + cx * 2 + cy * 64 + 1) = 0x360;
    *(gBG2TilemapBuffer + cx * 2 + cy * 64 + 0x20) = 0x360;
    *(gBG2TilemapBuffer + cx * 2 + cy * 64 + 0x21) = 0x360;
}
