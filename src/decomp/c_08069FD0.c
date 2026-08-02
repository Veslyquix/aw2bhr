#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08069FD0.
 * sub_08069FD0 @ 0x08069FD0
 */

/* The near-twin of sub_080697CC: same seven steps, but the first blob goes to
 * 0x06008000 instead of 0x06000000, the gUnknown_0849957C blob is absent, and
 * there is no sub_08013AFC call. 0x06000000 is reachable as `0xc0 << 19` and
 * 0x06008000 is not, which is why that one destination is a pool word here and
 * a shifted immediate there. */
void sub_08069FD0(void)
{
    int zero;

    zero = 0;
    CpuFastSet(&zero, gUnknown_08580E60, 0x01000400);
    Decompress(gUnknown_08184FF4, (void *)0x06008000);
    Decompress(gUnknown_08185F0C, (void *)0x0600C000);
    ApplyPaletteExt(gUnknown_081866D8, 0xc0, 0x20);
    Decompress(gUnknown_0818633C, gUnknown_08499580);
    Decompress(gUnknown_08186460, gUnknown_08580E60);
    sub_08013B0C();
    sub_08011E54(gUnknown_08580E60, (void *)0x0600F000, 0x1000);
}
