#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08067638.
 * sub_08067638 @ 0x08067638
 */

/* Loads the 0x08067 screen: three graphics blobs, one palette, and both BG
 * scrolls reset. `movs r1,#0xc0; lsls r1,#0x13` is the literal 0x06000000. */
void sub_08067638(void)
{
    Decompress(gUnknown_0817B970, (void *)0x06000000);
    Decompress(gUnknown_0817BE90, (void *)0x0600D800);
    Decompress(gUnknown_0817C138, (void *)0x0600E000);

    ApplyPaletteExt(gUnknown_0817C3E8, 0, 0x20);

    sub_08072C40(0, 0, 0);
    sub_08072C40(1, 0, 0);
}
