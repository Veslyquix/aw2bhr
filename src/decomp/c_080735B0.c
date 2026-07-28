#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080735B0.
 * sub_080735B0 @ 0x080735B0
 */

#include "hardware.h"

void sub_080735B0(void)
{
    REG_DMA0CNT_H = 0;

    REG_DMA0SAD = 0;
    REG_DMA0DAD = 0;
    REG_DMA0CNT_L = 0;
}
