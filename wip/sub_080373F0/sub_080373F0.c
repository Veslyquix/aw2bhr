#include "global.h"

/* PARKED at 73.9% -- wave 51 (W51-B), previous best 72.7% (wave 43, W43-D),
 * re-measured and permuted wave 57 (W57-E).
 * SIZE IS EXACT (88/88) and the instruction MULTISET is exact. The whole
 * residual is still the POSITION OF ONE 4-BYTE BLOCK -- the shared
 * `movs r0,#0 ; b <epilogue>` that all three failure paths reach.
 *
 * WAVE 57 -- RESIDUAL CLASSIFIED, and it is NOT the wave-57 headline kind.
 * This is neither register allocation nor constant placement nor a wrong
 * source shape: it is BASIC-BLOCK LAYOUT -- which of three byte-identical
 * `return 0` blocks survives cross-jumping and which two become branches to it.
 * Register assignment and pool contents are already the ROM's.
 *
 * WAVE 57 -- THE PERMUTER IS NOW TRIED, and it is negative. 300 s, 19,619
 * iterations from this 73.9% file: ceiling 73.9%, no byte match, and the three
 * candidates it surfaced scored 73.9 / 40.9 / 61.4. The "NOT TRIED" note that
 * used to sit here is closed -- do not spend another run on it. Both permuter
 * candidates scored identically spliced and raw, so there is no header drift
 * behind this one either.
 *
 * The ROM lays that block out BETWEEN the range test and the unk01 test:
 *
 *     arm 1      cmp r0,r4 ; beq _43E (ret 1) ; b _428
 *                <literal pool>
 *     _0803741C  <range test> cmp r0,#8 ; bhi _42C
 *     _08037428  movs r0,#0 ; b _08037440        <- the ANCHOR
 *     _0803742C  ldrb r0,[r1,#1] ; cmp r0,#3 ; bne _43E
 *                bl sub_0803CC64 ; lsls #0x18 ; cmp r0,#0 ; beq _08037428
 *     _0803743E  movs r0,#1                     <- falls into the epilogue
 *
 * WHAT DECIDES THE SURVIVOR, as far as it is understood: the ROM's surviving
 * copy is the one entered by FALL-THROUGH (`bhi` jumps PAST it, so the range
 * test falls into it), while arm 1's and the CC64 test's copies are reached
 * only by a branch and are therefore deletable outright. No spelling yet found
 * makes the RANGE TEST's copy the fall-through-entered one while leaving the
 * other two as jumps -- in this file arm 1's copy is fall-through-entered, and
 * in the 72.7% spelling the CC64 one is.
 *
 * WAVE 51 -- the anchor is chosen by ARM 1's SPELLING, and it moves.
 * Nine wave-43 spellings all left the anchor at the END, which read as "agbcc
 * always keeps the last copy". It does not:
 *
 *   - arm 1 as `if (sub_0802490C(a) == b) return 1; return 0;` (this is the
 *     ROM's arm 1 -- its two branch senses `beq`/`b` are reproduced EXACTLY)
 *     -> arm 1's own copy is deleted and redirected FORWARD, and the anchor
 *        ends up at the LAST site, the sub_0803CC64 one. 72.7%.
 *   - arm 1 as `if (sub_0802490C(a) != b) return 0;` inside an if/else whose
 *     shared tail is `return 1;`
 *     -> arm 1's copy survives and the other two are redirected BACKWARD to
 *        it (`bls`/`beq` to an EARLIER address). The anchor ends up at the
 *        FIRST site. 73.9%, this file.
 *
 * So cross-jumping in this compiler redirects in BOTH directions, and the
 * surviving copy is not simply the last one. First and last are both
 * reachable; the ROM's MIDDLE one is not, by any spelling tried.
 *
 * COST OF THIS FILE'S SPELLING: it puts the anchor at the wrong end, and arm 1
 * emits its block inline (`movs r0,#0 ; b`) where the ROM has a bare
 * `b _08037428`. The 72.7% spelling has ROM-exact arm-1 branch senses and is
 * arguably the better shape to resume from even though it scores lower -- the
 * score is positional. It is:
 *
 *     if (gUnknown_03003FC0.unk32 != 0) {
 *         if (sub_0802490C(a) == b) return 1;
 *         return 0;
 *     }
 *     if ((u16)(a - 0xb7) <= 8) return 0;
 *     if (gUnknown_03003FC0.unk01 == 3 && (u8)sub_0803CC64(a) == 0) return 0;
 *     return 1;
 *
 * Ruled out by compile_probe in wave 43, NINE spellings, all identical except
 * in this block's placement -- do not re-walk these:
 *   - `if (X) return 0;` then separate `if (unk01 != 3) return 1;` and
 *     `if (cc64 == 0) return 0;` (branch senses match the ROM) -- 69.3%.
 *   - the same with `unk01 == 3 && cc64 == 0` folded into one `&&` -- 72.7%.
 *   - `if (X > 8) { ... }` with a trailing `return 0`.
 *   - `else if` chains, an explicit `else { }` around the tail, arm 1 inverted,
 *     and the CC64 test nested inside `if (unk01 == 3) { ... return 1; }`.
 *   Inverting the unk32 arms is NOT one of these: the ROM's `beq` puts the
 *   sub_0802490C arm on the fall-through, which fixes that ordering.
 *
 * ALSO SETTLED, do not re-open: the last statement of the function is
 * `return 1` (the ROM's `movs r0,#1` is the epilogue's fall-through, so no
 * spelling ending in `return 0;` can be right); sub_0803CC64 returns `int`
 * (its promoted definition says so), so the `lsls #0x18` before the test is a
 * `(u8)` cast written in the source -- without the cast the instruction
 * disappears entirely. */
u8 sub_080373F0(u16 a, u16 b)
{
    if (gUnknown_03003FC0.unk32 != 0)
    {
        if (sub_0802490C(a) != b)
            return 0;
    }
    else
    {
        if ((u16)(a - 0xb7) <= 8)
            return 0;
        if (gUnknown_03003FC0.unk01 == 3 && (u8)sub_0803CC64(a) == 0)
            return 0;
    }

    return 1;
}
