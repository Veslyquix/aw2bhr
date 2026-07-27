#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078B08.
 * sub_08078B08 @ 0x08078B08, sub_08078B74 @ 0x08078B74
 */

#include "hardware.h"

union BlendCntBuf
{
    struct BlendCnt bits;
    u16 raw;
};
extern union BlendCntBuf gUnknown_030030E0;
extern struct WinCnt gUnknown_030030A4;
extern struct WinCnt gUnknown_030030DC;
extern u16 gUnknown_03001FFC;

void sub_08078B08(void)
{
    gUnknown_030030E0.bits.effect = 2;

    gUnknown_03002020 = 0;
    gUnknown_03002B28 = 0;
    gUnknown_03001FFC = 0;

    gUnknown_030030E0.raw = (gUnknown_030030E0.raw & 0xFFE0) | 0x1F;
    gUnknown_030030E0.bits.target1_enable_bd = 1;

    gUnknown_030030A4.win0_enable_blend = 1;
    gUnknown_030030DC.win0_enable_blend = 1;
    gUnknown_030030A4.win1_enable_blend = 1;
    gUnknown_030030DC.win1_enable_blend = 1;
}

void sub_08078B74(void)
{
    gUnknown_030030E0.bits.effect = 3;

    gUnknown_03002020 = 0;
    gUnknown_03002B28 = 0;
    gUnknown_03001FFC = 0;

    gUnknown_030030E0.raw = (gUnknown_030030E0.raw & 0xFFE0) | 0x1F;
    gUnknown_030030E0.bits.target1_enable_bd = 1;

    gUnknown_030030A4.win0_enable_blend = 1;
    gUnknown_030030DC.win0_enable_blend = 1;
    gUnknown_030030A4.win1_enable_blend = 1;
    gUnknown_030030DC.win1_enable_blend = 1;
}
