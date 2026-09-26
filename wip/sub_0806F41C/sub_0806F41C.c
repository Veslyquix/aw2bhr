#include "global.h"
#include "proc.h"
#include "hardware.h"

/* PARKED -- Wave 36, W36-K. The old size-exact note is stale: Wave 66's
 * configured build is 312 bytes against 308 (+4), 15.6%. Every call, constant,
 * global, branch condition and field offset still matches. The remaining diff
 * is one coupled register-allocation fact, and it surfaces in three places:
 *
 *   1. This candidate needs FIVE callee-saved registers where the ROM needs
 *      four -- it pushes r8 (attempt 1), or r8 and r9 (attempt 2, below, which
 *      bound `tbl` inside the unk0d condition and was strictly worse).
 *   2. Because of (1), gUnknown_0816E808 -- the only symbol here referenced
 *      twice -- takes agbcc's -fforce-addr `.rodata` indirection
 *      (`R_ARM_ABS32 .rodata`, then `ldr r0,[r3]; ldr r5,[r0]`) where the ROM
 *      has a plain `R_ARM_ABS32 gUnknown_0816E808` and a single deref. The
 *      ROM's pool is clean, so per the wave-18 rule this pool word is a
 *      SYMPTOM of pressure in this C, not a spelling to go hunting for.
 *   3. Also because of (1), the two `gUnknown_03002B6C.raw8` arms cross-jump
 *      their common `strb`. The ROM does not merge them -- it holds the value
 *      in r1 in one arm and r0 in the other, so the tails are not identical.
 *      Nothing in the source causes that.
 *
 * WHERE THE EXTRA LIVE VALUE COMES FROM, as far as it is measured: the ROM lets
 * the address `proc + 0x38` DIE after the unk0d test and RECOMPUTES it
 * (`adds r4,r5,#0; adds r4,#0x38`) at the `tbl = gUnknown_0816E808` statement.
 * This candidate keeps it live across that point, so `proc` and `proc + 0x38`
 * are callee-saved simultaneously. The wave-17 diagnostic reads directly onto
 * this, but there is no explicit local to split here -- the lever has to
 * shorten a live range, not rebind a local.
 *
 * A second, probably dependent difference: the ROM HOISTS the member offset for
 * the two WORD loads (`adds r1, r6, #4`, and `adds r0, r6, #0; adds r0, #8`)
 * while FOLDING it into the displacement for the byte and halfword loads at
 * +0xc, +0xd and +0xe -- and it does both in the SAME statement for +0x08 and
 * +0x0c. This candidate folds all five. The hoisted-offset spelling in
 * docs/agbcc-codegen.md (wrap the array in a struct, reach it as `p->arr[i].m`)
 * was deliberately NOT tried: it would hoist all five, and the ROM hoists only
 * the two word loads. Revisit it only after (1) is fixed; it may fall out of
 * the allocation on its own.
 *
 * RULED OUT: binding `tbl` inside the unk0d condition, i.e.
 * `(tbl = gUnknown_0816E808)[proc->unk38].unk0d == 1`. It does fix the operand
 * order of that one load (pointer deref before index, as the ROM has it) but it
 * makes `tbl` live across the if/else and costs a SECOND high register. The
 * assignment-in-subscript lever that matched sub_080686E8 and sub_08068810 does
 * not transfer here.
 *
 * RULED OUT BY W66-M: explicitly binding the two proc+0x38 lifetimes to two
 * separate pointer locals. gcse reunified them: configured size, score and
 * first difference were byte-identical to this +4, 15.6% draft. */
struct Unk6F41CProc
{
    /* 0x00 */ u8 filler_00[0x38];
    /* 0x38 */ s8 unk38;
};

void sub_0806F41C(struct Unk6F41CProc *proc)
{
    struct Unk0816E808Entry *tbl;
    int flag;
    int fill;

    SetWinEnable(0, 0, 0);
    sub_08012358();

    flag = sub_0803CBD8(0x22) != 0;

    Proc_EndEach(gUnknown_08582AF4);
    sub_0806E210(proc->unk38, proc);

    if (gUnknown_0816E808[proc->unk38].unk0d == 1)
        gUnknown_03002B6C.raw8 |= 0x80;
    else
        gUnknown_03002B6C.raw8 &= 0x7f;

    tbl = gUnknown_0816E808;

    if (tbl[proc->unk38].unk0e == 0 || flag)
    {
        Proc_EndEach(gUnknown_08582CAC);

        if (tbl[proc->unk38].unk00 <= 0x11)
        {
            sub_0806AEC4(proc->unk38);
        }
        else
        {
            Decompress((u8 *)tbl[proc->unk38].unk00, (void *)0x06000000);
            Decompress(tbl[proc->unk38].unk04, gUnknown_08499578);
            ApplyPaletteExt(tbl[proc->unk38].unk08, 0, tbl[proc->unk38].unk0c << 5);
        }
    }
    else
    {
        Proc_EndEach(gUnknown_08582CAC);
        Proc_Start(gUnknown_08582CAC, proc);
        fill = 0;
        CpuFastSet(&fill, (void *)0x06000000, 0x01000010);
        sub_08013C00();
        Proc_Goto(proc, 1);
    }

    sub_08013AEC();
}


/* WAVE 77 (W77-A), one attempt, no movement: still +4 bytes / 15.6%.
 * RULED OUT: dropping the `tbl` local and spelling `gUnknown_0816E808[...]`
 * at all five use sites.  +12 bytes / 8.8% -- strictly worse.  The `tbl`
 * binding is right.
 * Restating the chain, which is one fact: the candidate copies `proc + 0x38`
 * (`adds r6, r4, #0`) so the pseudo spans the unk0d if/else, which costs the
 * fifth callee-saved register, which pushes `flag` into r8, which is why the
 * `!= 0` comes out as a BRANCH rather than the ROM's `negs r1,r0; orrs r1,r0;
 * lsrs r7,r1,#31` -- a THUMB `lsrs` cannot target a hi register, so gcc has no
 * choice once flag is in r8.  The branchless form is not a spelling to hunt
 * for; it falls out as soon as flag lands in a low register.
 * Residual kind 3 (allocation).  Worth a decomp-permuter run, which this wave
 * did not have budget for.
 *
 * WAVE 78: spelling only the unk0d index as `*((s8 *)proc + 0x38)` was checked
 * with configured try_match and is byte-identical: 312/308 (+4), 15.6%.
 * Integer-address and ordinary byte-pointer variants compile to the same
 * retained address chain. Volatile post-branch views do force reloads, but as
 * `ldrb; lsls; asrs` and still retain the old address pseudo, so they cannot
 * reproduce the ROM's recomputed `proc + 0x38; ldrsb` sequence.
 */



