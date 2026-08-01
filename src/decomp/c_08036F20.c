#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08036F20.
 * sub_08036F20 @ 0x08036F20, sub_08036F44 @ 0x08036F44
 */

#include "hardware.h"

/* `>> 6` is `lsrs` because gUnknown_0200C420.unk08 is `u8` -- the wave-27 rule.
 * The store's destination pool word is loaded BEFORE the source's, which is
 * what a plain global-to-global assignment gives. */
void sub_08036F20(void)
{
    gUnknown_02028E40 = gUnknown_0200C420.unk08 >> 6;
    sub_080193B0(gUnknown_0849D34C);
}

/* TWO separate `orrs` of 1 and 4 into the same byte of gDispIo, not one `orrs`
 * of 5: two bitfield assignments, each re-materialising its own mask. Byte 1 of
 * DISPCNT is bits 8..15, so bit 0 is bg0_enable and bit 2 is bg2_enable. */
void sub_08036F44(void)
{
    gDispIo.disp_ct.bg0_enable = 1;
    gDispIo.disp_ct.bg2_enable = 1;

    sub_08022A34();
    sub_0801A5B0(0);
}
