#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08087220.
 * sub_08087220 @ 0x08087220
 */

void sub_08087220(int a, int b)
{
    PutSprite(1, 0x1FE, b + a * 16, gUnknown_08615C4E, 0x5470);
}
