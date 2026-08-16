#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080129E0.
 * sub_080129E0 @ 0x080129E0
 *
 * Named per Xenesis's AW2 Datasheet/Subroutine List: "RNG Subroutine". The
 * old sub_XXXXXXXX symbol is kept as a linker alias below so every other
 * unit keeps resolving it unchanged.
 */

u32 GetNextRandomNumber(void)
{
    u32 x = gUnknown_03001FD4 * 4;
    u32 y = x + 2;

    y *= x + 3;

    return gUnknown_03001FD4 = y >> 2;
}

asm(".global sub_080129E0\n.thumb_set sub_080129E0, GetNextRandomNumber\n");
