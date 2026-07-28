#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080199E0.
 * sub_080199E0 @ 0x080199E0, sub_080199EC @ 0x080199EC, sub_080199F8 @ 0x080199F8
 */

#include "hardware.h"

void sub_080199E0(void)
{
    gUnknown_03003FC0.unk03 = gUnknown_03003FC0.unk02;
}

void sub_080199EC(void)
{
    gUnknown_03003FC0.unk02 = gUnknown_03003FC0.unk03;
}

void sub_080199F8(void)
{
    gDispIo.disp_ct.win0_enable = FALSE;
}
