#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043590.
 * sub_08043590 @ 0x08043590
 */

void sub_08043590(void)
{
    volatile u32 t = gUnknown_03004008;

    if ((u16)(gUnknown_030005D0 - 1) > 3)
        return;
    if (gUnknown_03003FC0.unk07 == 0)
        return;

    if (sub_0804423C(gUnknown_030005D0))
        sub_0801368C((u16 *)((((t >> 2) & 0xf) * 2) + (int)gUnknown_08104324), 0x2f6, 2);
    else
        sub_0801368C((u16 *)((((t >> 1) & 0xf) * 2) + (int)gUnknown_08104304), 0x2f6, 2);
}
