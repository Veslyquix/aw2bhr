#include "global.h"

/* WAVE 89 (W89-C) -- THE CLASS IS NOW CLOSED, WITH A MEASUREMENT, AND THE
 * WAVE-43 REFRAMING IS CORRECTED. Read this before anything below.
 * One compile_probe, three variants; one try_match, spent only to record this
 * note and re-verify. Details in work/sub_08045FC8/W89-notes.md.
 *
 * THE QUESTION WAVE 89 ASKED: can either operand of the second `i << 4` be
 * sourced through a volatile read or a `static inline` boundary -- the two
 * wave-88 levers -- so that the second occurrence stops being an available
 * expression? Measured:
 *
 *   Q1  static __inline__ int pos(int x) { return x * 16 + 0x30; } at the
 *       position argument.  CSE INTACT: still `lsl r2,r4,#4 / sub r0,r2,r4`
 *       and a bare `add r2,r2,#0x30`. The helper only MOVES that add above the
 *       `ldrb r0,[r0,#0x1a]`. Byte-neutral on the residual.
 *   Q2  a helper around the record subscript (the operand of the FIRST,
 *       compiler-invented `i << 4`). Byte-identical to the shipped draft.
 *   Q3  `volatile u16 vi; vi = i;` in the loop body, second use `vi * 16`.
 *       This IS the only construct that makes the second occurrence
 *       unavailable, and it WORKS on the residual -- but it costs a stack
 *       slot, a callee-saved register and two memory accesses per iteration:
 *       `push {r4,r5,lr}` instead of `{r4,lr}`, `sub sp,#8` instead of `#4`,
 *       `add r5,sp,#4`, `strh r4,[r5]` every iteration and `ldrh r2,[r5]` at
 *       the use. Far more than the 2 bytes it buys.
 *
 * WHY THE WAVE-88 HELPER CANNOT REACH THIS, structurally, so nobody re-runs
 * it: W88-C's own discriminator is that the helper re-cuts a shared
 * subexpression whose live range CROSSES A CALL, and is deleted outright
 * otherwise. Both `i << 4` occurrences sit in ONE basic block (the `if` body
 * is the fall-through of the `bne`), with no `bl` between them -- the call to
 * sub_0801F34C comes after both. There is no call inside the live range, so by
 * the lever's own bound it is inert here. And the value being shared is a
 * LOOP COUNTER in a register: it never reaches the use through memory, which
 * is the only thing either wave-88 lever acts on. The answer is structurally
 * NO on both counts, and Q1/Q2 measure it.
 *
 * CORRECTION TO W43-H, and this is the durable part. W43-H concluded "this is
 * not about CSE firing, it is about WHICH REGISTER the shift landed in", and
 * used that to declare the ten wave-37 source shapes the wrong axis. Q3 shows
 * the register choice is DOWNSTREAM, not independent: the moment the second
 * `i << 4` is not an available expression, agbcc emits the ROM's own
 * destructive form for the first one --
 *       lsl r0,r4,#0x4 ; sub r0,r0,r4      (Q3, and the ROM)
 * versus the draft's
 *       lsl r2,r4,#0x4 ; sub r0,r2,r4
 * -- with no other change. So it IS a single fact and it IS CSE availability;
 * the register allocation follows it for free. The ten wave-37 shapes were the
 * right axis and simply never made the expression unavailable.
 *
 * THE CLASS IS CLOSED. Every construct that makes the second occurrence
 * unavailable routes the value through something the RTL cannot value-number
 * with the first: a HImode truncation (wave 37's `(u16)` forms, +4) or memory
 * (Q3's volatile, +6 and a register). There is no zero-cost member of that
 * set, because the shared value is a plain SImode register expression on a
 * source local. Do not spend another wave on in-function spellings. The only
 * reading still open is the one wave 73 named and it is not reachable from
 * inside this function: a wider source context (an inline or macro boundary
 * shared with a neighbour) that would change what the multiply expander
 * invents. -- W89-C */

/* PARKED, wave 37 (W37-P3), with ONE instruction of difference. Re-verified
 * wave 73 (W73-C): 104 bytes reported, 32.7%, unchanged.
 *
 * The function is a list redraw: for every army slot 1..sub_080248F8() whose
 * unk14 is zero it draws `unk1a + 0x3d` at (8, i * 16 + 0x30), then draws the
 * two fixed items at (2, 8) and (0xa9, 0x5f).
 *
 * EVERYTHING matches except this: the ROM computes `i << 4` TWICE --
 *
 *     lsls r0, r4, #4      <- for gUnknown_08499598[i]'s * 0x3c synthesis,
 *     subs r0, r0, r4         which agbcc expands as ((i << 4) - i) << 2
 *     lsls r0, r0, #2
 *     ...
 *     lsls r2, r4, #4      <- again, for the third argument
 *     adds r2, #0x30
 *
 * -- while agbcc CSEs the two into one, keeping the shift in r2 and reading it
 * back for the argument.  The candidate is exactly 2 bytes of CODE shorter and
 * only totals 104 because the pool word then needs 2 bytes of alignment
 * padding, so `size: match` here is a coincidence, not a near miss.
 *
 * Both `i << 4` live in one CSE extended basic block (the `if` body is the
 * fall-through of the `bne`, with no CODE_LABEL between them), so cse_insn sees
 * the second occurrence and substitutes the first's register.  TEN source
 * shapes were measured and all ten produce byte-identical output, i.e. the CSE
 * is not reachable from the statement shape at all:
 *   - `i * 16 + 0x30`, `i << 4`, `0x30 + i * 16`, `(i - 1) * 16 + 0x40`
 *     (fold distributes it straight back), `y = i * 16; ... y + 0x30`
 *   - `if (...) call;`, `if (... != 0) continue; call;`, `if/else` both ways,
 *     `switch (unk14) { case 0: }` -- none of them puts a label between the two
 *     shifts, which is the only thing that would end the CSE block
 *   - element bound as `p = &gUnknown_08499598[i]` (hoists the pool address into
 *     r5 and costs a register -- strictly worse) and as `p = gUnknown_08499598`
 *     (no change at all)
 *   - naming `gUnknown_08499598[i].unk14` again as the fifth argument: the load
 *     is RE-EMITTED, so the fifth argument is a literal 0 and gcc's reuse of r1
 *     for it is its own knowledge that r1 == 0 on that path
 *   - `(u16)(i * 16 + 0x30)` and a `u16 y` temporary: these DO break the CSE,
 *     because HImode arithmetic is a different RTL expression -- but they pay
 *     `lsl #16; lsr #16` for it, +4 bytes instead of +2.  So the third
 *     parameter of sub_0801F34C is NOT narrow.
 *
 * AXES RULED OUT, so the next agent should not re-measure them:
 *   - the loop shape.  The ROM's forward `b` past the increment into a bottom
 *     test is the `for` spelling (wave 37 W37-P2's rule) and the candidate
 *     reproduces the entry branch, the increment block and the back edge
 *     exactly.
 *   - `u16 i`.  The bottom `bls` needs shorten_compare on two unsigned narrow
 *     operands -- `int i` gives `ble`, and `u8 i` would truncate the increment
 *     at 24 bits rather than the ROM's 16.
 *   - the * 0x3c synthesis, the argument grouping, and both trailing calls.
 *   - WAVE 81 (W81-C): all seven compiler profiles -- default, no-force, o1,
 *     o1-no-force, old-agbcc, old-agbcc-no-force -- report the identical
 *     104-byte / 32.7% / 70-differing result. Toolchain axis closed.
 */
void sub_08045FC8(void)
{
    u16 i;

    for (i = 1; i <= sub_080248F8(); i++)
    {
        if (gUnknown_08499598[i].unk14 == 0)
            sub_0801F34C(gUnknown_08499598[i].unk1a + 0x3d, 8, i * 16 + 0x30, 0, 0);
    }

    sub_0801F34C(2, 8, 0x10, 0, 0);
    sub_0801F34C(0xa9, 0x5f, 0x30, 0, 0);
}

/* WAVE 43 (W43-H) -- RE-FRAMED, and the frame matters more than the result.
 * NOTE: the reframing below is CORRECTED by W89-C at the top of this file.
 * Q3 shows the register choice is a consequence of the CSE, not an
 * independent allocation fact. Kept for the listings, which are accurate.
 *
 *   ROM        lsls r0, r4, #4     <- i<<4 into r0 ...
 *              subs r0, r0, r4     <- ... and IMMEDIATELY CLOBBERED
 *              lsls r0, r0, #2
 *              adds r0, r0, r1
 *              ...
 *              lsls r2, r4, #4     <- so it must be recomputed
 *
 *   candidate  lsl  r2, r4, #4     <- i<<4 into r2 ...
 *              sub  r0, r2, r4     <- ... 3-operand, r2 SURVIVES
 *              lsl  r0, r0, #2
 *              add  r0, r0, r1
 *              ...
 *              add  r2, r2, #0x30  <- so it is still there to reuse
 *
 * PERMUTER: 22,157 iterations, 4 threads, 300 s, nothing better. The candidate
 * is 2 bytes of CODE shorter and is a strictly BETTER allocation than the
 * ROM's, and the permuter's variants are all well-allocated too, so the search
 * space does not contain the original's answer.
 *
 * `size: match` at 104 remains a coincidence: 2 bytes short on code, 2 bytes
 * of pool alignment padding back. Do not read it as a near miss. */

/* WAVE 43 (W43-J) -- STILL PARKED at the same one instruction. W43-H's "next
 * lever" was tried and it does not work. The body above is unchanged.
 *
 * TWO MORE SHAPES MEASURED, both by compile_probe, both still emitting
 * `lsl r2, r4, #4 / sub r0, r2, r4` (the CSE-preserving 3-operand form):
 *   - `int zero = 0;` bound before the loop and passed as arguments 4 and 5,
 *     the zero-cost pressure lever from the wave-43 W43-C chapter. It costs a
 *     register rather than nothing: r5 is burned for the whole function and
 *     the push list grows to {r4, r5, lr}. Strictly worse.
 *   - `e = gUnknown_08499598[i].unk14; if (e == 0) ... , 0, e);` -- reading
 *     unk14 into a local and passing that local as the fifth argument. Neutral
 *     on the residual, but it is worth recording that it reproduces the ROM's
 *     `str r1, [sp]` (the fifth argument sharing the register the unk14 load
 *     landed in) EXPLICITLY, where the shipped body gets the same bytes only
 *     via gcc's own knowledge that r1 == 0 on that path. Same output, and the
 *     explicit form is the likelier original; it is not shipped because it is
 *     not an improvement and the shipped body is the one all the ruled-out
 *     axes were measured against.
 *
 * WHY THE W43-J LEVER DOES NOT REACH THIS ONE. That lever (writing a result
 * back to a parameter, or splitting a subexpression into its own local, to add
 * a live range) closed the other three functions in this batch, all of which
 * had SLOT-WRONG residuals -- the right instructions in the right order in the
 * wrong registers. This function's residual is not slot-wrong: it is one
 * instruction the ROM has and the candidate does not. Adding a live range
 * cannot un-substitute a CSE. Do not try it again. */

/* WAVE 86 (W86-E) -- MIRROR/TWIN AXIS, CLEAN NO. 0 probes, 0 try_match.
 * See work/sub_08045FC8/W86-notes.md.
 *
 * Screened twin sub_080853B0 (src/decomp/c_080853B0.c, matched, 96B). Pair
 * class: SAME-VOCABULARY NEIGHBOUR. It shares sub_0801F34C, sub_080248F8,
 * gUnknown_08499598, the unk1a + 0x3d draw argument, the 0x3c stride and the
 * bound re-evaluated in the for condition -- and differs in exactly the place
 * this residual lives.
 *
 * Its distinguishing construct is a counter from 0 with the record indexed
 * [i + 1]. That looked like the W86-D inline-sibling trap, because the list
 * above rules out (i - 1) * 16 + 0x40, the counter-from-ONE rewrite, and not
 * this one. REFUTED by this function own assembly: both scaled indices read
 * the SAME r4 (lsls r0, r4, #4 for the 0x3c synthesis and lsls r2, r4, #4 for
 * the position), and the increment block is adds r0, r4, #1; lsls #0x10;
 * lsrs r4, #0x10 on the counter, entered at movs r4, #1. One variable from 1,
 * exactly as drafted. There is no i + 1.
 *
 * And the twin cannot help in principle: its two scaled indices derive from
 * DIFFERENT values (i + 1 for the record, i for the position), so its build
 * never had a shared i << 4 and its ROM cannot exhibit this phenomenon. A twin
 * that does not contain the residual construct cannot supply a solved instance
 * of it, however much vocabulary it shares. Dead end verdict stands. */
