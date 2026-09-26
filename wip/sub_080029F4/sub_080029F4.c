/* WAVE 87 (W87-E). Draft unchanged (176/188, 51.6%). WAVE 59'S CENTRAL CLAIM
 * IS REFUTED: the fold is combine's and IS use-count sensitive. Staging the
 * chain through four distinct locals and giving each a SURVIVING second use
 * (a volatile sink) reproduces the ROM's eight instructions exactly, in the
 * ROM's order, in the ROM's single merge block, including `movs #0xa3 /
 * lsls #2` for 0x28C -- see work/sub_080029F4/w87-probe-h-exact-chain.c and
 * W87-notes.md. Pinning t2 alone keeps `subs #1` and `lsls #3`; pinning t3
 * alone keeps `+0x28C` and `lsls #5`; pinning both gives the whole chain. So
 * the two joints wave 57 identified are real and independent. Wave 59's
 * dead-loop vehicle failed because it is a second SET, not a second USE, and
 * flow deletes it before combine runs. ALSO REFUTED this wave: the W81-C
 * disagreeing-definitions lever (`k = a1-1;` vs `k = -(1-a1);` in the two arms
 * of the a4 == 0x19 branch -- tree fold normalises them to the same expression
 * and the chain collapses), a `u32` chain, and per-step `static inline`
 * helpers. THE ONE REMAINING QUESTION is a free second use of the two
 * intermediates; the volatile sink works but costs 4 bytes per pin. This park
 * is no longer "no ranked axis remains". */
#include "global.h"

/* PARKED. 188 bytes, 51.6%, candidate is 176 bytes (-12).
 * RESIDUAL CLASS: SHAPE (a constant fold), 5 missing instructions. NOT register
 * allocation, NOT constant placement, and as of wave 59 NOT the toolchain.
 *
 * THE WHOLE RESIDUAL IS ONE EXPRESSION. Every other byte is identical; the
 * diff's remaining hunks are offset shifts caused by the 12 missing bytes. The
 * shape, the arity (SIX parameters: a5 at [sp,#0x14], a6 at [sp,#0x18]), the
 * branch polarities, the pool layout and the tail are all settled.
 *
 * The ROM computes the a1 != 0 destination UNFOLDED, in the merge block after
 * the `a4 == 0x19` join:
 *   subs r1,r6,#1 ; lsls r1,r1,#3 ; movs r2,#0xa3 ; lsls r2,r2,#2
 *   adds r1,r1,r2 ; lsls r1,r1,#5 ; ldr r2,=0x06010000 ; adds r1,r1,r2
 * i.e. ((a1 - 1) * 8 + 0x28C) * 32 + 0x06010000 with every step separate.
 * agbcc folds all of it to `lsls r1,r6,#8 ; ldr r2,=0x06015080 ; adds`.
 *
 * RULED OUT, wave 52 -- all four produce the identical folded output:
 *   one expression with `* 8`; the same with `<< 3` (the wave-16 "MULT is not a
 *   shift" rule does NOT apply, both fold); `idx = (a1-1)*8 + 0x28C;` as its
 *   own statement then `idx*32 + base`; and three separate statements
 *   `idx = a1-1; idx = idx*8; idx = idx+0x28C;` then `idx*32 + base`.
 *
 * RULED OUT, wave 57: a STATEMENT boundary is not a fold barrier here, only a
 * real BASIC BLOCK boundary is. Computing idx BEFORE an if/else and using it
 * after the join does NOT fold; computing it after the join always does. And
 * the barrier is needed at TWO joints: even split, `(a1-1)*8 + 0x28C` still
 * collapses to `a1*8 + 0x284` within its own block, while the ROM keeps both
 * `subs #1` and `0xa3`. The ROM has all eight instructions in ONE merge block,
 * so no arrangement of C statements reaches it.
 *
 * RULED OUT, wave 59 (W59-A) -- BOTH remaining ranked axes, and they were the
 * only two left:
 *
 * 1. THE TOOLCHAIN. `data/compiler-overrides.json` with `cc1: old_agbcc` (and
 *    `-fprologue-bugfix` removed) on this unit: byte-for-byte IDENTICAL output,
 *    still 176 bytes / 51.6%, same `lsls r1,r6,#8`, same `0x06015080` pool
 *    word. combine's `simplify_shift_const` distributing a shift over a PLUS
 *    was the kind of thing that plausibly differs between gcc builds; here it
 *    does not. The throwaway entry was reverted with `git checkout --`.
 *    This is the fifth consecutive negative from that file (wave 56 got zero
 *    from four probes) and the first one screened on a FOLD rather than on an
 *    address range or a call-in-loop.
 *
 * 2. GIVING THE INTERMEDIATES A SECOND USE. Wave 52 reasoned that the fold
 *    "needs the intermediate to DIE in the insn that consumes it", which is
 *    true of combine, and wave 59 has a vehicle that pins a value through
 *    combine and leaves no code behind (the dead-loop trick that matched
 *    sub_080079B8 -- see docs/agbcc-codegen.md). Applied at BOTH joints, with
 *    `d1 = a1 - 1; while (d1 == 0) d1 = 1;` and the same on the `+ 0x28C`
 *    result: byte-for-byte identical, 176 bytes / 51.6%, not one instruction
 *    moved.
 *    THE PREMISE IS WRONG, and this is the finding worth keeping: THE FOLD IS
 *    DONE BY cse, NOT BY combine. cse works on value numbers and does not care
 *    how many uses an intermediate has, so no use count blocks it -- which is
 *    exactly why statement boundaries never helped and a block boundary does
 *    (cse resets its table at a label, `label_tick`). Do not spend another
 *    attempt on reference counts here.
 *
 * There is no ranked axis left. This is a genuine "compiler output we cannot
 * spell" park, in the same class as the cross-TU prototype cases.
 *
 * Settled, do not re-derive:
 *   - `g = gUnknown_02028E40;` is read ONCE at the top, before `if (a6)`, and
 *     is a source statement: agbcc does no PRE, so it cannot have been hoisted
 *     out of the two arms that use it.
 *   - the `a4 == 0x19` test must be spelled `if (a4 != 0x19) src = call;
 *     else src = table;`. The opposite polarity moves gUnknown_08489190's pool
 *     word into the first pool dump: 0 bytes different but wrong.
 *   - `a4 &= 0x3F` in place on the parameter (`ands r3,r1`).
 *   - the subexpression choosing `src` appears TWICE in the ROM, once in each
 *     arm of `if (a1 == 0)`, with two distinct `bl sub_08011E54` sites. Do NOT
 *     hoist it ahead of the branch -- that emits one copy and loses the match.
 *   - the a1 == 0 arm's 0x06014BC0 is a different index (0x25E) folded at
 *     compile time, not the same expression with a1 = 0.
 */

void sub_080029F4(int a1, int a2, int a3, int a4, int a5, int a6)
{
    int g;
    int attr0, attr1;
    void *src;

    g = gUnknown_02028E40;
    a4 &= 0x3F;
    if (a6)
    {
        if (a1 == 0)
        {
            if (a4 != 0x19)
                src = (void *)sub_0802A838(a4);
            else
                src = gUnknown_08489190[g];
            sub_08011E54(src, (void *)0x06014BC0, 0x100);
        }
        else
        {
            if (a4 != 0x19)
                src = (void *)sub_0802A838(a4);
            else
                src = gUnknown_08489190[g];
            sub_08011E54(src,
                         (void *)((((a1 - 1) * 8 + 0x28C) * 32) + 0x06010000),
                         0x100);
        }
    }

    attr1 = (a2 - 4) & 0x1FF;
    attr0 = (a3 & 0xFF) | 0x400;
    if (a5)
        attr0 |= 0x100;
    sub_0801BD00(attr1, attr0, gUnknown_08485D68[a1], 0x1000);
}
