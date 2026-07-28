#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806D944.
 * sub_0806D944 @ 0x0806D944
 */

#include "hardware.h"

/* The near-twin of sub_08065990: identical through the blend setup, the seven
 * mode calls and the eight scroll zeros, then it diverges. Differences, all of
 * them local: sub_0806D850 stands in for the
 * `Decompress(sub_0801F49C(), 0x06015200)` / sub_0806574C / gUnknown_08580CB4
 * group; the three sub_0801F150 sizes are 0x290 / 0x2a0 / 0x2e0 rather than
 * 0x298 / 0x2a8 / 0x2d2; the second glyph run ends 0x8c, 0x8d instead of 0x68;
 * and the tail is a different set of calls with gUnknown_08580934->unk30 only
 * cleared, never set back.
 *
 * The `sub sp, #0xc` in the prologue is sub_08073304's three stack arguments
 * and nothing else -- there are no locals.
 */

void sub_0806D944(void)
{
    sub_080366D0(sub_08036884);
    sub_080366C4(sub_080368E8);
    sub_08012C58(gUnknown_0849D16C);
    sub_0801237C();

    gUnknown_030030E0.bits.effect = 1;
    gUnknown_030030E0.bits.target1_enable_bg0 = 0;
    gUnknown_030030E0.bits.target1_enable_bg1 = 1;
    gUnknown_030030E0.bits.target1_enable_bg2 = 0;
    gUnknown_030030E0.bits.target1_enable_bg3 = 0;
    gUnknown_030030E0.bits.target1_enable_obj = 0;
    gUnknown_030030E0.bits.target2_enable_bg0 = 1;
    gUnknown_030030E0.bits.target2_enable_bg1 = 0;
    gUnknown_030030E0.bits.target2_enable_bg2 = 1;
    gUnknown_030030E0.bits.target2_enable_bg3 = 1;
    gUnknown_030030E0.bits.target2_enable_obj = 1;
    gUnknown_03002020 = 0xf;
    gUnknown_03002B28 = 6;

    sub_08013C00();
    sub_08013C54();
    sub_08013CA8();
    sub_08013AEC();
    sub_08013AFC();
    sub_08013B0C();
    sub_08013B1C();

    gUnknown_03001FF8 = 0;
    gUnknown_03001418 = 0;
    gUnknown_03002B34 = 0;
    gUnknown_03002F18 = 0;
    gUnknown_030030A0 = 0;
    gUnknown_03001400 = 0;
    gUnknown_0300200C = 0;
    gUnknown_03002000 = 0;

    Decompress(gUnknown_0822FEF0, (void *)((gUnknown_0300251C.bits.chr_block << 14) + 0x06000000));
    Decompress(gUnknown_0822F9AC, gUnknown_08499584);
    ApplyPaletteExt(gUnknown_082344CC, 0x20, 0xa0);
    sub_08013B1C();
    sub_0802D5A0((void *)((gUnknown_030030B4.bits.chr_block << 14) + 0x06006C00), 0, 8);
    sub_0801A444(0, 0x10, 0x1e, 4);
    sub_0802D5CC(0, 3);
    sub_0806D850();
    sub_0801F114();

    sub_0801F150(1, (void *)0x06010000, 0x290, 0x19);
    sub_0801F234(0x3e);
    sub_0801F234(0x3f);
    sub_0801F234(0x40);
    sub_0801F234(0x41);

    sub_0801F150(2, (void *)0x06010000, 0x2a0, 0x1a);
    sub_0801F234(0x4a);
    sub_0801F234(0x4b);
    sub_0801F234(0x4c);
    sub_0801F234(0x4d);
    sub_0801F234(0x4e);
    sub_0801F234(0x43);
    sub_0801F234(0x44);
    sub_0801F234(0x55);
    sub_0801F234(0x56);
    sub_0801F234(0x57);
    sub_0801F234(0x58);
    sub_0801F234(0x59);
    sub_0801F234(0x5a);
    sub_0801F234(0x5b);
    sub_0801F234(0x5c);
    sub_0801F234(0x5d);
    sub_0801F234(0x5e);
    sub_0801F234(0x8c);
    sub_0801F234(0x8d);

    sub_0801F150(5, (void *)0x06010000, 0x2e0, 0x1b);
    sub_0801F234(0xbc);
    sub_0801F234(0xbd);
    sub_0801F234(0xbe);
    sub_0801F234(0xbf);
    sub_0801F234(0xc0);
    sub_0801F234(0xc1);
    sub_0801F234(0xc2);
    sub_0801F234(0xc3);
    sub_0801F234(0xc4);
    sub_0801F234(0xc5);
    sub_0801F234(0xc6);
    sub_0801F234(0xc7);
    sub_0801F234(0xc8);
    sub_0801F234(0xc9);
    sub_0801F234(0xca);
    sub_0801F234(0xcb);
    sub_0801F234(0xcc);
    sub_0801F234(0xcd);
    sub_0801F234(0xce);
    sub_0801F234(0xcf);
    sub_0801F234(0xd0);
    sub_0801F234(0xd1);
    sub_0801F234(0xd2);
    sub_0801F234(0xd3);
    sub_0801F234(0xd4);
    sub_0801F234(0xd5);
    sub_0801F234(0xd6);
    sub_0801F234(0xd7);

    sub_0806D820();
    sub_080152EC(gUnknown_08580CC4, 3);
    sub_080733B8();
    sub_08073304(gUnknown_085802AC, gUnknown_0200FC50, 0x230, 0xf, 1, 1, 3);
    sub_0806D620();
    sub_0806D268();
    gUnknown_08580934->unk30 = 0;
}
