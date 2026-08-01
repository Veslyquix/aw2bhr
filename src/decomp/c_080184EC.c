#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080184EC.
 * sub_080184EC @ 0x080184EC, sub_0801853C @ 0x0801853C
 */

/* The +4 stepper of the sub_080180A8 / sub_080180CC / sub_0801820C family, on
 * the same slot counter and the same three display shadows. Past 0x2e it stops
 * driving them and installs sub_080184E0 into its own slot's +8 instead.
 *
 * unk0e is `s16` (wave 28's reading, three independent times): the step is a
 * plain `ldrh`/`strh` because movhi needs no extension either way, and the test
 * sign-extends the CSE'd result with `lsls #0x10; asrs #0x10` rather than
 * reloading. NOT a u16 with a cast at the compare -- the member's own type is
 * what the sibling readers `ldrsh`.
 *
 * The `str` of sub_080184E0 at +8 is a STATE INSTALL, not a call: the pool word
 * is the sibling's address. Cast because that word is declared
 * `struct Unk0200C528Node *` (sub_08018B40 stores a node link there), exactly as
 * in c_080180A8.c.
 *
 * The two volatile shadows take one CSE'd result and the third takes the
 * unnarrowed counter, the same spelling c_0801820C.c uses. */
void sub_080184EC(struct Unk0200C528 *slot)
{
    slot->unk0e += 4;
    if (slot->unk0e > 0x2e)
    {
        slot->unk08 = (struct Unk0200C528Node *)sub_080184E0;
        sub_08012A74();
    }
    else
    {
        gUnknown_0300309C = -0x70 - slot->unk0e;
        gUnknown_03002028 = -0x70 - slot->unk0e;
        gUnknown_03001420 = slot->unk0e;
        sub_08011AAC((void *)sub_08017EEC);
    }
}

/* A gUnknown_0200C528 list-script handler: it arms the sub_080184EC counter on
 * its own slot unless a fade is already running, then steps the script pointer
 * one 0x10-byte node on and returns FALSE.
 *
 * The two tests are ONE `||`: `bne` falls into the body and the second test's
 * `bne` skips it, so the body runs when `gUnknown_03002514 != 1 ||
 * gUnknown_03001420 == 0`. The `ldr r5` / `lsls r4` pair appears on both sides
 * of the branch because CSE hoisted them into the `== 1` arm as well. */
bool8 sub_0801853C(s16 a)
{
    if (gUnknown_03002514 != 1 || gUnknown_03001420 == 0)
    {
        gUnknown_0200C528[a].unk0e = 0;
        gUnknown_0200C528[a].unk08 = (struct Unk0200C528Node *)sub_080184EC;
    }
    gUnknown_0200C528[a].unk04++;
    return FALSE;
}
