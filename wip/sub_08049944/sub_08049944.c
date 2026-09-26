#include "global.h"

/* Wave 80 (W80-D): 180/180, 14 bytes, unchanged. The W80-C ref-count lever
 * does not reach it: six no-split spellings (duplicated `sub_08013AFC();
 * return;` tail, the tail under both `if (a4)` polarities, `goto` past the
 * second call, `0` for the sixth argument in the a1 == 0 arm -- one a1 ref
 * fewer, cse still stores the known-zero register -- and `a1 - a1`) all keep
 * a1 in r5 and a4 in r6. No shared tail here mentions a1 or a4. Bare tie;
 * stopped at two attempts. parked.json carries the list. */
/* WAVE 89 (W89-D) -- SCREENED OUT, no try_match spent, draft unchanged
 * (180/180, 92.2%, first difference +0x22, configured).
 *
 * THE WAVE'S PRECONDITION IS REFUTED. This park was routed to wave 88's re-read
 * levers on the claim that "the ROM reloading a3 is a memory re-read". Read off
 * target.s, the ROM's reload is `mov r2,r8` -- a HI-TO-LO REGISTER MOVE. a3
 * arrives in r2, the prologue zero-extends it in place and copies it to r8, and
 * the ROM must rebuild r2 only because it chose r2 as the scratch for the two
 * stack-slot constants and clobbered it; this draft chooses r3, so the
 * prologue's value survives in r2 and the reload is free. No memory is involved
 * at that call site, so no re-read lever can act on it however it is spelled.
 *
 * AND THE SPLIT IS NOT THE W83 LIVE-RANGE-SPLIT LEVER. Wave 86's bound says
 * that lever acts only where the ORIGINAL pseudo DIES at the copy. a1 does NOT
 * die at `(new_var = a1)` -- it is used at both sub_08014B0C sites afterwards
 * (`str r6,[sp,#4]`, `adds r3,r6,#0`). W87's refinement (the original must die
 * AND both halves must span a call) excludes it twice over. So W73-B's split
 * buys the ROM's assignment by adding a FOURTH ALLOCNO, not by re-cutting a
 * live range, and the copy it costs is not spellable away: a copy whose source
 * stays live is not coalescable. Nothing in wave 88's four levers
 * (two-statement address split, volatile read against gcse, static inline
 * re-read, wrap the array) touches a parameter's allocno.
 *
 * Note for anyone re-reading the priority model: a5 is the LOWEST-priority
 * allocno by every term and takes r4, the first register in allocation order,
 * in BOTH builds. The thing that has to move is find_reg's conflict and
 * copy-preference handling, not a priority. Full note: W89-notes.md. */
/* 92.2% identical, SIZE-EXACT (180/180), 14 differing bytes, first difference
 * at +0x22. RE-MEASURED wave 77 (W77-K).
 *
 * *** THE RECORDED RESIDUAL HAS MOVED. THE a1/a4 HARD-REGISTER SWAP IS GONE.
 * *** parked.json and every comment before this one describe the remaining 14
 * bytes as "still the a1/a4 swap, now confined". It is not. In the wave-77
 * diff the candidate and the ROM agree on every parameter: a1 -> r6,
 * a2 -> r7, a3 -> r8, a4 -> r5, a5 -> r4, and both emit `cmp r5,#0` for a4 and
 * `cmp r6,#0` for a1. W73-B's live-range split fixed the swap outright; what
 * is left is a different pair of facts that happen to cancel in size.
 *
 * THE 14 BYTES ARE TWO COMPENSATING ERRORS, +2 and -2:
 *
 *  (1) THE SPLIT COSTS ONE INSTRUCTION THE ROM DOES NOT PAY. The ROM has NO
 *      live-range split at all -- a1 is r6 at every one of its five uses
 *      (`cmp r6,#0`, `cmp r6,#10`, `cmp r6,r1`, `str r6,[sp,#4]`,
 *      `adds r3,r6,#0`). This draft emits an extra `adds r3,r6,#0` right after
 *      `bl sub_08012BC8` and then tests `cmp r3,r1` in the loop. +2 bytes.
 *
 *  (2) THE ROM SPENDS r2 ON THE TWO STACK-SLOT CONSTANTS AND RELOADS a3.
 *          ROM     movs r2,#2 / str r2,[sp,#0] / movs r2,#0 / str r2,[sp,#4]
 *                  / mov r2,r8 / movs r3,#6
 *          draft   movs r3,#2 / str r3,[sp,#0] / movs r3,#0 / str r3,[sp,#4]
 *                  / movs r3,#6
 *      The draft routes the constants through r3 and finds a3 still sitting in
 *      r2 from the prologue's `mov r8,r2`, so it never pays the reload.
 *      -2 bytes.
 *
 * These are ONE fact, not two: r3 is unavailable as the stack-arg scratch in
 * this draft precisely because the split parks new_var there. A spelling that
 * reproduces the ROM's register assignment WITHOUT a split would close the
 * function outright -- both errors vanish together.
 *
 * MEASURED THIS WAVE, do not repeat:
 *   - SPLITTING AT THE CALLS INSTEAD OF AT THE LOOP -- `new_var = a1;` as its
 *     own leading statement, `a1` in the loop test, `new_var` as the
 *     sub_08014B0C argument. CATASTROPHIC: 192 bytes (+12), 5.0% identical,
 *     first difference at +0x2. It forces a fifth callee-saved register (r9
 *     for a5), an extra `mov r3,r9 / str r3,[sp,#0]` at both call sites and an
 *     `adds r4,r6,#0` in the prologue. The split has to be the ASSIGNMENT
 *     INSIDE THE `if` CONDITION, as below; a leading copy statement is a
 *     different and much worse construct.
 *   - LOCAL DECLARATION ORDER IS BYTE-NEUTRAL (measured on sub_0801F234 and
 *     sub_08052BBC this wave, four and two permutations). Not a lever here or
 *     anywhere.
 *
 * FIXED IN WAVE 59, still settled -- THE ARGUMENT IS `(u16)a2 - 5`, cast on
 * the OPERAND, worth 8 bytes and the whole size error. a2 is live across basic
 * blocks so the prologue has already materialised it zero-extended in r7;
 * `(u16)a2` costs nothing and the subtraction is a plain SImode `subs r1,r7,#5`
 * with no shift for combine to distribute into. `(u16)(a2 - 5)` is the
 * reassociated form and is NOT the same code. docs/agbcc-codegen.md's chapter
 * "(u16)(narrow - K): SIX spellings all reassociate" carries the refutation.
 *
 * AXES RULED OUT, do not re-measure:
 *   - the symmetric sub_08014B0C argument spelling (both arms `a1, a5, 0`):
 *     byte-identical, because cse knows a1 == 0 on the first arm.
 *   - `(u16)(a2 - 5)`, `int`/`u16` temps, `& 0xffff`, `u16 a2` with `(s16)`
 *     casts at the calls: all the reassociated form.
 *   - the loop shape: `n = n * 10` is ONE u16 multiply, the `i <= 9` test
 *     precedes the `a1 >= n` test, the body precedes the increment. Byte-exact.
 *   - toolchain: all SEVEN compiler profiles gave byte-identical output.
 *   - decomp-permuter: four runs (300/300/600/600 s), PLATEAUED at 92.2%,
 *     internal base score 225 never beaten. Run 1 is what found the split. */
void sub_08049944(u16 a1, s16 a2, s16 a3, u8 a4, u16 a5)
{
    u16 new_var;
    u16 i;
    u16 n;

    if (a4 != 0)
        sub_08012BC8(gUnknown_0849957C, (u16)a2 - 5, a3, 6, 2, 0);

    if ((new_var = a1) == 0)
    {
        if (a4 != 0)
            sub_08014B0C(a2, a3, gUnknown_0849957C, 0, a5, a1);
    }
    else
    {
        n = 10;

        for (i = 0; i <= 9 && new_var >= n; i++)
            n = n * 10;

        if (a4 != 0)
            sub_08014B0C(a2, a3, gUnknown_0849957C, a1, a5, 0);
    }

    sub_08013AFC();
}
