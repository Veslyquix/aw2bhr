#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08036B34.
 * sub_08036B34 @ 0x08036B34, sub_08036B4C @ 0x08036B4C, sub_08036C08 @ 0x08036C08, sub_08036C2C @ 0x08036C2C, sub_08036C4C @ 0x08036C4C, sub_08036C80 @ 0x08036C80, sub_08036CB4 @ 0x08036CB4, AgbMain @ 0x08036D1C
 */

#include "proc.h"
#include "hardware.h"

/* The boot/reset unit's frame-gate reset: clears the mask sub_080369BC ANDs
 * against gUnknown_03004008, then re-enters through sub_0801F00C.
 *
 * sub_08036B48 below is NOT a label. The index gives this function a size of
 * 24, but the body plus its single pool word only reach 0x08036B48; the last
 * four bytes are `b .` plus two of alignment padding. AgbMain reaches them
 * with `bl _08036B48` -- a CALL -- so a separate two-byte `for (;;) ;`
 * function lives there and was folded into this one's extent only because it
 * carries no symbol. It has to stay immediately below this definition: that
 * adjacency is what puts it at 0x08036B48 and what supplies the four bytes
 * this function's size is measured over. */
void sub_08036B34(void)
{
    gUnknown_030043F4 = 0;
    sub_0801F00C();
}

static void sub_08036B48(void)
{
    for (;;)
        ;
}

/* The boot reset. Clears seven RAM cells, drops both single-slot callbacks
 * installed through sub_080366C4 / sub_080366D0, and then runs every
 * subsystem's own init in a flat chain. Every store is a bare 0 out of the
 * same callee-saved register, which fixes each cell's WIDTH and nothing else --
 * see the notes on them in include/unknown-globals.h. */
void sub_08036B4C(void)
{
    gUnknown_030040A0 = 0;
    gUnknown_02028E40 = 0;
    sub_08010FE0();
    sub_080366C4(0);
    sub_080366D0(0);
    gUnknown_03004094 = 0;
    gUnknown_03004008 = 0;
    gUnknown_03003330 = 0;
    gUnknown_03004078 = 0;
    gUnknown_030043F0 = 0;
    gUnknown_030033F0 = 0;
    sub_08036B34();
    sub_0801B6BC();
    sub_0803486C();
    sub_08034848();
    sub_0801BCE0();
    sub_08015544();
    sub_08011C18();
    sub_08011B18();
    sub_08011A84();
    sub_080191B0();
    sub_08015184();
    Proc_Init();
    sub_08035568();
    sub_08010F94();
    sub_08013434();
    sub_0801F4A4();
    sub_0801295C();
    sub_080128D0();
    sub_0803B37C();
    sub_0803B688();
    sub_08030ED4();
    sub_08085AF4();
    sub_08080F90(0);
    sub_0801F114();
}

/* A mode-entry sequence in the same shape as sub_080780E4: install a handler
 * pair through the sub_080366C4 / sub_080366D0 setters, then hand off. */
void sub_08036C08(void)
{
    sub_0801F018();
    sub_080366D0(sub_08036A50);
    sub_080366C4(sub_08036AB8);
    sub_08036B28();
}

/* Full reset, then enter the gUnknown_08553754 screen on tree 3. */
void sub_08036C2C(void)
{
    sub_08036B4C();
    sub_08036C08();
    Proc_Start(gUnknown_08553754, PROC_TREE_3);
    sub_08036B34();
}

/* A screen entry point. STRICT duplicate of sub_08036C80: the two instruction
 * streams are identical INCLUDING every pool symbol, so the two functions are
 * the same source twice over and nothing distinguishes them but their address.
 */
void sub_08036C4C(void)
{
    sub_0801F00C();
    sub_08036B4C();
    gUnknown_030032CC = 0xE28;
    sub_080366D0(sub_08036884);
    sub_080366C4(sub_080368E8);
    sub_0806A454();
}

/* STRICT duplicate of sub_08036C4C -- identical down to the pool symbols. */
void sub_08036C80(void)
{
    sub_0801F00C();
    sub_08036B4C();
    gUnknown_030032CC = 0xE28;
    sub_080366D0(sub_08036884);
    sub_080366C4(sub_080368E8);
    sub_0806A454();
}

/* Soft reset preserving four bytes of gUnknown_02028E41. The four bytes are
 * copied out one at a time into a stack buffer, all 256K of EWRAM is cleared
 * with a fixed-source DMA3 fill, the four bytes are written back, and control
 * leaves through SoftReset(0xFE).
 *
 * The three DMA registers are reached through one `vu32 *` cursor at
 * displacements 0/4/8 rather than by name, the same idiom c_080638A8.c
 * documents; naming them emits an `add` between the stores. The trailing read
 * of dma[2] is the usual discarded post-trigger read and only survives because
 * the pointer is volatile.
 *
 * The byte copies are written out individually rather than as a loop or a
 * memcpy because that is what the ROM has: four separate `strb`s through four
 * separate address registers, which is what agbcc must emit for a stack array
 * (THUMB `strb` has no sp-relative form). */
void sub_08036CB4(void)
{
    u8 buf[4];
    vu16 fill;
    vu32 *dma;

    buf[0] = gUnknown_02028E41[0];
    buf[1] = gUnknown_02028E41[1];
    buf[2] = gUnknown_02028E41[2];
    buf[3] = gUnknown_02028E41[3];
    fill = 0;
    dma = (vu32 *)(REG_BASE + REG_OFFSET_DMA3SAD);
    dma[0] = (u32)&fill;
    dma[1] = 0x02000000;
    dma[2] = 0x81020000;
    dma[2];
    gUnknown_02028E41[0] = buf[0];
    gUnknown_02028E41[1] = buf[1];
    gUnknown_02028E41[2] = buf[2];
    gUnknown_02028E41[3] = buf[3];
    SoftReset(0xFE);
}

/* The ROM entry point, called from src/crt0.s.
 *
 * Clears 0x1FE0 words of IWRAM from 0x03000000 with a fixed-source DMA3 fill,
 * sets the waitstate control word, latches the keypad ONCE, brings up the
 * subsystems, then enters the frame loop for good.
 *
 * `keys` is volatile: the ROM spills it to the frame and re-reads it with a
 * fresh `add r0, sp, #4; ldrh r1, [r0]` at each of the two tests, which is
 * what a volatile local emits and what a plain one does not -- a plain `u16`
 * lands in r4 and the frame comes out 8 bytes instead of 0xC.
 *
 * The `flag` temporary is likewise in the ROM rather than inferred: the
 * condition is materialised as 0/1 into a register and only then tested, which
 * is an assignment followed by an `if`, not a compound `if` (see the
 * unconditional-`b` rule in docs/agbcc-codegen.md). */
void AgbMain(void)
{
    u32 zero;
    volatile u16 keys;
    vu32 *dma;
    int flag;

    zero = 0;
    dma = (vu32 *)(REG_BASE + REG_OFFSET_DMA3SAD);
    dma[0] = (u32)&zero;
    dma[1] = 0x03000000;
    dma[2] = 0x85001FE0;
    dma[2];
    REG_WAITCNT = 0x45B4;
    keys = ~REG_KEYINPUT & 0x3FF;
    sub_0801BABC();
    if (sub_08014DA8(gUnknown_02003000, 0x8000) == -1)
        sub_08036B48();
    sub_0801A79C(sub_08016B2C, sub_08016A54, gUnknown_02000000, 2, gUnknown_03003064);
    sub_08016E3C();
    sub_0803D48C();
    sub_080129D4(0x0A6B99CD);
    sub_080128C4();
    sub_080128D0();
    sub_0801BB00(0, sub_080366F4);
    flag = (keys & 0xF) != 0xF && keys == 0x214;
    if (flag)
        sub_08036E54();
    else
        sub_08036C4C();
    sub_0801BB10(2, 0x00012001);
    for (;;) {
        if (gUnknown_030040EC != 0)
            gUnknown_030040EC();
        sub_08036E18();
    }
}
