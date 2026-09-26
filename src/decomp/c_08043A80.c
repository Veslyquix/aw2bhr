#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043A80.
 * GetCoPowerAnimation @ 0x08043A80, GetCoPowerAnimationPalette @ 0x08043A90
 */

void *GetCoPowerAnimation(int a)
{
    return gUnknown_084A06F0[a].unk00;
}

asm(".global sub_08043A80\n.thumb_set sub_08043A80, GetCoPowerAnimation\n");

void *GetCoPowerAnimationPalette(int a)
{
    return gUnknown_084A06F0[a].unk04;
}

asm(".global sub_08043A90\n.thumb_set sub_08043A90, GetCoPowerAnimationPalette\n");
