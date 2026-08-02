#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08037DC8.
 * sub_08037DC8 @ 0x08037DC8
 */

void sub_08037DC8(void)
{
    sub_08012C58(gUnknown_0849D16C);
    sub_0801295C();
    sub_080128D0();
    sub_08011C68(gUnknown_08499578, (void *)0x06007000, 0x800);
    sub_08011C68(gUnknown_0849957C, (void *)0x0600F000, 0x800);
    sub_08011C68(gUnknown_08499580, (void *)0x06007800, 0x800);
    sub_08011C68(gUnknown_08499584, (void *)0x0600F800, 0x800);
    sub_08011C68(gUnknown_080A0F38, (void *)0x06000020, 0x200);
    ApplyPaletteExt(gUnknown_080A1138, 0x20, 0x20);
    sub_08022A34();
    sub_0801A5B0(0);
}
