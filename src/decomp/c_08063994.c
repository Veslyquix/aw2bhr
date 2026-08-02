#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063994.
 * sub_08063994 @ 0x08063994
 */

#include "hardware.h"

void sub_08063994(void)
{
    struct BgAffineSrcData src;

    src.texX = 0x7800;
    src.texY = 0x5000;
    src.scrX = 0x78;
    src.scrY = 0x50;
    src.sx = 0x100;
    src.sy = 0x100;
    src.alpha = 0;
    BgAffineSet(&src, (struct BgAffineDstData *)gUnknown_030024D0, 1);
    BgAffineSet(&src, (struct BgAffineDstData *)gUnknown_03003020, 1);
}
