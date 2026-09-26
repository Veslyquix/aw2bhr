/* WAVE 87 (W87-D). THE W80-C `do { } while (0)` PRIORITY LEVER IS CONFIRMED
 * HERE, and this draft is the result: 180 bytes (+8), 43.6%, first difference
 * +0x13 -- against the wave-52/57 draft's 176 bytes (+4), 19.8%. Both scores
 * are positional; what matters is that SIX of the eight long-lived values now
 * take the ROM's registers instead of three.
 *
 * TWO PLACEMENTS, MEASURED SEPARATELY, THAT COMPOSE:
 *   (1) `do { sub_08003F44(x, y, tt); } while (0);` at BOTH call sites
 *       -> moves h out of r3 into sb (r9), the ROM's register.
 *   (2) `do { ... } while (0);` around the WHOLE INNER for LOOP
 *       -> swaps x and rx into the ROM's r5 / r4 (the old draft had r4=x,
 *          r5=rx; the ROM has r4=rx, r5=x).
 * Neither alone is enough; together every branch, every compare and every
 * frame slot is the ROM's.
 *
 * MEASURED AND USELESS: `do { x = cx - (w >> 1); if (x < 0) x = 0; } while (0)`
 * around the x-init (byte-identical to no loop at all); `do { y++; } while (0)`
 * (byte-identical); `do { tt = t; } while (0)` (byte-identical).
 * MEASURED AND WORSE: moving `tt = t;` inside the outer loop body -- tt then
 * takes r8, w is demoted to r7 and ry (a loop counter) is what gets spilled.
 *
 * WHAT IS LEFT IS NOW EXACTLY ONE SWAP OF TWO ALLOCNOS, nothing else:
 *   ROM        w->r8  h->sb  tt->sl        y+1->[sp,#4]
 *   candidate  w->r8  h->sb  tt->r3(spill) y+1->sl
 * and r4=rx, r5=x, r6=y, r7=ry, [sp]=cx agree. The +8 is the two
 * `str r3,[sp,#4]` before the calls, the `ldr r3,[sp,#4]` at their join, and
 * the tail alignment halfword. global.c gives w, h and y+1 the three high
 * registers and leaves tt to local-alloc; the ROM gives them to w, h and tt
 * and spills y+1. tt has 3 refs over the whole function, y+1 has 2 refs over
 * the inner loop.
 *
 * WAVE 57's `ny = y + 1;` LEVER RE-MEASURED ON THIS DRAFT AND STILL NEGATIVE,
 * with the reason now visible: 180 bytes, 31.4%. Binding it at the top of the
 * outer body does not lower its priority -- it MOVES THE HOIST, emitting
 * `adds r0,r6,#1 / mov sl,r0` in the OUTER preheader where the ROM computes it
 * in the INNER preheader (after the x-init, immediately before `cmp r4,#0`).
 * An explicit local for a value LICM would hoist anyway relocates it. Do not
 * retry any spelling that binds y+1 to a source local ahead of the inner loop.
 *
 * NEXT NAMED STEP: raise tt above y+1 in allocno_compare without moving the
 * hoist. tt's ref count is 3 and y+1's is 2, so floor_log2 ties them; a
 * spelling that gives tt a FOURTH reference, or that shortens tt's live range
 * without changing where it is loaded, is the target. Full record:
 * work/sub_0800401C/W87-notes.md.
 */
#include "global.h"

/* PARKED. 172 bytes, candidate is 176 (+4), 19.8% -- re-measured wave 57
 * (W57-F), unchanged from wave 52. RESIDUAL CLASS: REGISTER ALLOCATION, and
 * it is the cleanest example of one in this batch.
 *
 * The percentage is POSITIONAL and meaningless here -- the instruction stream
 * is correct end to end. The residual is ONE REGISTER-ALLOCATION CHOICE and
 * the three caller-save insns it drags in.
 *
 * ROM allocates:  r8 = w, sb = h, sl = tt, r4 = rx, r5 = x, r6 = y, r7 = ry,
 *                 [sp] = cx, [sp,#4] = the hoisted y + 1.
 * This draft:     r8 = w, sb = tt, sl = y + 1, r4/r5/r6/r7 the same,
 *                 [sp] = cx, and h STAYS IN r3 (call-clobbered), so reload
 *                 inserts `str r3,[sp,#4]` before both `bl sub_08003F44`s and
 *                 `ldr r3,[sp,#4]` at their join. Those three insns are the
 *                 +4 bytes (the ROM's `ldr r6,[sp,#4]` vs this draft's
 *                 `mov r6,sl` accounts for the other 2, and the ROM's
 *                 `mov r2,sb; cmp r2,#3` vs this draft's `cmp r3,#3` gives one
 *                 back -- keeping h in a HIGH register genuinely costs agbcc an
 *                 insn and it paid it anyway).
 *
 * Both versions want 8 long-lived values and have 7 registers. The ROM spills
 * `y + 1`; this draft spills `h`. Nothing about the statements differs.
 *
 * MEASURED wave 52, still a real lever: binding the STACK-PASSED 5th parameter
 * to a local (`tt = t;`) is what got it into a register at all. Without that
 * binding agbcc left `t` in memory, reloaded it with `ldr r2,[sp,#0x28]` at
 * each call site, AND had a spare register to LICM-hoist &gUnknown_08499590
 * into sl -- which the ROM does not do (the ROM re-emits `ldr r0,=...;
 * ldr r0,[r0]; ldrh` at both read sites from one shared pool word). This is
 * the register-pressure direction of the .rodata rule run backwards: the draft
 * had FEWER live values than the original, so it hoisted an address the ROM
 * keeps rematerialising.
 *
 * Also tried and byte-identical: binding `hh = h` (and `ww = w`). agbcc
 * copy-propagates the binding straight back to the incoming r3, so `hh` never
 * becomes a distinct allocno. Binding locals cannot be used to move `h`.
 *
 * WAVE 57 (W57-F): the PERMUTER IS NOT AVAILABLE FOR THIS ONE.
 * `mcp__aw2bhr-decomp__permute` on this function fails with
 * `Error executing tool permute: 'exit_code'` -- a KeyError in the wrapper, not
 * a permuter result -- AND it leaves raw header-expanded permuter output
 * stranded in work/sub_0800401C/sub_0800401C.c, overwriting the draft. That is
 * the wave-17 `permute.py` abnormal-exit bug, which docs/agbcc-codegen.md and
 * the wave brief both record as FIXED. It is not fixed, or it has regressed.
 * The draft below was restored by hand. **Copy work/<fn>/<fn>.c somewhere
 * before running permute on anything.**
 * (The stranded output was mid-search on `new_var = h;` -- i.e. the permuter
 * was exploring the h-binding axis wave 52 had already measured as a no-op.)
 *
 * MEASURED wave 57 (W57-F), and it is a NEGATIVE for the obvious priority
 * lever: binding `ny = y + 1;` at the TOP of the outer body -- which lengthens
 * its live range across `x = cx - (w >> 1)` and so should LOWER its
 * global.c priority -- does not move it. `ny` still takes sl, `h` still stays
 * in r3, and reload still emits the same three caller-save insns. It is also
 * strictly worse on placement: the `adds r1,r6,#1; mov sl,r1` pair moves to the
 * top of the outer body where the ROM has it after the inner for-init. So
 * live-range lengthening is not the axis.
 *
 * Next attempt should go after `y + 1`, not after `h`: find a spelling of the
 * outer-loop increment whose pseudo has a LONGER live range (priority is
 * roughly log2(n_refs) * frequency / live_length, so longer = lower = spilled),
 * or that is not hoisted into the inner preheader at all. The ROM hoists it
 * too, it just does not give it a register. Note `y + 1` has only 2 refs
 * against h's 5, so it is h's LIVE LENGTH (entry to the last inner-loop use)
 * that is losing, and shortening that is the other direction to try.
 *
 * Everything else is settled and byte-exact:
 *   - five parameters, a5 at [sp,#0x28] after `push {r4-r7,lr}; push {r8,sb,sl};
 *     sub sp,#8`;
 *   - the corner test is `(ry != h && ry != 1) || (rx != w && rx != 1)` -- the
 *     function fills a w*h rectangle minus its four corners, and calls
 *     sub_08003F44 unconditionally-but-for-`w == 3` on rectangles with both
 *     sides <= 3;
 *   - both loops are `for (n = dim; n > 0; n--)` with the bounds check
 *     (`x++; if (x >= MAP->width) break;`) AFTER the body and BEFORE the
 *     decrement, which is what puts the `bge` ahead of the `subs`;
 *   - `struct Unk3F44Map` is the c_080040C8.c local struct verbatim; do not
 *     invent a new tag and do not give gUnknown_08499590 a struct type (see
 *     the W34-F note in include/unknown-globals.h).
 */

struct Unk3F44Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0A22 - 0x0004];
    /* 0x0A22 */ u16 plane[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 cell[0x417A - 0x1432];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct Unk3F44Map *)gUnknown_08499590)

void sub_0800401C(int cx, int cy, int w, int h, int t)
{
    int x, y;
    int rx, ry;
    int tt;

    tt = t;
    y = cy - (h >> 1);
    if (y < 0)
        y = 0;
    for (ry = h; ry > 0; ry--)
    {
        x = cx - (w >> 1);
        if (x < 0)
            x = 0;
        do {
            for (rx = w; rx > 0; rx--)
            {
                if (w <= 3 && h <= 3)
                {
                    if (w == 3)
                        do { sub_08003F44(x, y, tt); } while (0);
                }
                else if ((ry != h && ry != 1) || (rx != w && rx != 1))
                    do { sub_08003F44(x, y, tt); } while (0);
                x++;
                if (x >= MAP->width)
                    break;
            }
        } while (0);
        y++;
        if (y >= MAP->height)
            break;
    }
}
