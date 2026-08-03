#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802CDA4.
 * sub_0802CDA4 @ 0x0802CDA4
 */

/* MATCHED -- 96/96 bytes identical, 0 differing bytes.
 *
 * try_match reports `matched: false` ONLY because of one relocation, and it is
 * the .rodata-placement case the wave brief describes rather than a difference
 * in the ROM:
 *
 *     original  +0x054  R_ARM_ABS32  gUnknown_08090BE4
 *     candidate +0x054  R_ARM_ABS32  .rodata
 *
 * The four ROM words at 0x08090BE4..0x08090BF0 are 0x0802D43D, 0x0802D40D,
 * 0x0802D41D and 0x0802D42D -- the THUMB entry points of sub_0802D43C,
 * sub_0802D40C, sub_0802D41C and sub_0802D42C, in that order. They are the
 * initialiser template for the local function-pointer table below, which agbcc
 * emits into this unit's own .rodata and copies to the stack with the
 * `ldm r0!,{r3,r4,r7}; stm r1!,{r3,r4,r7}; ldr r0,[r0]; str r0,[r1]` block move
 * the ROM has. `gUnknown_08090BE4` is a splitter-invented symbol for that
 * template, not an object.
 *
 * try_match's "different symbols that resolve to the same address" check fires
 * for a pool word HOLDING an address (sub_0802CE04, sub_0802CEB0, sub_0802CEFC,
 * sub_0802CA78 and sub_0802DE1C in this same batch were all accepted that way)
 * but not for a multi-word .rodata blob. PROMOTION MUST CARRY:
 *
 *     "rodata": ["0x08090BE4"]
 *
 * then re-run tools/split_rodata.py and tools/gen_lds.py.
 *
 * The table is declared `void (*[4])()` with NO parameter list on purpose. The
 * four callees are promoted in src/decomp/c_0802D40C.c as `void (void)`, yet
 * this function calls them through the table with THREE arguments -- r0, r1 and
 * r2 are all live at the `bl _call_via_r3`. An unprototyped pointer passes all
 * three under the default argument promotions and needs no cast; a
 * `void (*)(u8, u8, u8)` element type needs four casts in the initialiser.
 *
 * All three parameters are u8: each opens with `lsls #0x18; lsrs #0x18`, and
 * the third one's narrowed value is left in r2 and never copied, which is what
 * shows it is the call's third argument rather than dead.
 */

void sub_0802CDA4(u8 a1, u8 a2, u8 a3)
{
    void (*fns[4])() = {
        sub_0802D43C, sub_0802D40C, sub_0802D41C, sub_0802D42C,
    };

    gUnknown_03003FC0.unk09++;

    if (gUnknown_03003FC0.unk09 > 3)
        gUnknown_03003FC0.unk09 = 0;

    fns[gUnknown_03003FC0.unk09](a1, a2, a3);
    sub_08019E68();
    gUnknown_0200C420.unk0e = gUnknown_03003FC0.unk09;
}
