#include "global.h"
#include "hardware.h"

/* sub_08005F4C @ 0x08005F4C, 5084 bytes.
 *
 * Two-level state-machine dispatcher: six switches on
 * gUnknown_0200B0B0->unk02 run one after another, the last two through jump
 * tables (0x46..0x5B and 0x28..0x30).
 *
 * gUnknown_0808D7D8/DC/E0/E4 in the disassembly are NOT globals: they are
 * agbcc -fforce-addr address constants holding &gUnknown_0200B0B0, &gpKeySt,
 * &gSinLut and &gUnknown_084886DC respectively.  Naming the real symbol
 * reproduces the double load.
 *
 * NOT MATCHED YET.  Configured measurement (Wave 74): target 5084 bytes,
 * candidate 5116 (+32), 3598 differing bytes / 29.2% identical, first byte
 * difference +0xF8.  That first byte is a branch-displacement consequence;
 * the first substantive mismatch is the case-4 allocation around +0x1A4.
 *
 * THE ONE REGION is the `i = unk07 == 0 ? unk3a + 4 : unk3a + 3;` below,
 * marked with a comment.  The ROM emits it (12 instructions, `_08006326`) even
 * though r5 is never read again on any path.  The identical `q` assignments
 * below are deliberate: `flow` sees the branch on `i`, then `jump` merges the
 * identical arms without rerunning dead-code elimination.  This retains the
 * ROM block with no emitted consumer of `i`.  See the OPEN section "agbcc KEPT
 * A PROVABLY DEAD CONDITIONAL ASSIGNMENT" in docs/agbcc-codegen.md.
 *
 * Wave 74 block-scoped the pointer temporaries in the final 0x28..0x30 switch.
 * This fixes the frame (`sub sp,#20`), the [sp,#16] caller-save spill around
 * sub_0800C7E8, and the entry address register (`sl`).  Binding the case-2
 * element before incrementing i also makes that loop exact.  The remaining
 * case-4 pair is ROM `mov ip,r2; mov r9,r6`, candidate `mov r9,r2;
 * adds r7,r6,#0`; downstream final-switch address/register placement still
 * differs.  See NOTES.md for tested regressions.
 */

void sub_08005F4C(void)
{
    struct Unk0200B0D0 *e;
    struct Unk0200B0D0 *e2;
    int n;
    int m;
    int i;
    int j;
    int k;
    int c;
    int d;
    int sc;
    int v;
    int f;
    int q;
    register int retained asm("r5");

    if (gUnknown_0200B0B0->unk06 != 0)
    {
        gUnknown_0200B0B0->unk00 |= 0x40;
        gUnknown_0200B0B0->unk06 = 0;
        gUnknown_0200B0B0->unk02 = 0;
        gUnknown_0200B0B0->unk54 = 0;
        gUnknown_0200B0B0->unk3a = 0;
        gUnknown_0200B0B0->unk00 &= 0xFFDF;
        gUnknown_0200B0B0->unk00 &= 0xFFFC;
        sub_080078E4(gUnknown_0200B0B0->unk07,
            gUnknown_0200B0B0->unk07 == 0
                ? gUnknown_0200B0B0->unk2e
                : gUnknown_0200B0B0->unk2f);
        sub_08002DEC();
        sub_08003A80(0, 0xF0, 0xA0, 0xA0);
        gUnknown_030030E0.bits.target1_enable_bg1 = 1;
        gUnknown_030030E0.bits.target1_enable_bg3 = 1;
        gUnknown_030030E0.bits.target1_enable_obj = 1;
        gUnknown_030030E0.bits.target2_enable_bg1 = 1;
        gUnknown_030030E0.bits.target2_enable_bg3 = 1;
        gUnknown_030030E0.bits.target2_enable_obj = 1;
        gUnknown_03001FFC = 8;
        gUnknown_03002020 = 0x10;
        gUnknown_03002B28 = 0;
    }

    if (gUnknown_0200B0B0->unk07 == 0)
    {
        n = 10;
        m = 9;
    }
    else
    {
        n = 8;
        m = 7;
    }

    switch (gUnknown_0200B0B0->unk02)
    {
    case 0:
        gUnknown_0200B0B0->unk02 = 2;
        gUnknown_0200B0B0->unk00 |= 0x40;
        sub_080073F8(gUnknown_0200B0B0->unk07, -1);
        sub_08001D9C();
        sub_08003948();
        sub_0803B4DC(0x65);
        sub_08007354();
        break;

    case 2:
        gUnknown_03002EFC -= 8;
        if (gUnknown_03002EFC <= 0x77)
        {
            gUnknown_03002EFC = 0x78;
            gUnknown_0200B0B0->unk02 = 4;
            sub_08007328();
            i = gUnknown_0200B0B0->unk3a;
            for (j = 0; j < m; j++)
            {
                e = &gUnknown_0200B0D0[i];
                i++;
                e->unk00 |= 9;
                e->unk00 &= ~0x30;
                if (i >= n)
                    i -= n;
            }
        }
        break;

    case 4:
        k = 0;
        i = gUnknown_0200B0B0->unk3a;
        for (j = 0; j < m; j++)
        {
            e = &gUnknown_0200B0D0[i];
            e->unk10 -= 0x300;
            if ((e->unk10 >> 8) <= 0x6F)
                e->unk10 = 0x7000;
            d = e->unk08 - (e->unk0c >> 8);
            if (d < 0)
            {
                e->unk14 -= 0x200;
                e->unk0c += e->unk14;
                if ((e->unk0c >> 8) <= e->unk08)
                    e->unk0c = e->unk08 << 8;
            }
            else if (d > 0)
            {
                e->unk14 += 0x200;
                e->unk0c += e->unk14;
                if ((e->unk0c >> 8) >= e->unk08)
                    e->unk0c = e->unk08 << 8;
            }
            else
            {
                k++;
                if (k >= m)
                    gUnknown_0200B0B0->unk02 = 0x32;
            }
            i++;
            if (i >= n)
                i -= n;
        }
        break;

    case 0x32:
        e = &gUnknown_0200B0D0[sub_08007328()];
        e->unk0c = gUnknown_084886F8[gUnknown_0200B0B0->unk07]
            [gUnknown_0200B0B0->unk07 == 0 ? 9 : 7] << 8;
        gUnknown_0200B0B0->unk00 |= 0x10;
        gUnknown_0200B0B0->unk02 = 0x33;
        if (gUnknown_0200B0B0->unk07 == 0)
            sub_08002DEC();
        /* fallthrough */
    case 0x33:
        if (gpKeySt->held & 4)
        {
            gUnknown_0200B0B0->unk02 =
                gUnknown_0200B0B0->unk07 == 0 ? 0x5A : 0x50;
        }
        else if (gpKeySt->held & 0x200)
        {
            if (gUnknown_0200B0B0->unk07 == 0)
                gUnknown_0200B0B0->unk02 = 0x5A;
        }
        else if (gpKeySt->held & 0x100)
        {
            if (gUnknown_0200B0B0->unk07 == 1)
                gUnknown_0200B0B0->unk02 = 0x50;
        }
        else
        {
            if (gpKeySt->unk00 & 0x10)
            {
                gUnknown_0200B0B0->unk02 = 0x34;
                i = m;
                if (gUnknown_0200B0B0->unk07 == 0)
                {
                    i += gUnknown_0200B0B0->unk36;
                    if (i > 0x10)
                        i -= 0x11;
                }
                else
                {
                    i += gUnknown_0200B0B0->unk38;
                    if (i > 0x13)
                        i -= 0x14;
                }
                j = sub_08007328();
                gUnknown_0200B0D0[j].unk04 = gUnknown_0200B224[i].unk00;
                gUnknown_0200B0D0[j].unk06 = j;
                gUnknown_0200B0D0[j].unk00 |= 9;
                sub_0803B4DC(0x64);
            }
            else if (gpKeySt->unk00 & 0x20)
            {
                gUnknown_0200B0B0->unk02 = 0x35;
                if (gUnknown_0200B0B0->unk07 == 0)
                {
                    i = gUnknown_0200B0B0->unk36 - 1;
                    if (i < 0)
                        i += 0x11;
                }
                else
                {
                    i = gUnknown_0200B0B0->unk38 - 1;
                    if (i < 0)
                        i += 0x14;
                }
                j = sub_08007328();
                gUnknown_0200B0D0[j].unk04 = gUnknown_0200B224[i].unk00;
                gUnknown_0200B0D0[j].unk06 = j;
                gUnknown_0200B0D0[j].unk00 |= 9;
                sub_0803B4DC(0x64);
            }

            /* The identical q definitions are a zero-instruction use of the
             * retained conditional result:
             * jump merging removes the selection after flow has retained the
             * producer.  Do not fold them back into the following test. */
            if (gUnknown_0200B0B0->unk07 == 0)
                retained = gUnknown_0200B0B0->unk3a + 4;
            else
                retained = gUnknown_0200B0B0->unk3a + 3;

            if (retained)
                q = gpKeySt->unk02 | gpKeySt->held;
            else
                q = gpKeySt->unk02 | gpKeySt->held;

            if (q & 0xC0)
            {
                gUnknown_0200B0B0->unk02 = 0x28;
            }
            else if (gpKeySt->held & 1)
            {
                gUnknown_0200B0B0->unk00 &= 0xFFDF;
                gUnknown_0200B0B0->unk02 = 0x3C;
            }
            else if (gpKeySt->held & 2)
            {
                gUnknown_0200B0B0->unk00 |= 0x20;
                gUnknown_0200B0B0->unk02 = 0x3C;
            }
        }
        break;
    }

    switch (gUnknown_0200B0B0->unk02)
    {
    case 0x34:
        j = sub_08007328();
        e = &gUnknown_0200B0D0[j];
        e->unk08 = gUnknown_084886F8[gUnknown_0200B0B0->unk07]
            [gUnknown_0200B0B0->unk07 == 0 ? 9 : 7];
        e->unk0c = e->unk08 << 8;
        e->unk10 = 0x7000;
        i = gUnknown_0200B0B0->unk3a;
        for (j = 0; j < n; j++)
        {
            e2 = &gUnknown_0200B0D0[i];
            e2->unk08 += (s8)gUnknown_08488748[gUnknown_0200B0B0->unk07][j];
            e2->unk14 = 0;
            i++;
            if (i >= n)
                i -= n;
        }
        gUnknown_0200B0B0->unk02 = 0x36;
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            gUnknown_0200B0B0->unk36++;
            if (gUnknown_0200B0B0->unk36 > 0x10)
                gUnknown_0200B0B0->unk36 -= 0x11;
        }
        else
        {
            gUnknown_0200B0B0->unk38++;
            if (gUnknown_0200B0B0->unk38 > 0x13)
                gUnknown_0200B0B0->unk38 -= 0x14;
        }
        break;

    case 0x35:
        j = sub_08007328();
        e = &gUnknown_0200B0D0[j];
        v = gUnknown_084886F8[gUnknown_0200B0B0->unk07][0];
        if (gUnknown_0200B0B0->unk07 == 0)
            e->unk08 = v - 0x18;
        else
            e->unk08 = v - 0x21;
        e->unk0c = e->unk08 << 8;
        e->unk10 = 0x7000;
        i = gUnknown_0200B0B0->unk3a;
        for (j = 0; j < n; j++)
        {
            e2 = &gUnknown_0200B0D0[i];
            e2->unk08 += gUnknown_0848875C[gUnknown_0200B0B0->unk07][j];
            e2->unk14 = 0;
            i++;
            if (i >= n)
                i -= n;
        }
        gUnknown_0200B0B0->unk02 = 0x37;
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            gUnknown_0200B0B0->unk36--;
            if (gUnknown_0200B0B0->unk36 < 0)
                gUnknown_0200B0B0->unk36 += 0x11;
        }
        else
        {
            gUnknown_0200B0B0->unk38--;
            if (gUnknown_0200B0B0->unk38 < 0)
                gUnknown_0200B0B0->unk38 += 0x14;
        }
        break;
    }

    switch (gUnknown_0200B0B0->unk02)
    {
    case 0x36:
    case 0x37:
        k = 0;
        i = gUnknown_0200B0B0->unk3a;
        for (j = 0; j < n; j++)
        {
            e = &gUnknown_0200B0D0[i];
            d = e->unk08 - (e->unk0c >> 8);
            if (d < 0)
            {
                e->unk14 += (-0x600 - e->unk14) >> 2;
                if (e->unk14 <= -0x480)
                    e->unk14 = -0x480;
                e->unk0c += e->unk14;
                if ((e->unk0c >> 8) <= e->unk08)
                    e->unk0c = e->unk08 << 8;
            }
            else if (d > 0)
            {
                e->unk14 += (0x600 - e->unk14) >> 2;
                if (e->unk14 > 0x47F)
                    e->unk14 = 0x480;
                e->unk0c += e->unk14;
                if ((e->unk0c >> 8) >= e->unk08)
                    e->unk0c = e->unk08 << 8;
            }
            else
            {
                k++;
                if (k >= n)
                {
                    if (gUnknown_0200B0B0->unk02 == 0x36)
                    {
                        gUnknown_0200B0B0->unk3a++;
                        if (gUnknown_0200B0B0->unk3a > m)
                            gUnknown_0200B0B0->unk3a = 0;
                    }
                    if (gUnknown_0200B0B0->unk02 == 0x37)
                    {
                        gUnknown_0200B0B0->unk3a--;
                        if (gUnknown_0200B0B0->unk3a < 0)
                            gUnknown_0200B0B0->unk3a = m;
                    }
                    gUnknown_0200B0B0->unk02 = 0x32;
                }
            }
            i++;
            if (i >= n)
                i -= n;
        }
        break;

    case 0x3C:
        sub_0803B4DC((gUnknown_0200B0B0->unk00 & 0x20) ? 0x66 : 0x65);
        e = gUnknown_0200B0D0;
        for (j = 0; j < n; j++)
        {
            e->unk00 &= ~1;
            e++;
        }
        gUnknown_0200B0B0->unk00 &= 0xFFEF;
        sub_08007B74();
        gUnknown_0200B0B0->unk0c = 0x1E;
        gUnknown_0200B0B0->unk02 = 0x41;
        gUnknown_0200B0B0->unk00 &= 0xFFBF;
        /* fallthrough */
    case 0x41:
        gUnknown_03002EFC += 6;
        if (gUnknown_03002EFC > 0x9F)
        {
            gUnknown_03002EFC = 0xA0;
            gUnknown_0200B0B0->unk02 = 0x46;
            sub_08001D8C();
            sub_08003934();
            f = gUnknown_0200B0B0->unk00;
            if (f & 0x20)
            {
                if (f & 1)
                {
                    gUnknown_0200B0B0->unk2a = gUnknown_0200B0B0->unk2c;
                    gUnknown_0200B0B0->unk36 = gUnknown_0200B0B0->unk37;
                    gUnknown_0200B0B0->unk2e = gUnknown_0200B0B0->unk30;
                }
                if (gUnknown_0200B0B0->unk00 & 2)
                {
                    gUnknown_0200B0B0->unk24 = gUnknown_0200B0B0->unk26;
                    gUnknown_0200B0B0->unk38 = gUnknown_0200B0B0->unk39;
                    gUnknown_0200B0B0->unk2f = gUnknown_0200B0B0->unk31;
                }
            }
            else if (gUnknown_0200B0B0->unk07 == 0)
            {
                i = gUnknown_0200B0B0->unk3a + 4;
                if (i > 9)
                    i = gUnknown_0200B0B0->unk3a - 6;
                gUnknown_0200B0B0->unk2a = gUnknown_0200B0D0[i].unk04;
                if (f & 2)
                {
                    gUnknown_0200B0B0->unk24 = gUnknown_0200B0B0->unk26;
                    gUnknown_0200B0B0->unk38 = gUnknown_0200B0B0->unk39;
                    gUnknown_0200B0B0->unk2f = gUnknown_0200B0B0->unk31;
                }
            }
            else
            {
                i = gUnknown_0200B0B0->unk3a + 3;
                if (i > 7)
                    i = gUnknown_0200B0B0->unk3a - 5;
                v = gUnknown_0200B0D0[i].unk04;
                if (v != 0x19)
                    v = (v & 0x3F) | ((gUnknown_0200B0B0->unk2f - 1) << 6);
                gUnknown_0200B0B0->unk24 = v;
                if (gUnknown_0200B0B0->unk00 & 1)
                {
                    gUnknown_0200B0B0->unk2a = gUnknown_0200B0B0->unk2c;
                    gUnknown_0200B0B0->unk36 = gUnknown_0200B0B0->unk37;
                    gUnknown_0200B0B0->unk2e = gUnknown_0200B0B0->unk30;
                }
            }
            sub_08002E3C();
        }
        break;
    }

    switch (gUnknown_0200B0B0->unk02)
    {
    case 0x46:
        if (gUnknown_0200B0B0->unk50 <= 0x6A)
            sub_0800056C(1);
        break;

    case 0x50:
        sub_08007B74();
        gUnknown_0200B0B0->unk3a = 0;
        e = gUnknown_0200B0D0;
        for (j = 0; j < 10; j++)
        {
            e->unk00 |= 0x30;
            e++;
        }
        gUnknown_0200B0B0->unk56 = 0x100;
        gUnknown_0200B0B0->unk02++;
        break;

    case 0x51:
        sc = gUnknown_0200B0B0->unk56 - 0x40;
        if (sc <= 0xF)
            sc = 0x10;
        gUnknown_0200B0B0->unk56 = sc;
        SetObjAffine(0,
            Div(gSinLut[0x40] * 16, 0x100),
            Div(-gSinLut[0] * 16, sc != 0 ? sc : 2),
            Div(gSinLut[0] * 16, 0x100),
            Div(gSinLut[0x40] * 16, sc != 0 ? sc : 2));
        if (sc <= 0x10)
        {
            e = gUnknown_0200B0D0;
            for (j = 0; j < 10; j++)
            {
                e->unk00 &= ~0x31;
                e++;
            }
            gUnknown_0200B0B0->unk02 = 0x64;
            gUnknown_0200B0B0->unk07 = 0;
        }
        break;

    case 0x5A:
        sub_08007B74();
        gUnknown_0200B0B0->unk3a = 0;
        e = gUnknown_0200B0D0;
        for (j = 0; j < 10; j++)
        {
            e->unk00 |= 0x30;
            e++;
        }
        gUnknown_0200B0B0->unk56 = 0x100;
        gUnknown_0200B0B0->unk02++;
        break;

    case 0x5B:
        sc = gUnknown_0200B0B0->unk56 - 0x40;
        if (sc <= 0xF)
            sc = 0x10;
        gUnknown_0200B0B0->unk56 = sc;
        SetObjAffine(0,
            Div(gSinLut[0x40] * 16, 0x100),
            Div(-gSinLut[0] * 16, sc != 0 ? sc : 2),
            Div(gSinLut[0] * 16, 0x100),
            Div(gSinLut[0x40] * 16, sc != 0 ? sc : 2));
        if (sc <= 0x10)
        {
            e = gUnknown_0200B0D0;
            for (j = 0; j < 10; j++)
            {
                e->unk00 &= ~0x31;
                e++;
            }
            gUnknown_0200B0B0->unk02 = 0x64;
            gUnknown_0200B0B0->unk07 = 1;
        }
        break;
    }

    switch (gUnknown_0200B0B0->unk02)
    {
    case 0x64:
        sub_080078E4(gUnknown_0200B0B0->unk07,
            gUnknown_0200B0B0->unk07 == 0
                ? gUnknown_0200B0B0->unk2e
                : gUnknown_0200B0B0->unk2f);
        sub_080073F8(gUnknown_0200B0B0->unk07, -1);
        sub_08007354();
        sub_08002DEC();
        gUnknown_0200B0B0->unk02++;
        gUnknown_0200B0B0->unk0c = 0xA;
        break;

    case 0x65:
        if (gUnknown_0200B0B0->unk0c-- <= 0)
            gUnknown_0200B0B0->unk02++;
        break;

    case 0x66:
        sub_0803B4DC(0x65);
        gUnknown_0200B0B0->unk02 = 4;
        sub_080078E4(gUnknown_0200B0B0->unk07,
            gUnknown_0200B0B0->unk07 == 0
                ? gUnknown_0200B0B0->unk2e
                : gUnknown_0200B0B0->unk2f);
        sub_08007328();
        i = gUnknown_0200B0B0->unk3a;
        for (j = 0; j < n - 1; j++)
        {
            gUnknown_0200B0D0[i].unk00 |= 1;
            gUnknown_0200B0D0[i].unk00 &= ~0x30;
            i++;
            if (i >= n)
                i -= n;
        }
        break;
    }

    switch (gUnknown_0200B0B0->unk02)
    {
    case 0x28:
    {
        struct Unk0200B0D0 *e;
        struct Unk0200B0D0 *e2;

        if (gUnknown_0200B0B0->unk07 == 0)
        {
            i = gUnknown_0200B0B0->unk3a + 4;
            if (i > 9)
                i = gUnknown_0200B0B0->unk3a - 6;
            e = &gUnknown_0200B0D0[i];
            if (sub_0800C7E8(e->unk04) == 0 || e->unk04 == 0x10
                || e->unk04 == 0x11)
            {
                gUnknown_0200B0B0->unk02 = 0x33;
                break;
            }
            c = gUnknown_0200B0B0->unk2e;
            if (gpKeySt->unk02 & 0x40)
            {
                c++;
                if (c > 4)
                    c = 0;
                sub_0803B4DC(0x64);
            }
            else if (gpKeySt->unk02 & 0x80)
            {
                c--;
                if (c < 0)
                    c = 4;
                sub_0803B4DC(0x64);
            }
            gUnknown_0200B0B0->unk32 = c;
            e2 = gUnknown_0200B0D0;
            for (j = 0; j < 10; j++)
            {
                if (sub_0800C7E8(e2->unk04) != 0 && e2->unk04 != 0x10
                    && e2->unk04 != 0x11)
                    e2->unk00 |= 0x10;
                e2++;
            }
        }
        else
        {
            i = gUnknown_0200B0B0->unk3a + 3;
            if (i > 7)
                i = gUnknown_0200B0B0->unk3a - 5;
            if (gUnknown_0200B0D0[i].unk04 == 0x19)
            {
                gUnknown_0200B0B0->unk02 = 0x33;
                break;
            }
            c = gUnknown_0200B0B0->unk2f;
            if (gpKeySt->unk02 & 0x40)
            {
                c++;
                if (c > 4)
                    c = 1;
                sub_0803B4DC(0x64);
            }
            else if (gpKeySt->unk02 & 0x80)
            {
                c--;
                if (c <= 0)
                    c = 4;
                sub_0803B4DC(0x64);
            }
            gUnknown_0200B0B0->unk32 = c;
            e2 = gUnknown_0200B0D0;
            for (j = 0; j < 10; j++)
            {
                if (e2->unk04 != 0x19)
                    e2->unk00 |= 0x10;
                e2++;
            }
        }
        gUnknown_0200B0B0->unk33 = 0;
        gUnknown_0200B0B0->unk56 = gUnknown_084886DC[gUnknown_0200B0B0->unk33++];
        SetObjAffine(0,
            Div(gSinLut[0x40] * 16, 0x100),
            Div(-gSinLut[0] * 16, 0x100),
            Div(gSinLut[0] * 16, 0x100),
            Div(gSinLut[0x40] * 16, 0x100));
        gUnknown_0200B0B0->unk02 = 0x2A;
        break;
    }

    case 0x2A:
    {
        struct Unk0200B0D0 *e;

        sc = gUnknown_084886DC[gUnknown_0200B0B0->unk33++];
        gUnknown_0200B0B0->unk56 = sc;
        if (sc == 0)
        {
            gUnknown_0200B0B0->unk02++;
            if (gUnknown_0200B0B0->unk07 == 0)
            {
                e = gUnknown_0200B0D0;
                for (j = 0; j < 10; j++)
                {
                    if (sub_0800C7E8(e->unk04) != 0 && e->unk04 != 0x10
                        && e->unk04 != 0x11)
                        e->unk00 |= 0x40;
                    e++;
                }
            }
            else
            {
                e = gUnknown_0200B0D0;
                for (j = 0; j < 10; j++)
                {
                    if (e->unk04 != 0x19)
                        e->unk00 |= 0x40;
                    e++;
                }
            }
        }
        else
        {
            if (gUnknown_0200B0B0->unk07 == 0)
            {
                e = gUnknown_0200B0D0;
                for (j = 0; j < 10; j++)
                {
                    if (sub_0800C7E8(e->unk04) != 0 && e->unk04 != 0x10
                        && e->unk04 != 0x11)
                        e->unk00 &= ~0x40;
                    e++;
                }
            }
            else
            {
                e = gUnknown_0200B0D0;
                for (j = 0; j < 10; j++)
                {
                    if (e->unk04 != 0x19)
                        e->unk00 &= ~0x40;
                    e++;
                }
            }
        }
        gUnknown_0200B0B0->unk56 = sc;
        if (sc == 0)
            break;
        SetObjAffine(0,
            Div(gSinLut[0x40] * 16, sc),
            Div(-gSinLut[0] * 16, 0x100),
            Div(gSinLut[0] * 16, sc),
            Div(gSinLut[0x40] * 16, 0x100));
        break;
    }

    case 0x2B:
    {
        struct Unk0200B0D0 *e;

        sc = gUnknown_084886DC[gUnknown_0200B0B0->unk33++];
        gUnknown_0200B0B0->unk56 = sc;
        if (sc == 0)
            break;
        gUnknown_0200B0B0->unk02++;
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            e = gUnknown_0200B0D0;
            for (j = 0; j < 10; j++)
            {
                if (sub_0800C7E8(e->unk04) != 0 && e->unk04 != 0x10
                    && e->unk04 != 0x11)
                    e->unk00 &= ~0x40;
                e++;
            }
        }
        else
        {
            e = gUnknown_0200B0D0;
            for (j = 0; j < 10; j++)
            {
                if (e->unk04 != 0x19)
                    e->unk00 &= ~0x40;
                e++;
            }
        }
        gUnknown_0200B0B0->unk56 = sc;
        SetObjAffine(0,
            Div(gSinLut[0x40] * 16, sc != 0 ? sc : 2),
            Div(-gSinLut[0] * 16, 0x100),
            Div(gSinLut[0] * 16, sc != 0 ? sc : 2),
            Div(gSinLut[0x40] * 16, 0x100));
        break;
    }

    case 0x2C:
    {
        struct Unk0200B0D0 *e;
        struct Unk0200B0D0 *e2;

        sc = gUnknown_084886DC[gUnknown_0200B0B0->unk33++];
        gUnknown_0200B0B0->unk56 = sc;
        if (sc == -1)
        {
            gUnknown_0200B0B0->unk02++;
            sc = 0x100;
        }
        if (sc >= 0)
        {
            gUnknown_0200B0B0->unk02++;
            if (gUnknown_0200B0B0->unk07 == 0)
            {
                i = gUnknown_0200B0B0->unk3a + 4;
                if (i > 9)
                    i = gUnknown_0200B0B0->unk3a - 6;
                sub_080077EC(gUnknown_0200B0D0[i].unk04,
                    gUnknown_0200B0B0->unk32);
                sub_08007B74();
            }
            else
            {
                sub_080078D4(gUnknown_0200B0B0->unk32);
                sub_08007B74();
            }
            if (sc == 0)
            {
                if (gUnknown_0200B0B0->unk07 == 0)
                {
                    e = gUnknown_0200B0D0;
                    for (j = 0; j < 10; j++)
                    {
                        if (sub_0800C7E8(e->unk04) != 0 && e->unk04 != 0x10
                            && e->unk04 != 0x11)
                            e->unk00 |= 0x40;
                        e++;
                    }
                }
                else
                {
                    e = gUnknown_0200B0D0;
                    for (j = 0; j < 10; j++)
                    {
                        if (e->unk04 != 0x19)
                            e->unk00 |= 0x40;
                        e++;
                    }
                }
                gUnknown_0200B0B0->unk56 = sc;
                SetObjAffine(0,
                    Div(gSinLut[0x40] * 16, sc != 0 ? sc : 2),
                    Div(-gSinLut[0] * 16, 0x100),
                    Div(gSinLut[0] * 16, sc != 0 ? sc : 2),
                    Div(gSinLut[0x40] * 16, 0x100));
                break;
            }
        }
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            i = gUnknown_0200B0B0->unk3a;
            e = &gUnknown_0200B0D0[i];
            e2 = gUnknown_0200B0D0;
            for (j = 0; j < 10; j++)
            {
                if (sub_0800C7E8(e->unk04) != 0 && e->unk04 != 0x10
                    && e2->unk04 != 0x11)
                {
                    e->unk00 &= ~0x40;
                    e->unk00 |= 8;
                }
                e++;
                i++;
                if (i > m)
                {
                    e = gUnknown_0200B0D0;
                    i = 0;
                }
                e2++;
            }
        }
        else
        {
            i = gUnknown_0200B0B0->unk3a;
            e = &gUnknown_0200B0D0[i];
            for (j = 0; j < 10; j++)
            {
                v = e->unk04;
                if (v != 0x19)
                {
                    e->unk00 &= ~0x40;
                    if ((u16)((v & 0x3F) - 1) <= 1)
                        e->unk00 |= 8;
                }
                e++;
                i++;
                if (i > m)
                {
                    e = gUnknown_0200B0D0;
                    i = 0;
                }
            }
        }
        gUnknown_0200B0B0->unk56 = sc;
        SetObjAffine(0,
            Div(gSinLut[0x40] * 16, sc != 0 ? sc : 2),
            Div(-gSinLut[0] * 16, 0x100),
            Div(gSinLut[0] * 16, sc != 0 ? sc : 2),
            Div(gSinLut[0x40] * 16, 0x100));
        break;
    }

    case 0x2D:
    {
        struct Unk0200B0D0 *e;
        struct Unk0200B0D0 *e2;

        gUnknown_0200B0B0->unk02++;
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            i = gUnknown_0200B0B0->unk3a;
            e = &gUnknown_0200B0D0[i];
            e2 = gUnknown_0200B0D0;
            for (j = 0; j < 10; j++)
            {
                if (sub_0800C7E8(e->unk04) != 0 && e->unk04 != 0x10
                    && e2->unk04 != 0x11)
                {
                    e->unk00 &= ~0x40;
                    e->unk00 |= 8;
                }
                e++;
                i++;
                if (i > m)
                {
                    e = gUnknown_0200B0D0;
                    i = 0;
                }
                e2++;
            }
        }
        else
        {
            i = gUnknown_0200B0B0->unk3a;
            e = &gUnknown_0200B0D0[i];
            for (j = 0; j < 10; j++)
            {
                v = e->unk04;
                if (v != 0x19)
                {
                    e->unk00 &= ~0x40;
                    if ((u16)((v & 0x3F) - 1) <= 1)
                        e->unk00 |= 8;
                }
                e++;
                i++;
                if (i > m)
                {
                    e = gUnknown_0200B0D0;
                    i = 0;
                }
            }
        }
        /* fallthrough */
    }
    case 0x2E:
        gUnknown_0200B0B0->unk33++;
        sc = gUnknown_084886DC[gUnknown_0200B0B0->unk33];
        if (sc == -1)
        {
            sc = 0x100;
            gUnknown_0200B0B0->unk02 = 0x30;
            gUnknown_0200B0B0->unk0c = 2;
        }
        gUnknown_0200B0B0->unk56 = sc;
        SetObjAffine(0,
            Div(gSinLut[0x40] * 16, sc != 0 ? sc : 2),
            Div(-gSinLut[0] * 16, 0x100),
            Div(gSinLut[0] * 16, sc != 0 ? sc : 2),
            Div(gSinLut[0x40] * 16, 0x100));
        break;

    case 0x30:
    {
        struct Unk0200B0D0 *e;

        if (gUnknown_0200B0B0->unk0c-- <= 0)
        {
            e = gUnknown_0200B0D0;
            for (j = 0; j < 10; j++)
            {
                e->unk00 &= ~0x70;
                e++;
            }
            gUnknown_0200B0B0->unk02 = 0x33;
        }
        break;
    }
    }
}
























