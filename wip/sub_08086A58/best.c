#include "global.h"

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
 *  - the `f` flag is `(x != 0) ? 0 : 1` (agbcc presets the ELSE arm). */

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
