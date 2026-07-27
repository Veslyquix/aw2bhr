#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08012358.
 * sub_08012358 @ 0x08012358, sub_0801237C @ 0x0801237C
 */

extern u16 gUnknown_030030E0;
extern u16 gUnknown_03002020;
extern u16 gUnknown_03002B28;
extern u16 gUnknown_03001FFC;
#include "hardware.h"
extern u8 gUnknown_03002B40;
extern u8 gUnknown_03002B4C;
extern u8 gUnknown_03002EFC;
extern u8 gUnknown_03002B44;
extern u8 gUnknown_03002B68;
extern u8 gUnknown_030024E4;
extern u8 gUnknown_03002B30;
extern u8 gUnknown_030020B8;
extern u16 gUnknown_030030A4;
extern u16 gUnknown_030030DC;

void sub_08012358(void)
{
    gUnknown_030030E0 = 0;
    gUnknown_03002020 = 0;
    gUnknown_03002B28 = 0;
    gUnknown_03001FFC = 0;
}

void sub_0801237C(void)
{
    SetWinEnable(0, 0, 0);

    gUnknown_03002B40 = 0;
    gUnknown_03002B4C = 0;
    gUnknown_03002EFC = 0;
    gUnknown_03002B44 = 0;
    gUnknown_03002B68 = 0;
    gUnknown_030024E4 = 0;
    gUnknown_03002B30 = 0;
    gUnknown_030020B8 = 0;

    gUnknown_030030A4 = 0;
    gUnknown_030030DC = 0;
}
