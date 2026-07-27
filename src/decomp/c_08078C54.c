#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078C54.
 * sub_08078C54 @ 0x08078C54, sub_08078CC8 @ 0x08078CC8
 */

#include "hardware.h"

union BlendCntBuf
{
    struct BlendCnt bits;
    u16 raw;
};
struct Unk8078C54
{
    u8 filler_00[0x68];
    u16 unk_68;
};
extern union BlendCntBuf gUnknown_030030E0;
extern struct WinCnt gUnknown_030030A4;
extern struct WinCnt gUnknown_030030DC;
extern u16 gUnknown_03001FFC;
struct Unk8078CC8
{
    u8 filler_00[0x68];
    u16 unk_68;
};

void sub_08078C54(struct Unk8078C54 * proc)
{
    gUnknown_030030E0.bits.effect = 3;

    gUnknown_03002020 = 0;
    gUnknown_03002B28 = 0;
    gUnknown_03001FFC = 6;

    *(vu16 *)&gUnknown_030030E0 = (*(vu16 *)&gUnknown_030030E0 & 0xFFE0) | 0x1F;
    gUnknown_030030E0.bits.target1_enable_bd = 1;

    gUnknown_030030A4.win0_enable_blend = 1;
    gUnknown_030030DC.win0_enable_blend = 1;
    gUnknown_030030A4.win1_enable_blend = 1;
    gUnknown_030030DC.win1_enable_blend = 1;

    proc->unk_68 = 0;
}

void sub_08078CC8(struct Unk8078CC8 * proc)
{
    gUnknown_030030E0.bits.effect = 2;

    gUnknown_03002020 = 0;
    gUnknown_03002B28 = 0;
    gUnknown_03001FFC = 6;

    *(vu16 *)&gUnknown_030030E0 = (*(vu16 *)&gUnknown_030030E0 & 0xFFE0) | 0x1F;
    gUnknown_030030E0.bits.target1_enable_bd = 1;

    gUnknown_030030A4.win0_enable_blend = 1;
    gUnknown_030030DC.win0_enable_blend = 1;
    gUnknown_030030A4.win1_enable_blend = 1;
    gUnknown_030030DC.win1_enable_blend = 1;

    proc->unk_68 = 0;
}
