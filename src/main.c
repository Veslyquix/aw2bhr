#include "global.h"
#include "proc.h"
#include "hardware.h"

/* Main/reset code, contiguous from 0x08036B28 through 0x08037170.
 * The adjacent source units have their own .rodata placements.
 * Keep these functions in address order to preserve the ROM layout. */

void sub_08036B28(void)
{
    gUnknown_030043F4 = 0;
}

/* The boot/reset unit's frame-gate reset: clears the mask sub_080369BC ANDs
 * against gGameClock, then re-enters through sub_0801F00C.
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
    gGameClock = 0;
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
        CheckSoftResetCombo();
    }
}

/* The soft-reset combo check: A+B+Select+Start (the low four KEYINPUT bits)
 * re-inits the save area unless its 0xAA/0x55 signature is already there.
 *
 * `keys` MUST be bound, and bound as `u16`. Written inline as
 * `((~REG_KEYINPUT & 0x3ff) & 0xf) == 0xf` the two masks fold to a single
 * `& 0xf` and the 0x3FF pool word disappears -- 8 bytes. Bound as `int` the
 * masks stay apart but the `adds r0, r2, #0` copy of the pool word does not
 * appear. `u16` gives both, and it is the same spelling AgbMain already uses
 * for this register in src/main.c.
 *
 * The `||` is a real short-circuit: `bne` on the first byte jumps straight to
 * the call, `beq` on the second skips it.
 *
 * Named per Xenesis's AW2 Subroutine List: "Subroutine that checks whether
 * A, B Start Select is pressed and performs a soft reset." The old
 * CheckSoftResetCombo symbol is kept as a linker alias below so every other unit
 * keeps resolving it unchanged. */
void CheckSoftResetCombo(void)
{
    u16 keys;

    keys = ~REG_KEYINPUT & 0x3ff;

    if ((keys & 0xf) == 0xf)
    {
        if (gUnknown_02028E41[0] != 0xaa || gUnknown_02028E41[1] != 0x55)
            sub_0804A010();

        sub_08036CB4();
    }
}

asm(".global sub_08036E18\n.thumb_set sub_08036E18, CheckSoftResetCombo\n");

void sub_08036E54(void)
{
    sub_08036B4C();
    sub_0801B780(0);
    sub_080152EC(gUnknown_0849D1AC, 0);
}

void sub_08036E70(void)
{
    sub_08012C58(gUnknown_0849D16C);
    gDispIo.disp_ct.forced_blank = 0;
    sub_0801295C();
    sub_080128D0();
    sub_08011C68(gUnknown_08499578, (void *)0x06007000, 0x800);
    sub_08011C68(gUnknown_0849957C, (void *)0x0600F000, 0x800);
    sub_08011C68(gUnknown_08499580, (void *)0x06007800, 0x800);
    sub_08011C68(gUnknown_08499584, (void *)0x0600F800, 0x800);
    sub_0802465C();
    sub_0801A5B0(0);
    ApplyPaletteExt(gUnknown_0809165C, 0x140, 0x20);
    sub_08011B18();
    sub_080366C4(sub_080368E8);
    sub_080366D0(sub_08036884);
}

/* `>> 6` is `lsrs` because gUnknown_0200C420.unk08 is `u8` -- the wave-27 rule.
 * The store's destination pool word is loaded BEFORE the source's, which is
 * what a plain global-to-global assignment gives. */
void sub_08036F20(void)
{
    gUnknown_02028E40 = gUnknown_0200C420.unk08 >> 6;
    sub_080193B0(gUnknown_0849D34C);
}

/* TWO separate `orrs` of 1 and 4 into the same byte of gDispIo, not one `orrs`
 * of 5: two bitfield assignments, each re-materialising its own mask. Byte 1 of
 * DISPCNT is bits 8..15, so bit 0 is bg0_enable and bit 2 is bg2_enable. */
void sub_08036F44(void)
{
    gDispIo.disp_ct.bg0_enable = 1;
    gDispIo.disp_ct.bg2_enable = 1;

    sub_08022A34();
    sub_0801A5B0(0);
}

void sub_08036F68(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7, u8 a8,
                  u8 a9, u8 a10, u8 a11, u8 a12, u8 a13, u8 a14, u8 a15,
                  u8 a16, u16 a17)
{
    gUnknown_03002B5C = 0;
    gUnknown_0300450C = a15;

    gUnknown_03004580[0][0] = a2 - 1;
    gUnknown_03004580[1][0] = a9 - 1;
    gUnknown_03004580[0][1] = a4 - 1;
    gUnknown_03004580[1][1] = a11 - 1;
    gUnknown_03004580[0][2] = a5;
    gUnknown_03004580[1][2] = a12;
    gUnknown_03004580[0][3] = a3;
    gUnknown_03004580[1][3] = a10;
    gUnknown_03004580[0][4] = a1;
    gUnknown_03004580[1][4] = a8;
    gUnknown_03004580[0][5] = a6;
    gUnknown_03004580[1][5] = a13;
    gUnknown_03004580[0][6] = a7;
    gUnknown_03004580[1][6] = a14;
    gUnknown_03004580[0][7] = gUnknown_085D583C[a3].defense * 10;
    gUnknown_03004580[1][7] = gUnknown_085D583C[a10].defense * 10;

    gUnknown_02027F68[1] = 0;
    gUnknown_03004528[0] = gUnknown_02027F68;
    gUnknown_03004528[1] = gUnknown_02027F68;
    gUnknown_03004520 = a16;

    sub_080546BC();

    gUnknown_03004504.bit0 = 1;
    gUnknown_03004504.bit1 = 0;
    gUnknown_03004504.bit2 = 0;
    gUnknown_03004504.bit3 = 0;
    gUnknown_03004504.bit4 = 0;
    gUnknown_03004504.bit5 = 0;
    gUnknown_03004504.bit6 = 0;
    gUnknown_03004504.unk02 = a17;

    Proc_Start(gUnknown_0849D3BC, PROC_TREE_3);
}

/* F010: `push {lr}; ldr r0,=g1; bl S1; ldr r0,=g2; bl S2; pop {r0}; bx r0` --
 * two statements, each with its own pool word, result of each discarded.
 * src/decomp/c_08044924.c is the matched exemplar.
 * Two different callees and two FUNCTION pool words. sub_080366C4/sub_080366D0
 * are already promoted in src/decomp/c_080366C4.c taking `void (*)(void)`, so
 * no cast is needed here -- unlike the sub_08011AAC/sub_0801F024 sites, which
 * take `void *`. sub_0803662C registers the same two slots with a different
 * pair of handlers, which is what pins the argument order. */
void sub_080370F0(void)
{
    sub_080366D0(sub_08036884);
    sub_080366C4(sub_080368E8);
}

int sub_0803710C(void)
{
    return Proc_Find(gUnknown_0849D3BC) != 0;
}

void sub_08037124(void)
{
    sub_080169E8();
    sub_0801537C(gUnknown_08553820);
    Proc_EndEach(gUnknown_0855379C);
    Proc_EndEach(gUnknown_0849D3BC);
    sub_08036B34();
}

/* The destination is OBJ tile `a & 0x3ff`, i.e. byte offset
 * `(a & 0x3ff) * TILE_SIZE_4BPP` into OBJ_VRAM0. The honest mask spelling
 * `(a & 0x3FF) * 32` does NOT match: on THUMB agbcc loads 0x3ff from the pool
 * and emits `ldr; and; lsl #5`, three instructions and a fourth pool word.
 * The ROM's `lsl #0x16; lsr #0x11` is the truncate-then-scale form, which is
 * what a 16-bit intermediate gives -- `(u16)(a * 0x40) / 2` puts the same
 * bits in the same places in two instructions. Measured with compile_probe,
 * both spellings side by side. */
void sub_08037150(int a)
{
    Decompress(gUnknown_08124478, (u8 *)OBJ_VRAM0 + (u16)(a * 0x40) / 2);
}
