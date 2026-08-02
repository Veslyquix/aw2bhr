#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019404.
 * sub_08019404 @ 0x08019404, sub_08019470 @ 0x08019470
 */

#include "hardware.h"

/* Step the script in one gUnknown_0200C528 slot. The tail is the DISPATCHER
 * for the `s16 (s16)` command-handler family unknown-functions.h documents
 * beside sub_08017A80: the current node's byte 0 indexes gUnknown_0848A244,
 * the slot index goes in r0, and the loop runs while the handler's result is
 * nonzero after a 16-bit truncate (`lsls #0x10; cmp #0; bne`).
 *
 * The loop reloads `gUnknown_0200C528[a].unk04` every iteration off ONE CSEd
 * address in r4 -- the handlers advance that cursor, so the address is
 * invariant but the value is not. `adds r0,r4,#4` for &.unk04 against
 * `adds r0,r4,#0; adds r0,#8` for &.unk08 is only imm3 vs imm8, not two
 * different spellings.
 *
 * unk00 really is read TWICE: once as the entry guard and again after the
 * unk08 test, with the unk0c store in between. That store is what stops gcc
 * CSEing the two `ldr r0,[r1]`s. */
void sub_08019404(s16 a)
{
    if (gUnknown_0200C528[a].unk00 == NULL)
        return;
    if (gUnknown_0200C528[a].unk0c != 0)
    {
        gUnknown_0200C528[a].unk0c--;
        if (gUnknown_0200C528[a].unk0c != 0)
            return;
    }
    if (gUnknown_0200C528[a].unk08 != NULL)
        return;
    if (gUnknown_0200C528[a].unk00 == NULL)
        return;
    if (gUnknown_0200C528[a].unk04 == NULL)
        return;
    while (gUnknown_0848A244[gUnknown_0200C528[a].unk04->filler_00[0]](a) != 0)
        ;
}

/* The per-frame pump for the whole gUnknown_0200C528 list system: when
 * sub_08017988 says the system is idle, every one of the ten slots gets its
 * installed callback run and then its script stepped, and afterwards the key
 * state is force-fed from gUnknown_03002EF0.
 *
 * The loop is the `s16 i` shape of src/decomp/c_08019260.c -- the counter is
 * carried as `i << 16` in r5 and re-derived with `asrs #0x10` at each use, so
 * the increment is `+0x10000` (`movs r1,#0x80; lsls r1,#9`) rather than +1.
 * `adds r7,r6,#0; adds r7,#8` in the preheader is LICM hoisting the constant
 * `&gUnknown_0200C528[0].unk08`, written by the loop optimiser and not by the
 * source (wave 37 preheader rule).
 *
 * gUnknown_03002EF0 gets an agbcc `-fforce-addr` `.rodata` word (the ROM's
 * 0x0808E5A4, which holds 0x03002EF0) because it is referenced on both sides
 * of the loop; the address is parked in r8 and re-loaded from memory at each
 * use. gpKeySt, by contrast, has one reference and gets an ordinary pool word.
 *
 * gUnknown_03001404 had to be retyped u16 -> s16 for this function: the ROM
 * reads it `movs r2,#0; ldrsh r0,[r0,r2]`, and a `(s16)` cast on a u16 global
 * folds away at a zero test. */
void sub_08019470(void)
{
    s16 i;

    if (sub_08017988() != 0)
        return;

    gUnknown_03002EF0 = 0;

    for (i = 0; i < 10; i++)
    {
        if (gUnknown_0200C528[i].unk00 != NULL)
        {
            if (gUnknown_0200C528[i].unk08 != NULL)
                ((void (*)(struct Unk0200C528 *))gUnknown_0200C528[i].unk08)(&gUnknown_0200C528[i]);
            sub_08019404(i);
        }
    }

    if (gUnknown_03001404 != 0)
    {
        gpKeySt->unk02 = gUnknown_03002EF0;
        gpKeySt->held = gUnknown_03002EF0;
        gpKeySt->unk00 = gUnknown_03002EF0;
        gpKeySt->repeated = gUnknown_03002EF0;
        gUnknown_03004538 = 0;
        gUnknown_03004518 = 0;
    }
}
