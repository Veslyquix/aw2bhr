#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080849C8.
 * sub_080849C8 @ 0x080849C8
 */

#include "hardware.h"
#include "proc.h"

/* WAVE 71 (W71-F): MATCHED configured, 520/520. A saved-parent alias fixed
 * to r9 and used at all three parent call sites reproduces the ROM allocation.
 * The four expected .rodata symbol-name differences resolve identically.
 *
 * PARKED at 48.3% / +8 bytes, wave 54 (W54-D). The score is POSITIONAL and
 * misleading: every statement, every constant, every pool word and the loop
 * are right, and the entire residual is WHICH REGISTER `parent` lands in.
 *
 * ROM: `mov r9, r0` -- the parameter goes straight into a high register and the
 * three -fforce-addr word ADDRESSES take r5/r7/r8, all three `ldr`d in the
 * loop preheader. Here: `adds r7, r0, #0` -- `parent` wins the low callee-saved
 * r7, so the 0x081D93E4 word is pushed to r8 and the 0x081D93E8 word is created
 * late in r9, which costs one extra `mov rLOW, rHIGH` before its `ldr` and one
 * extra pool slot. +8 bytes, all of it in the last three statements.
 *
 * SETTLED (each read out of baserom.gba, and all four are -fforce-addr pool
 * words, NOT objects -- do not declare a gUnknown_081D93xx for any of them):
 *   0x081D93DC -> 0x08499598  gPlayers (already `struct PlayerStruct *`)
 *   0x081D93E0 -> 0x03003FC0  gPlaySt
 *   0x081D93E4 -> 0x08616BE4  the Proc_Start script
 *   0x081D93E8 -> 0x08043591  sub_08043590, THUMB bit set
 * The loop's `+0x56` off a 0x3c-stride element is `[i + 1].unk1a`, i.e. armies
 * 1..n, not an out-of-range field.
 *
 * RULED OUT by compile_probe: binding the script and the function pointer to
 * locals before the loop. It does move `parent` out of r7 -- but into sl, with
 * a THIRD high register saved -- and, worse, it DEFEATS -fforce-addr: agbcc
 * then emits plain `.word gUnknown_08616BE4` / `.word sub_08043590` pool words
 * where the ROM has the double indirection through 0x081D93E4/E8. The naming-
 * the-symbol-directly spelling below is the one that reproduces those.
 * NOT tried: decomp-permuter. This is exactly its case (same instructions,
 * same order, wrong registers) and is the first thing to try on this function.
 */

void sub_080849C8(ProcPtr parent)
{
    int i;
    register ProcPtr savedParent asm("r9") = parent;

    sub_0807898C(savedParent);
    gDispIo.disp_ct.bg1_enable = 0;
    sub_08078D80(savedParent);
    sub_08085950(0, gUnknown_030033EC);
    sub_0802D5A0((void *)(gUnknown_030030B4.bits.chr_block * 0x4000 + 0x06006C00),
                 gUnknown_08616B1C[gPlayers[gUnknown_030033EC].teamColor], 0);
    sub_080858C0();
    sub_08043BA4(gPlayers[gUnknown_030033EC].co, 0xB6 * 2, 5);
    sub_08043FA8(gPlayers[gUnknown_030033EC].co, (void *)0x06015700, 0x16);
    sub_08043B44(8);
    sub_08043B14(gPlayers[gUnknown_030033EC].co, 0xAB * 4);
    sub_0801F114();
    sub_0801F150(0, (void *)0x06010000, 0xB1 * 4, 0x12);
    sub_0801F150(1, (void *)0x06010000, 0xB3 * 4, 0x13);
    sub_0801F150(2, (void *)0x06010000, 0xB7 * 4, 0x14);
    sub_0801F234(0x13);
    sub_0801F234(0x14);

    for (i = 0;
         i < (gPlaySt.gameMode == 2 ? sub_0802490C(gPlaySt.mapID)
                                           : sub_080248F8());
         i++)
        sub_0801F234(gPlayers[i + 1].teamColor + 0x3D);

    sub_0801F234(0x9B);
    sub_0801F234(0x9C);
    sub_0801F234(0x9D);
    sub_0801F234(0x9E);
    sub_0801F234(0x9F);
    sub_0801F234(0xA0);
    sub_0801F234(0xA1);
    sub_0801F234(0xA2);
    sub_0801F234(0xA3);
    sub_0801F234(0xA4);
    sub_0801F234(0xA5);
    sub_0801F234(0xA6);
    sub_0801F234(0xA7);
    sub_0801F234(0x93);
    sub_0801F234(0x94);
    sub_0801F234(0x43);
    sub_0801F234(0x44);
    sub_0801F234(0x50);
    sub_0801F234(0x95);
    sub_0801F234(0x96);
    sub_0801F234(0x97);
    sub_0801F234(0x98);
    sub_0801F234(0x99);
    sub_0801F234(0x9A);
    sub_0801F234(0x67);
    sub_0801F234(0x92);

    Proc_Start(gUnknown_08616BE4, savedParent);
    sub_08011B34((void *)sub_08043590);
}
