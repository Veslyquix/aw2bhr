#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004F9C.
 * sub_08004F9C @ 0x08004F9C
 */

/* MATCHED, wave 36 (W36-I). PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D7AC"]
 * 0x0808D7AC holds &gActiveMap (checked in baserom.gba); it is a
 * -fforce-addr word, not a global, so gActiveMap is named honestly.
 *
 * `case 0: break;` is not decoration: sharing the default label with case 0 is
 * what puts the low-bound `cmp r0,#1; ble` into the compare tree. Without it
 * agbcc emits three comparisons instead of four.
 *
 * `gBG0TilemapBuffer + (v * 32 + 3)` must keep the index parenthesised --
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
    sub_0803CF54(gActiveMap->designSlot, gActiveMap->designName,
                 sub_0800C9E8());
    sub_0800CB30(1, t);

    v = 7;
    switch ((s8)gActiveMap->designSlot)
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

    sub_08012BC8(gBG0TilemapBuffer, 3, v, 0xB, 2, 0);
    sub_0801F2AC(9, gBG0TilemapBuffer + (v * 32 + 3));
    sub_080149C0(5, (s16)v, gBG0TilemapBuffer, gActiveMap->designName,
                 0x8000, 0);
    sub_08013AEC();

    if (gActiveMap->flags & 0x100)
    {
        gActiveMap->flags &= 0xFEFF;
        gActiveMap->designName[0] = 0;
    }

    gActiveMap->flags &= 0xEFFF;
}
