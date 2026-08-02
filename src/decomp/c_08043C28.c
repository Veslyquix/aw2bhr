#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043C28.
 * sub_08043C28 @ 0x08043C28
 */

void sub_08043C28(int x, int y, int oam2, int layer, u8 flag)
{
    u16 xh = x & ~0x1ff;
    u16 yh = y & ~0xff;

    x &= 0x1ff;
    y = (y - 0xa0) & 0xff;

    if (flag)
        x |= 0x1000;

    PutSpriteExt(layer, xh | x, yh | y, gUnknown_084A0756, oam2);
}
