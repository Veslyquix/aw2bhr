#include "global.h"
#include "hardware.h"
#include "proc.h"

/* WAVE 71 (W71-F): improved to size-exact 1040/1040, 99.1% (9 real bytes in
 * the configured report). A volatile store through the array address splits
 * the clear zero from both sixth-argument zeros; a fixed-r0 result binding
 * moves gUnknown_03002B34's address load after sub_08087248. The only real
 * instruction residual is the r6/r7 address-vs-value swap in the two-copy
 * loop. A bounded permuter attempt did not start because its parser rejects
 * the fixed-register asm local; the active source was unchanged.
 *
 * WAVE 53 (W53-C). PARKED at one residual, described exactly below. Size is
 * 2 bytes short of 1040; everything else -- prologue, both `if` arms, the
 * while loop, all four counted loops, the argument setup of all 29 call sites
 * and the whole literal pool ORDER -- is instruction-for-instruction correct.
 *
 * THE REMAINING DIFF, and it is one fact, not several:
 *   The ROM materialises THREE separate zeros; this candidate materialises ONE
 *   and shares it. The `clear[0] = 0` that feeds the CpuSet fill is
 *   `add r1, sp, #0xc; movs r0, #0; strh r0, [r1]` in the ROM -- the value in
 *   a caller-saved scratch that dies at the store -- and each arm of the
 *   sub_0801A368 `if` then makes its own `movs r4, #0` for the sixth argument
 *   (`str r4, [sp, #4]`). Here cse propagates the fill's zero forward into both
 *   arms, so it lands in r6 (callee-saved), lives across everything in
 *   between, and the two `movs` disappear. Net -2 bytes, which also drops the
 *   pool's `.short 0x0000` alignment pad and shifts every later reloc.
 *
 *   It is NOT the array-vs-scalar question -- that one is settled and the
 *   array is right (see the note in src/decomp/c_0807C614.c; the scalar puts
 *   the ADDRESS in the value's register instead, which is a different and
 *   larger error, and this candidate already gets the address into r0 and the
 *   `add r0, sp, #0xc` before `bl CpuSet` correct).
 *
 *   Ruled out: statement order (the ROM's fill sits after the first if/else
 *   merge, as here); the CpuSet argument spelling; the width of the fill store
 *   (`strh` either way). NOT ruled out and the next thing to try: whether the
 *   sixth parameter of sub_0801A368 is something other than a plain literal 0
 *   at these three call sites, which is the only source-level way found so far
 *   to stop cse reusing the pseudo. A permuter run on register allocation is
 *   the other obvious move and was not spent.
 *
 * WHAT IS SETTLED AND SHOULD NOT BE RE-DERIVED:
 *  - gUnknown_081D93FC/9400/9404/9408 ARE NOT GLOBALS. They are this unit's
 *    -fforce-addr .rodata words for &gUnknown_03005928, &gUnknown_0300596C,
 *    &gUnknown_03005990 and &gUnknown_03005980, all four of which were already
 *    declared with exactly the right types. See include/unknown-globals.h.
 *    This match will need
 *      "rodata": ["0x081D93FC", "0x081D9400", "0x081D9404", "0x081D9408"]
 *    plus the words for gUnknown_03003FC0 and gUnknown_03005928's own pool
 *    entries that try_match lists.
 *  - The fifth counted loop MUST be spelled `+ (i + 3) * 0x20` and not
 *    `+ 0x60 + i * 0x20`. The two are the same value; the second folds the
 *    0x60 into a second `.word gUnknown_0200FC50+0x60` pool entry and loses
 *    the ROM's `adds r4, r0, #0; adds r4, #96`. Binding the base to a local
 *    pointer instead is worse still -- it gives the LOCAL a .rodata word and
 *    a double indirection. Same associativity rule as the palette loop in
 *    src/decomp/c_08081060.c.
 *  - The while loop reads gUnknown_0300596C through the pool word once per
 *    test; the `ldrb` feeding sub_08037448(u8) and the `ldrh`/`strh` at the
 *    same address are one s16 object, not two members.
 */

struct Unk8085B30
{
    /* 00 */ STRUCT_PAD(0x00, 0x4e);
    /* 4e */ u16 unk4e;
};

/* WAVE 77 (W77-M).  Of the 9 reported bytes only SIX are code: a clean r6/r7
 * exchange at +0x2d6..+0x2fe between the two CpuFastSet givs.  +0x108/+0x10c/
 * +0x110 are addend bytes of the equivalent .rodata alias for
 * gUnknown_081D9400/4/8 and are promotion's business, not residual.
 * Byte-neutral at 9: rebasing either source pointer on the other, &arr[..]
 * against arr + .., (u8 *)0x06010E00 + i*0x100, rebasing either destination
 * constant, and i*0x80*2 for the destination stride.  Reshaping the biv to
 * stride 0x80 destroys it (266 bytes).  The `register int result asm("r0")`
 * pin IS load-bearing -- removing it costs 9 -> 16 -- so the permuter stays
 * unusable here. */

void sub_08085B30(struct Unk8085B30 *proc)
{
    int i;
    u16 clear[2];

    sub_0807898C(proc);
    sub_08078AF0();

    sub_0801F114();
    sub_0801F150(2, (void *)0x06010000, 0xf0, 0x14);

    sub_0801F234(0x43);
    sub_0801F234(0x44);
    sub_0801F234(0x45);
    sub_0801F234(0x46);
    sub_0801F234(0x52);
    sub_0801F234(0x69);

    for (i = 0; i <= 9; i++)
        sub_0801F234(i + 0x55);

    sub_0801F150(4, (void *)((gUnknown_03002B6C.bits.chr_block << 14) + 0x06000000), 0x370, 9);

    sub_0801F234(0xb8);
    sub_0801F234(0xb9);
    sub_0801F234(0xba);
    sub_0801F234(0xbb);

    sub_08087938();
    sub_0801B780(0);
    sub_08037750(6);

    if (gUnknown_03003FC0.unk01 == 2)
    {
        gUnknown_03005928 = 7;
        sub_080375A4(2);
        sub_08086A58(gUnknown_03005900, gUnknown_03005928, 0);
        sub_08086F3C(gUnknown_03005900 + gUnknown_03005930);
    }
    else
    {
        gUnknown_03005928 = 5;

        while (sub_08037448(gUnknown_0300596C) == 0)
        {
            gUnknown_0300596C--;

            if (gUnknown_0300596C <= 1)
                gUnknown_0300596C = 8;
        }

        sub_08086A58(gUnknown_03005990[gUnknown_0300596C], gUnknown_03005928, 0);
        sub_08086F3C(gUnknown_03005990[gUnknown_0300596C] + gUnknown_03005980);
    }

    gUnknown_0300251C.bits.tm_block = 0x1b;
    gUnknown_03001FE8.bits.size = 2;

    *(volatile u16 *)clear = 0;
    CpuSet(clear, (void *)((gUnknown_03001FE8.bits.tm_block << 11) + 0x06000000), 0x01000800);

    sub_08078D80(proc);

    sub_08073304(gUnknown_085802CC, gUnknown_0200FC50, 0, 0, 1, 1, (int)proc);

    sub_0802D5A0((void *)((gUnknown_030030B4.bits.chr_block << 14) + 0x06006C00), 0, 0);

    if (gUnknown_03003FC0.unk01 == 2)
    {
        sub_0801A368(-1, 4, 0xe, gUnknown_03005928 * 2 + 2, gUnknown_08499580, 0);
        sub_0801A368(0x12, 0, 0xd, 4, gUnknown_08499580, 0);
    }
    else
    {
        sub_0801A368(-1, 8, 0xc, gUnknown_03005928 * 2 + 2, gUnknown_08499580, 0);
        sub_0801A368(-1, 4, 0xc, 4, gUnknown_08499580, 0);
        sub_0801A368(0x12, 0, 0xd, 4, gUnknown_08499580, 0);
    }

    sub_08013B0C();
    sub_080116E8();

    ApplyPaletteExt(gUnknown_084892EC, 0x220, 0x20);

    sub_0803F6BC(6, 0, (void *)0x06010A00, 1);
    sub_0803F6BC(0xe, 0, (void *)0x06010B00, 1);
    sub_0803F6BC(0xa, 0, (void *)0x06010C00, 1);
    sub_0803F6BC(0xb, 0, (void *)0x06010D00, 1);

    ApplyPaletteExt((u16 *)sub_0802A8AC(6, 0), 0x240, 0x20);

    Decompress(gUnknown_0823E140, gUnknown_0200FC50);

    for (i = 0; i < 2; i++)
    {
        CpuFastSet(gUnknown_0200FC50 + 0x100 + i * 0x80, (void *)(0x06010E00 + i * 0x100), 0x20);
        CpuFastSet(gUnknown_0200FC50 + 0x500 + i * 0x80, (void *)(0x06010E80 + i * 0x100), 0x20);
    }

    CpuFastSet(gUnknown_0200FE50, (void *)0x06011000, 0x10);
    CpuFastSet(gUnknown_0200FE50 + 0x400, (void *)0x06011040, 0x10);

    ApplyPaletteExt(gUnknown_0823E550, 0x2a0, 0x20);

    Decompress(gUnknown_0823E654, gUnknown_0200FE50 - 0x200);

    for (i = 0; i < 3; i++)
        CpuFastSet(gUnknown_0200FE50 - 0x200 + i * 0x20, (void *)(0x06011100 + i * 0x20), 8);

    for (i = 0; i < 5; i++)
        CpuFastSet(gUnknown_0200FC50 + (i + 3) * 0x20, (void *)(0x06011160 + i * 0x20), 8);

    ApplyPaletteExt(gUnknown_08239DE4, 0x2c0, 0x20);

    proc->unk4e = 0;

    {
        register int result asm("r0");
        result = sub_08087248();
        gUnknown_03002B34 = result;
    }
    gUnknown_03002F18 = sub_08087298();

    sub_08085F40();

    sub_0803B524(0x190);

    Proc_Start(gUnknown_08616CF4, proc);
}





