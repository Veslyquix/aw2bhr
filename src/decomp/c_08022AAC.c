#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08022AAC.
 * sub_08022AAC @ 0x08022AAC
 */

void sub_08022AAC(u16 x, u16 y)
{
    gUnknown_030033E4.unk00 = x;
    gUnknown_030033E4.unk02 = y;
    gUnknown_030033E0.unk00 = x << 4;
    gUnknown_030033E0.unk02 = y << 4;
}
