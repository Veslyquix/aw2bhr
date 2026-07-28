#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08013C54.
 * sub_08013C54 @ 0x08013C54
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08013C54.
 * sub_08013C54 @ 0x08013C54
 */

#include "hardware.h"

void sub_08013C54(void)
{
    u16 i;

    for (i = 0; i < 0x400; i++)
        gUnknown_0849957C[i] = 0;

    for (i = 0; i < 0x10; i++)
        *(u16 *)(0x06000000 + gUnknown_03001FE8.bits.chr_block * 0x4000 + i * 2) = 0;
}
