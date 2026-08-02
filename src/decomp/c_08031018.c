#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08031018.
 * sub_08031018 @ 0x08031018
 */

void sub_08031018(void)
{
    sub_080135F4(gUnknown_081D3E48, 0x300, 0x20);
    sub_080135F4(gUnknown_081D3E48, 0x320, 0x20);
    sub_080135F4(gUnknown_081D3E48, 0x340, 0x20);
    sub_080135F4(gUnknown_081D3E48, 0x360, 0x20);

    Decompress(gUnknown_081D3810, (void *)0x060114A0);
    sub_0801F150(2, (void *)0x06010000, 0, 0x16);

    sub_0801F234(0x50);
    sub_0801F234(0x4f);
    sub_0801F234(0x4a);
    sub_0801F234(0x4b);
    sub_0801F234(0x4c);
    sub_0801F234(0x4d);

    ApplyPaletteExt(gUnknown_081320AC, 0x60, 0x20);
    ApplyPaletteExt(gUnknown_0849B0A0, 0xe0, 0x20);

    sub_0801A5B0(0);

    gUnknown_0849B018->unk1e = 0x10;
    gUnknown_0849B060->unk00 = 0x13;
}
