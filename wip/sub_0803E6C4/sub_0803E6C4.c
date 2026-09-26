#include "global.h"

/* WAVE 87 (W87-C) -- TWO MORE LEADS CLOSED, draft unchanged at 156/160, 16.9%
 * (`configured`). Full evidence in work/sub_0803E6C4/W87-notes.md.
 *  - TWIN AXIS, negative. src/decomp/c_0803E594.c CONTAINS this construct (its
 *    match header makes parameter-versus-local at entry its load-bearing fact
 *    #1) and the transplant is BYTE-NEUTRAL. Reason, from the twin's own text:
 *    its copies are real because its locals are MUTATED and its parameters are
 *    re-read in later loop preheaders. This function destroys and re-reads no
 *    parameter, so there is no copy to lend. `int z; z = a3;` used at the call
 *    compiles byte-identical -- cse substitutes the parameter.
 *  - W80-A AS THE WAVE-87 BRIEF STATES IT IS REFUTED. Making a3 a modified
 *    parameter with a flow-deleted store (`a3 = 0;` as the last statement) is
 *    BYTE-IDENTICAL: no entry copy appears. `adds rN,rM,#0` at +0x0 does NOT
 *    prove the source assigns that parameter; the copy survives only when the
 *    parameter's own pseudo is still live past the overwriting value. See the
 *    wave-87 chapter in docs/agbcc-codegen.md.
 * Toolchain axis (waves 79/81), twin axis and the W80-A reading are now all
 * closed. Do not re-spend budget on another "bind a1/a3 to a local" spelling. */


/* PARKED, waves 38 (W38-C, W38-F) and 79 (W79-B). 156 bytes against the ROM's
 * 160, 16.9% identical, first difference at +0xa.
 *
 * REMAINING DIFF IS ONE INSTRUCTION, in the PROLOGUE ONLY. The whole loop nest,
 * including the byte load and its copy, is instruction-for-instruction exact.
 * The ROM opens
 *     adds r3,r2,#0 / mov sl,r0 / adds r2,r1,#3 / ldr r1,=gUnknown_080912FC
 *     / ldr r0,[r1] / ldr r0,[r0] / ldrh r0,[r0,#2] / cmp r2,r0
 * -- a3 in r3, the row counter in r2, the guard's address held in its OWN
 * register r1 -- while this draft opens
 *     mov sl,r0 / adds r1,#3 / ldr r0,=gUnknown_080912FC / ldr r0,[r0]
 *     / ldr r0,[r0] / ldrh r0,[r0,#2] / cmp r1,r0
 * -- counter in r1, a3 left in r2, address dereferenced in place in r0. The
 * ROM's `adds r3,r2,#0` exists ONLY because r1 is occupied by that address, so
 * the lever is getting the guard's address constant into a register of its own;
 * nothing about a3 itself is wrong.
 *
 * WAVE 79 (W79-B) -- THE TOOLCHAIN AXIS, this entry's one remaining open lead,
 * IS NEGATIVE. Both variants were run against this unchanged body:
 *   - `old-agbcc`: byte-for-byte the SAME output as the default profile.
 *     156/160, 16.9%, first difference at +0xa. Not one byte moved.
 *   - `no-force`: also 156/160 and 16.9%, but structurally WORSE. The
 *     gUnknown_08499598[(t >> 6) + 1].unk1a access decays from the ROM's folded
 *     `adds r0,#86; ldrb r0,[r0,#0]` to `adds r0,#60; ldrb r0,[r0,#26]`, and
 *     the guard's pool word stops being materialised into its own register.
 * Consistent with data/compiler-overrides.json's own header: this address is
 * below 0x08063A3C, so dropping -fforce-addr does change the output, and it
 * changes it the wrong way.
 *
 * WAVE 79 CLASSIFICATION: NO SOURCE CONSTRUCT. What is left is which pseudo
 * wins r1 -- the guard's address constant or the row counter -- between two
 * values with equal reference counts. Nothing in the source distinguishes them:
 * `row = a2 + 3` already writes a fresh local, a3 is already a distinct
 * parameter, and the address is already read by name. Both orderings were tried
 * in wave 38 and the toolchain axis is now closed as well, so this is the
 * wave-77 non-converting class. Do not give it another budget without a NEW
 * mechanism.
 *
 * The inner-loop residual the first draft had IS FIXED, by the idiom the
 * permuter found on the sibling sub_0803E764: test the plane expression
 * directly, then re-name it inside the taken branch and bind it to the local
 * there. Binding it once, before the test, coalesces the load into the argument
 * register and loses the ROM's `adds r3,r0,#0`. See the chapter in
 * docs/agbcc-codegen.md.
 *
 * The hand-written loop inversion is deliberate and is NOT an artefact to spell
 * away: the ROM's guard and its bottom test read the same map-header halfword
 * through DIFFERENT symbols, the guard via the .rodata word gUnknown_080912FC
 * and the bottom via gUnknown_08499590 directly. One `for` condition cannot
 * produce that -- writing it honestly costs the guard's extra indirection AND
 * shifts the allocation, and naming gUnknown_080912FC in both places makes
 * agbcc force-addr it as well and adds a third level. Also in the codegen doc.
 *
 * gUnknown_08499598[(t >> 6) + 1].unk1a is right and the `+ 1` is real: the ROM
 * folds it into `adds r0,#0x56` on a 0x3c-byte element, i.e. 0x3c + 0x1a. The
 * `asrs` (not `lsrs`) on that shift is what makes `t` a signed `int` local.
 *
 * decomp-permuter was run 300 s / 4 threads from this body and did not close
 * it. Raw try_match percentages are worthless as a ranking here -- a
 * structurally WORSE early draft scored 54.4% against this one's 16.9%, because
 * one missing instruction shifts every later byte. Read the instruction diff,
 * not the score. */
struct Unk3E6C4Map
{
    /* 0x0000 */ u8 filler_0000[0x02];
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x12 - 0x04];
    /* 0x0012 */ u8 unit[0x417A - 0x12];
    /* 0x417A */ u16 rowOffset[1];
};

void sub_0803E6C4(int a1, int a2, int a3)
{
    int row;
    int i;
    int t;

    row = a2 + 3;
    if (row < ((struct Unk3E6C4Map *)*gUnknown_080912FC)->height)
    {
        do
        {
            for (i = 0; i <= 2; i++)
            {
                if (((struct Unk3E6C4Map *)gUnknown_08499590)->unit[((struct Unk3E6C4Map *)gUnknown_08499590)->rowOffset[row] + (a1 + i)] != 0)
                {
                    t = ((struct Unk3E6C4Map *)gUnknown_08499590)->unit[((struct Unk3E6C4Map *)gUnknown_08499590)->rowOffset[row] + (a1 + i)];
                    if (gUnknown_08499598[(t >> 6) + 1].unk1a != 5)
                        sub_0803E560(a1 + i, row, t, a3);
                }
            }
            row++;
        } while (row < ((struct Unk3E6C4Map *)gUnknown_08499590)->height);
    }
}
