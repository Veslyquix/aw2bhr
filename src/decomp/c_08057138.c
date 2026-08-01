#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08057138.
 * sub_08057138 @ 0x08057138
 */

void sub_08057138(void)
{
    sub_080566C8(0);
    sub_0804C0FC(0);
    sub_0804C0FC(1);
    CpuFastSet(gUnknown_08552680, (void *)0x05000340, 0x10);
}
