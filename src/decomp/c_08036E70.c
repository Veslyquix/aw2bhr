#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08036E70.
 * sub_08036E70 @ 0x08036E70
 */

#include "hardware.h"

void sub_08036E70(void)
{
    sub_08012C58(gUnknown_0849D16C);
    gDispIo.disp_ct.forced_blank = 0;
    sub_0801295C();
    sub_080128D0();
    sub_08011C68(gUnknown_08499578, (void *)0x06007000, 0x800);
    sub_08011C68(gUnknown_0849957C, (void *)0x0600F000, 0x800);
    sub_08011C68(gUnknown_08499580, (void *)0x06007800, 0x800);
    sub_08011C68(gUnknown_08499584, (void *)0x0600F800, 0x800);
    sub_0802465C();
    sub_0801A5B0(0);
    ApplyPaletteExt(gUnknown_0809165C, 0x140, 0x20);
    sub_08011B18();
    sub_080366C4(sub_080368E8);
    sub_080366D0(sub_08036884);
}
