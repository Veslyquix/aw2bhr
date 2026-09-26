#include "global.h"

/* WAVE 86 (W86-A).  Wave 85's killed permuter run was RE-RUN FULL LENGTH from
 * the 97.6% best.c base: 14,087 iterations / 4 threads / 300 s, one harvested
 * candidate at permuter score 155 which re-scored 93.0% (29 of 416 differ,
 * first difference +0x12) -- BELOW the base.  best.c and best.json unchanged.
 * This converts wave 85's "unfinished" into a real permuter NEGATIVE on a
 * residual that is squarely in the permuter's documented order/slot class.
 * No chained run was launched: the first run moved nothing, so there is no
 * new starting point.  Residual unchanged: 10 of 416 at +0x22 -- loop-1
 * preheader order (ldr before movs #0) with its sl-copy scratch cascade
 * (mov r3 vs r1) and the latch step scratch (movs r0,#2 vs movs r3,#2).
 * See work/sub_08086A58/W86-notes.md. */

/* PARKED, wave 54 (W54-D); re-verified wave 59.  WAVE 85 (W85-D2): the giv
 * residual is being attacked with the W46-L lever from the matched neighbour
 * c_08086BF8.c -- `int k = i * 2;` bound to a BLOCK-LOCAL inside each arm
 * (function scope does not reduce), `y = b + 5;` as a statement of its own
 * inside the arm so simplify_giv_expr returns 0 for it, and `z = k + y;` so
 * expand_binop cannot swap the ADDS.  The wave-54 probes never combined these
 * three: they kept the sum as one expression `(s16)(b + 5 + j)`.
 *
 * SETTLED HERE:
 *  - argument 2 is `int`, not `u32` (all three tests are SIGNED branches).
 *  - gUnknown_081D9438 is a -fforce-addr .rodata pool word holding
 *    0x08499578; write gUnknown_08499578 honestly.
 *  - the list pointer must be `(u8 *)&gUnknown_02027F74` bumped by 4 in a
 *    statement of ITS OWN.
 *  - the `f` flag: W54's `(x != 0) ? 0 : 1` line is REFUTED (W85, measured --
 *    that spelling presets the THEN arm, movs r5,#0 / bne, like every folded
 *    comparison form).  The ROM's movs r5,#1 / cmp / beq / movs r5,#0 needs the
 *    call result bound to a local FIRST, then the statement form:
 *        u8 c = sub_0803CB24(q[a + i]);
 *        f = 1;
 *        if (c != 0)
 *            f = 0;
 *    The preset must come AFTER the bl; without the local, `f = 1; if (...)`
 *    schedules the store before the call (92.8%).
 *
 *  WAVE 85 state: 97.6% (10 bytes).  Remaining: the loop-1 preheader order
 *  (q's ldr before the movs#0) with its sl-copy scratch cascade, and the latch
 *  step scratch (movs r0,#2 vs movs r3,#2).  The q-hoist that fixes the
 *  preheader order flips the k-giv r8->r7 and displaces n -- measured twice
 *  (with two f-spellings), 41.6% at worst; the two orders trade against each
 *  other and are not reachable together from this spelling set.  A 300s
 *  permute from this base was killed by the MCP client timeout before scoring;
 *  re-run full-length before reasoning from the park. */

void sub_08086A58(int a, int n, int b)
{
    u8 *q;
    int i;
    int f;
    int y;
    int z;
    int t;

    sub_08013C00();

    if (gPlaySt.gameMode == 2)
    {
        for (i = 0; i < n; i++)
        {
            q = (u8 *)&gUnknown_02027F74;
            q += 4;

            {
            u8 c = sub_0803CB24(q[a + i]);
            f = 1;
            if (c != 0)
                f = 0;
            }

            if (q[a + i] <= 0xB3 && (t = (u8)sub_0803CA54(q[a + i])) == 0)
            {
                int k = i * 2;
                y = b + 5;
                z = k + y;
                sub_080149C0(1, (s16)z, gUnknown_08499578,
                             gUnknown_084C3F50, t, f);
            }
            else
            {
                u8 *p = sub_08024944(q[a + i]);
                int k = i * 2;
                y = b + 5;
                z = k + y;
                sub_080149C0(1, (s16)z, gUnknown_08499578, p, 0, f);
            }
        }

        sub_08087548(a, n, b);
    }
    else
    {
        sub_08014A5C(1, 5, gUnknown_08499578,
                     gUnknown_08499CE4[gUnknown_0300596C], 0, 0);

        if (gUnknown_02027F74.unk37 < n)
            n = gUnknown_02027F74.unk37 + 1;

        for (i = 0; i < n; i++)
        {
            q = (u8 *)&gUnknown_02027F74;
            q += 4;

            {
            u8 c = sub_0803CB24(q[a + i]);
            f = 1;
            if (c != 0)
                f = 0;
            }

            if (q[a + i] <= 0xB3 && (t = (u8)sub_0803CA54(q[a + i])) == 0)
            {
                int k = i * 2;
                y = b + 9;
                z = k + y;
                sub_080149C0(1, (s16)z, gUnknown_08499578,
                             gUnknown_084C3F50, t, f);
            }
            else
            {
                u8 *p = sub_08024944(q[a + i]);
                int k = i * 2;
                y = b + 9;
                z = k + y;
                sub_080149C0(1, (s16)z, gUnknown_08499578, p, 0, f);
            }
        }
    }

    sub_08013AEC();
}
