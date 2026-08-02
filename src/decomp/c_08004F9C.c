#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004F9C.
 * sub_08004F9C @ 0x08004F9C
 */

/* MATCHED, wave 36 (W36-I). PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D7AC"]
 * 0x0808D7AC holds &gUnknown_0200B0B0 (checked in baserom.gba); it is a
 * -fforce-addr word, not a global, so gUnknown_0200B0B0 is named honestly.
 *
 * `case 0: break;` is not decoration: sharing the default label with case 0 is
 * what puts the low-bound `cmp r0,#1; ble` into the compare tree. Without it
 * agbcc emits three comparisons instead of four.
 *
 * `gUnknown_08499578 + (v * 32 + 3)` must keep the index parenthesised --
 * `+ v * 32 + 3` adds the base before the constant and costs the ROM's
 * `lsls #6; adds #6` pairing.
 *
 * sub_0800CB30 returns a value: it is called (0, 0) here and then
 * (1, <that result>), which is the only site in the tree that shows it. */

void sub_08004F9C(void)
{
    int t;
    int v;

    t = sub_0800CB30(0, 0);
    sub_0803CF54(gUnknown_0200B0B0->unk10, &gUnknown_0200B0B0->unk9c,
                 sub_0800C9E8());
    sub_0800CB30(1, t);

    v = 7;
    switch ((s8)gUnknown_0200B0B0->unk10)
    {
    case 0:
        break;
    case 1:
        v = 9;
        break;
    case 2:
        v = 0xB;
        break;
    }

    sub_08012BC8(gUnknown_08499578, 3, v, 0xB, 2, 0);
    sub_0801F2AC(9, gUnknown_08499578 + (v * 32 + 3));
    sub_080149C0(5, (s16)v, gUnknown_08499578, &gUnknown_0200B0B0->unk9c,
                 0x8000, 0);
    sub_08013AEC();

    if (gUnknown_0200B0B0->unk00 & 0x100)
    {
        gUnknown_0200B0B0->unk00 &= 0xFEFF;
        gUnknown_0200B0B0->unk9c = 0;
    }

    gUnknown_0200B0B0->unk00 &= 0xEFFF;
}
