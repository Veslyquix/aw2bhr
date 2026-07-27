#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08013CA8.
 * sub_08013CA8 @ 0x08013CA8
 */

#include "hardware.h"

void sub_08013CA8(void)
{
    u16 i;

    for (i = 0; i < 0x400; i++)
        gUnknown_08499580[i] = 0x360;

    for (i = 0; i < 0x10; i++)
        *(u16 *)(0x0600D800 + gUnknown_030030B4.bits.chr_block * 0x4000 + i * 2) = 0;
}
