#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080039E4.
 * sub_080039E4 @ 0x080039E4, sub_08003A80 @ 0x08003A80
 */

#include "hardware.h"

/* Display/blend shadow setup. Every 030030E0 access here is ldrb/strb, so this
 * function has NO raw-halfword write at all -- the two target groups are
 * eleven single-bit `.bits` assignments that agbcc merges into one
 * read-modify-write per byte. `effect = 3` is the all-ones case, so it drops
 * the AND (store_fixed_bit_field's all_one) and emits a bare `orr #0xc0`.
 *
 * The `~1` mask built for target1_enable_bg0 = 0 survives in r1 and is reused
 * for target2_enable_bg0 = 0 at byte 1; that reuse is what pins the two clears
 * as the first statement of each group. */
void sub_080039E4(void)
{
    sub_08012358();

    gUnknown_030030E0.bits.effect = 3;
    gUnknown_030030E0.bits.target1_enable_bg0 = 0;
    gUnknown_030030E0.bits.target1_enable_bg1 = 1;
    gUnknown_030030E0.bits.target1_enable_bg2 = 1;
    gUnknown_030030E0.bits.target1_enable_bg3 = 1;
    gUnknown_030030E0.bits.target1_enable_obj = 1;
    gUnknown_030030E0.bits.target2_enable_bg0 = 0;
    gUnknown_030030E0.bits.target2_enable_bg1 = 0;
    gUnknown_030030E0.bits.target2_enable_bg2 = 0;
    gUnknown_030030E0.bits.target2_enable_bg3 = 0;
    gUnknown_030030E0.bits.target2_enable_obj = 0;

    gUnknown_03001FFC = 0;
    gUnknown_03002020 = 0x10;
    gUnknown_03002B28 = 0;

    gDispIo.disp_ct.win0_enable = 0;
    gDispIo.disp_ct.win1_enable = 0;

    gUnknown_03002B40 = 0;
    gUnknown_03002B4C = 0;
    gUnknown_03002EFC = 0xA0;
    gUnknown_03002B44 = 0xA0;
}

/* The parameterised sibling of sub_080039E4: same prologue call, same blend
 * groups with different constants, then the four u8 globals take arguments
 * rather than literals.
 *
 * All four parameters are `int`. The prologue masks nothing (`mov sl,r0;
 * adds r7,r1,#0; mov sb,r2; str r3,[sp]`), and PROMOTE_MODE would have forced
 * a shift pair or an `ands` on any u8/u16 parameter -- so the `strb` at each
 * use is the narrowing into the u8 global, not a parameter width.
 *
 * `gUnknown_03001FFC = v = 0;` is load-bearing and is the whole 4 bytes. The
 * ROM keeps ONE zero pseudo in r4 spanning 03001FFC, 03002B28 and the
 * `gUnknown_030030DC` halfword clear; written as three separate `0` literals
 * the third zero is rematerialised, the allocator re-shuffles, and the
 * candidate comes out 4 bytes SHORT (232) because #2 then wins the callee-saved
 * register the ROM spends on the zero. Same lever as c_08037260.c.
 *
 * The DC halfword clear was probed BOTH ways -- `.raw = v` and
 * `*(u16 *)&gUnknown_030030DC = v` -- and they are byte-identical here despite
 * a live zero being the value stored. See the wave-23 blend-shadow section of
 * docs/agbcc-codegen.md. */
void sub_08003A80(int a1, int a2, int a3, int a4)
{
    u16 v;

    sub_08012358();

    gUnknown_030030E0.bits.effect = 3;
    gUnknown_030030E0.bits.target1_enable_bg1 = 0;
    gUnknown_030030E0.bits.target1_enable_bg2 = 0;
    gUnknown_030030E0.bits.target1_enable_bg3 = 1;
    gUnknown_030030E0.bits.target1_enable_obj = 1;
    gUnknown_030030E0.bits.target2_enable_bg1 = 1;
    gUnknown_030030E0.bits.target2_enable_bg2 = 1;
    gUnknown_030030E0.bits.target2_enable_bg3 = 1;
    gUnknown_030030E0.bits.target2_enable_obj = 1;

    gUnknown_03001FFC = v = 0;
    gUnknown_03002020 = 0x10;
    gUnknown_03002B28 = v;

    gDispIo.disp_ct.win0_enable = 1;

    gUnknown_03002B40 = a1;
    gUnknown_03002B4C = a2;
    gUnknown_03002EFC = a3;
    gUnknown_03002B44 = a4;

    gUnknown_030030A4.bits.win0_enable_bg0 = 1;
    gUnknown_030030A4.bits.win0_enable_bg1 = 1;
    gUnknown_030030A4.bits.win0_enable_bg2 = 1;
    gUnknown_030030A4.bits.win0_enable_bg3 = 1;
    gUnknown_030030A4.bits.win0_enable_obj = 1;
    gUnknown_030030A4.bits.win0_enable_blend = 1;

    gUnknown_030030DC.raw = v;
    gUnknown_030030DC.bits.win0_enable_bg0 = 1;
    gUnknown_030030DC.bits.win0_enable_bg2 = 1;
    gUnknown_030030DC.bits.win0_enable_bg1 = 1;
    gUnknown_030030DC.bits.win0_enable_bg3 = 1;
    gUnknown_030030DC.bits.win0_enable_obj = 1;
    gUnknown_030030DC.bits.win0_enable_blend = 0;
}
