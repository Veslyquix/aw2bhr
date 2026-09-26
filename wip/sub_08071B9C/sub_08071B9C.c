/* WAVE 87 (W87-D). THE W80-C `do { } while (0)` PRIORITY LEVER IS CONFIRMED
 * HERE AND IS THE REASON THIS DRAFT CHANGED: 240 bytes (+8), 15.1% -> 19.4%,
 * first difference +0xc -> +0x16 (configured profile).
 *
 * THE LEVER: `do { ... } while (0);` around the THREE Interpolate calls. It
 * swaps `proc` into r7 (low) and `data` into sl (high) -- the ROM's assignment
 * -- and with it removes ALL FOUR `mov rN, sl` reads that the baseline paid to
 * reach proc->unk2C at the three call sites and the tail. Verified by
 * re-measuring the untouched baseline in the same wave: the baseline really
 * does emit `mov sl,r0 / ldr r7,[r0,#44]` (data in r7, proc in sl) and the ROM
 * really does emit `adds r7,r0,#0 / ldr r0,[r7,#44] / mov sl,r0`.
 *
 * BUT THE PARK'S CAUSAL CLAIM IS REFUTED. The park says "the register swap is
 * the cause; the constant sharing is the symptom". The swap is now FIXED and
 * the constant sharing is UNCHANGED, and it is the entire remaining residual.
 * The two are independent facts.
 *
 * WHAT IS LEFT IS SIX MASK MATERIALISATIONS, +6 bytes, plus the tail alignment
 * halfword. The ROM materialises each constant INTO THE DESTINATION and lets
 * the two-address `ands` consume it; the draft copies the VALUE into the
 * destination and ands with a separate constant register:
 *      ROM     movs r1,#31                             / ands r1,r0
 *      draft   movs r3,#31   / adds r1,r0,#0           / ands r1,r3
 *      ROM     movs r6,#248  / lsls r6,#2              / ands r6,r0
 *      draft   adds r6,r0,#0 / movs r4,#248 / lsls r4,#2 / ands r6,r4
 * Four of the six go wrong (ar, ag, br, bg); the two 0x7c00 masks, whose
 * results land in r9/r8, are already the ROM's. The 0x1f constant is the only
 * one cse actually SHARES (r3 spans the a-group and the b-group); 0x3e0 is
 * rematerialised in both groups and still gets its own register.
 *
 * MEASURED AND BYTE-IDENTICAL, do not repeat: six constant locals
 * (`m0 = 0x1f; ar = a & m0; ... m3 = 0x1f; br = b & m3;` etc.) fold away
 * completely -- 19.4%, 187/232, first difference +0x16, exactly this draft.
 * W86-A's "a constant local pins a register by its live-range start" does NOT
 * reach a constant that cse has already merged BY VALUE; the local never
 * becomes a distinct pseudo, so there is no live-range start to pin.
 *
 * ALSO MEASURED: `do { } while (0)` around the WHOLE goto loop (label inside)
 * turns `data` into a second walking pointer (`add sl,sl,#2`) and destroys the
 * shared `lsls r2,r1,#1` index -- it breaks the settled loop shape, do not use
 * it. Three SEPARATE `do { ... } while (0);` wrappers, one per Interpolate,
 * give the same code as the single wrapper around all three.
 *
 * NEXT NAMED STEP: make agbcc tie the CONSTANT (not the value) to the `ands`
 * destination for ar/ag/br/bg. The one concrete sub-goal is to stop cse
 * sharing 0x1f across the two groups -- with r3 permanently holding 31 the
 * copies for ag/bg follow from the pressure. Nothing that spells the constant
 * differently in the source can do it (cse merges by value), so the lever has
 * to change what is LIVE at the mask block. The park's row (a) ("change the
 * reference COUNTS -- drop data to 6 refs or lift proc to 8") was aimed at the
 * register swap and is now moot. Full record: work/sub_08071B9C/W87-notes.md.
 *
 * LOOP SHAPE IS SETTLED -- do not re-litigate it (see the park entry). */
#include "global.h"
#include "proc.h"

struct PalFade
{
    /* 0x00 */ u16 unk00[16];
    /* 0x20 */ u16 *unk20;
    /* 0x24 */ u16 *unk24;
    /* 0x28 */ u16 unk28;
    /* 0x2A */ u16 unk2A;
    /* 0x2C */ u16 unk2C;
};

struct PalFadeProc
{
    /* 0x00 */ u8 unk00[0x2c];
    /* 0x2C */ struct PalFade *unk2C;
};

void sub_08071B9C(struct PalFadeProc *proc)
{
    int i;
    struct PalFade *data;
    u16 *src;
    u16 *dst;
    int a, b;
    int ar, ag, ab;
    int br, bg, bb;
    int cr, cg, cb;

    data = proc->unk2C;
    src = data->unk20;
    dst = data->unk24;

    if (data->unk28 == data->unk2C || data->unk28 > data->unk2A)
    {
        Proc_End(proc);
        return;
    }

    i = 0;
_loop:
    a = data->unk00[i];
    ar = a & 0x1f;
    ag = a & 0x3e0;
    ab = a & 0x7c00;
    b = src[i];
    br = b & 0x1f;
    bg = b & 0x3e0;
    bb = b & 0x7c00;
    do {
        cr = Interpolate(0, ar, br, proc->unk2C->unk28, proc->unk2C->unk2A);
        cg = Interpolate(0, ag, bg, proc->unk2C->unk28, proc->unk2C->unk2A);
        cb = Interpolate(0, ab, bb, proc->unk2C->unk28, proc->unk2C->unk2A);
    } while (0);
    *dst++ = (cb & 0x7c00) | (cg & 0x3e0) | (cr & 0x1f);
    i++;
    if (i < 16)
        goto _loop;

    sub_080135A4();
    proc->unk2C->unk28++;
}
