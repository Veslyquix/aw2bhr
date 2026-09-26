/* PARKED at 96.8%, wave 56 W56-I.  SIZE IS EXACT (496 bytes) and 16 bytes
 * differ, all of them in ONE basic block -- the `c != 0` arm of the
 * `gUnknown_03003FC0.unk32 != 0` tail.  Everything else is byte-identical.
 *
 * THE RESIDUAL IS A SINGLE COALESCING DECISION, AND IT IS SWAPPED BETWEEN TWO
 * ADJACENT BLOCKS.  The ROM spends the copy on the `d` test and not on the `c`
 * test:
 *     ldr r1,[sp,#0xc]; cmp r1,#0; beq FAIL; adds r0,r1,#0; b CALL
 *     ldr r0,[sp,#8];   cmp r0,#0; bne CALL            <- falls into FAIL
 * This candidate does the opposite -- it coalesces the `d` test's load straight
 * into r0 (no copy, 4 instructions) and then needs `adds r0,r1,#0` on the `c`
 * test (5 instructions).  The two cancel, which is why the size still matches.
 *
 * FOUR LEVERS THAT WERE MEASURED HERE -- reuse them, do not re-derive them:
 *  1. `int m` with an explicit `(u8)m` at each use, NOT `u8 m`.  agbcc then
 *     strength-reduces the last loop into the ROM's shape: a biv `m << 24`
 *     (`movs r5,#128; lsls r5,#17`), a giv `m * 0x3c`, and a separate
 *     down-counter that check_dbra_loop reverses.  Declared `u8`, the counter
 *     stays masked (`adds; lsls #24; lsrs #24`) and the whole loop misses.
 *  2. `a = b = c = d = 0;` as ONE chained assignment.  It stores 0xc, 8, 4, 0
 *     -- descending, because the innermost assignment is evaluated first -- and
 *     that is the ROM's order.  Four separate statements store ascending AND
 *     leave one of the four in a register (three stack slots, `sub sp, #12`).
 *  3. `do { } while (0);` immediately before `flag = 1;` in the inner loop.
 *     Found by the permuter; worth 47.6% -> 83.1% on its own.
 *  4. The inner `if (flag == 1)` must be a bare `break`, with the ONE
 *     `sub_08037FB4(parent); return;` living after the outer loop.  Written as
 *     a duplicated call inside the loop it scores 88.5%; as a `break` it scores
 *     96.8%.  gcc cross-jumps the two tests onto the single call block either
 *     way, but the duplicate changes where that block is PLACED.
 *
 * ONE THING RULED OUT: binding `e = gUnknown_08499598;` before the outer loop.
 * WAVE 79 (W79-A) RE-MEASURED THIS: still SIZE-EXACT 496/496, 96.8%, 16 bytes,
 * first difference at +0x188. THREE MORE AXES RULED OUT, do not re-derive:
 *  5. Inverting the two tested arms -- `if (a != 0) { if (c != 0) ... }
 *     else if (d != 0) ...` -- is 96.4%, two bytes WORSE, same residual.
 *  6. Flattening them into two independent statements -- byte-identical.
 *  7. Register-pinning regressions (83.1% / 82.7%).
 * W81-B: independent definitions / decl-order swap also ruled out.
 * W83-C: def-site comma dependency rules out.
 * W84-B: explicit-dd hand-off temp at the d-arm call = NULL (same residual,
 * pool word relocates cosmetically). Chained 300 s permuter run from clean
 * baseline: no promoted byte-level improvement (best.c/best.json unchanged).
 *
 * WAVE 88 (W88-A): TWO MORE AXES CLOSED, BOTH EXACTLY BYTE-NEUTRAL. Unchanged
 * at 496/496, 16 differ, 96.8%, first difference +0x188 under `configured`.
 *  8. A `static inline int val(int x) { return x; }` wrapped around the d-arm
 *     call argument -- the W86-E/W87 sub_0804F658 live-range-recut lever.
 *     BYTE-IDENTICAL to this draft. An identity helper around an argument is
 *     deleted outright, so it cannot re-cut anything; W87's win came from
 *     wrapping a shared SUBEXPRESSION, and there is no shared subexpression
 *     here.
 *  9. Bind-both in source order in the tail: `dd = d; cc = c;` as the first two
 *     statements of the `unk32 != 0` block, ahead of the `a == 0` test, both
 *     arms reading the binds. BYTE-IDENTICAL to this draft. Binding a value
 *     that is ALREADY a local in a stack slot is not a bind -- the W87 "bind
 *     both and let cse decide" rule needs the bound thing to be an ADDRESS or a
 *     computation, not a reload of an existing slot.
 *
 * THE FOUR MOST RECENT AXES ALL CAME BACK BYTE-NEUTRAL RATHER THAN AS
 * REGRESSIONS. The source has no remaining handle on this decision: after cse
 * the two candidate predecessors are identical, and which one gets the
 * coalesced load is settled inside local-alloc. This is the best-documented
 * residual-kind-4 instance in the project (which of N identical predecessors of
 * a cross-jumped call block survives), and the rule for kind 4 is to stop.
 * RECOMMENDATION: retire it from the batchable pool.
 */
#include "global.h"
#include "proc.h"

void sub_08037FD0(ProcPtr parent)
{
    int a;
    int b;
    int c;
    int d;
    int flag;
    int i;
    int j;
    int m;

    for (i = 1; i <= 4; i++)
    {
        if (sub_080266DC(i))
            sub_080265D0(i, gUnknown_03003FC0.unk02);
    }
    sub_08026520();
    sub_08017720(gUnknown_08499598[sub_0807A908()].unk1d,
                 gUnknown_03003FC0.unk02,
                 gUnknown_08499598[sub_0807A908()].unk38,
                 gUnknown_03004080);
    sub_08030574();
    switch (gUnknown_03003FC0.unk01)
    {
    case 0:
    case 1:
    case 2:
        if (sub_080266DC(1))
            sub_08037F94(1, parent);
        else
            sub_08037FB4(parent);
        break;
    case 3:
        a = b = c = d = 0;
        flag = 0;
        for (i = 1; i <= 4; i++)
        {
            if (gUnknown_08499598[i].unk1b != 0)
            {
                if (gUnknown_08499598[i].unk14 == 0)
                {
                    for (j = 1; j <= 4; j++)
                    {
                        if (i != j
                         && gUnknown_08499598[j].unk1b != 0
                         && gUnknown_08499598[j].unk14 == 0
                         && gUnknown_08499598[i].unk2a != gUnknown_08499598[j].unk2a)
                        {
                            do { } while (0);
                            flag = 1;
                            break;
                        }
                    }
                }
                if (flag == 1)
                    break;
            }
        }
        if (flag == 1)
        {
            sub_08037FB4(parent);
            return;
        }
        for (m = 1; m <= 4; m++)
        {
            switch (gUnknown_08499598[m].unk1b)
            {
            case 0:
                break;
            case 1:
                a = (u8)m;
                if (sub_080266DC(m))
                    c = a;
                break;
            case 2:
                b = (u8)m;
                if (sub_080266DC(m))
                    d = b;
                break;
            default:
                if (sub_080266DC(m))
                    d = (u8)m;
                break;
            }
        }
        if (gUnknown_03003FC0.unk32 != 0)
        {
            if (a == 0)
            {
                if (d != 0)
                {
                    sub_08037F94(d, parent);
                    return;
                }
            }
            else if (c != 0)
            {
                sub_08037F94(c, parent);
                return;
            }
            sub_08037FB4(parent);
            return;
        }
        {
            if (b == 0)
                sub_08037F94(c, parent);
            else if (a == 0)
                sub_08037F94(d, parent);
            else if (c != 0)
                sub_08037F94(c, parent);
            else
                sub_08037FB4(parent);
        }
        break;
    }
}
