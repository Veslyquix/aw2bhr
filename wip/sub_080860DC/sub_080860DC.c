#include "global.h"
#include "hardware.h"
#include "proc.h"

/* Wave 74 active best: 98.8%, SIZE EXACT (1452/1452), 18 differing bytes.
 * A legal live-range split in the second 0x110 arm improved the inherited
 * 98.7% / 19-byte draft by one byte. The remaining differences are TWO
 * things, neither of them a decompilation error:
 *
 *  (a) the five -fforce-addr pool words. The ROM names them gUnknown_081D9410
 *      /9414/9418/941C/9420; this unit emits its own .rodata block holding the
 *      SAME five addresses IN THE SAME ORDER (+0 &gpKeySt, +4 &gUnknown_02027F74,
 *      +8 &gUnknown_03005980, +0xc &gUnknown_03005990, +0x10 &gUnknown_0300596C,
 *      all dereferenced out of baserom.gba). That is the honest spelling the
 *      brief asks for and promote.py carves it out of data/rodata.s.
 *  (b) ONE six-instruction window, duplicated in the two 0x220/0x110 arms:
 *          ROM   ldrb r3,[r0]; str r3,[r5,#0x5c]; ... ldrb r1,[r0] ...
 *                cmp r0,r1; strh r1,[r2]; ... adds r0,r3,r0
 *          here  the same instructions with r1 for the array byte and r4 for
 *                gUnknown_02027F74.unk37
 *      Pure register allocation: in the ROM the array byte wins r3, the first
 *      register in REG_ALLOC_ORDER, and unk37 gets r1. The first arm still
 *      gives the byte r1 and unk37 r4. The added second-arm live-range split
 *      gives the byte r3 but still leaves unk37 in r4 and reloads the clamped
 *      value through r1 for the final add.
 *
 * RULED OUT for (b): binding the byte or limit through existing int locals,
 * reversing the comparison/final add, pointer aliases, volatile loads, and
 * comma/statement forms. A Wave 74 current-basin run found the one-byte legal
 * improvement; a chained 3,344-iteration run from it found nothing better.
 *
 * WHAT THE PERMUTER DID WIN, and both are load-bearing: `w = 0xFFFF;` before
 * `*(u16 *)&p->unk4e = w;` (without the int local the constant lands in a
 * callee-saved register and needs a copy into r0), and, earlier by hand, the
 * duplicated `size = 2` tails at the end of the first two arms.
 *
 * THREE THINGS THIS FUNCTION SETTLED, all of them worth reading before the
 * next attempt:
 *  - `sub_08087298() + p->unk4e * 0x100` and `... + (p->unk4e << 8)` are
 *    DIFFERENT CODE and this is the difference between 24% and 98%. The store
 *    is to a u16, so combine narrows the shift form's `sign_extend(mem:HI)` to
 *    a zero_extend and emits `ldrh`; `shorten_binary_op` fires on MULT_EXPR
 *    instead and keeps the signed HImode operand, i.e. `ldrsh`. This is the
 *    project's existing "`g * 0x100` is not `g << 8` for a narrow global" rule
 *    showing up on a narrow STRUCT MEMBER and a narrow DESTINATION.
 *    Routing the sum through an `int` local also restores the `ldrsh` but adds
 *    an `lsls #16; lsrs #16` truncation at the store and moves the destination
 *    address load below the `bl` -- +8 bytes. Measured, all three.
 *  - `p->unk4e = -1` does not reproduce `ldr r0,=0xFFFF`; `*(u16 *)&p->unk4e`
 *    does, and BOTH arms have to use that same spelling or the shared `strh`
 *    at the merge point does not cross-jump.
 *  - the shared tail (`size = 2; sub_080876B4(); sub_0803B4DC(0x67)`) must be
 *    WRITTEN OUT at the end of both arms, not left as one copy after the
 *    if-chain: as a trailing statement it lands after every other arm instead
 *    of immediately after arm 2, which is also what stops the last two arms'
 *    tails from cross-jumping (the ROM does not merge them -- the last arm
 *    falls through to the epilogue and so has no jump for cross_jump to pair).
 */

struct Unk80860DCProc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ int unk2c;
    /* 0x30 */ int unk30;
    /* 0x34 */ u8 filler_34[0x18];
    /* 0x4c */ s16 unk4c;
    /* 0x4e */ s16 unk4e;
    /* 0x50 */ u8 filler_50[0x02];
    /* 0x52 */ u16 unk52;
    /* 0x54 */ u8 filler_54[0x04];
    /* 0x58 */ int unk58;
    /* 0x5c */ int unk5c;
};

void sub_080860DC(ProcPtr procp)
{
    struct Unk80860DCProc *p = procp;
    u8 *q;
    int g;
    int w;

    if ((p->unk4e != 0 || p->unk52 != 0) && p->unk4c <= 7)
        return;

    if (p->unk2c <= 0x10)
        return;

    if (gpKeySt->unk02 & 0x40)
    {
        if (p->unk58 <= gUnknown_02027F74.unk36)
            return;

        p->unk58--;

        if (gUnknown_03003FC0.unk01 == 2)
        {
            sub_08087B60(p->unk58);

            if (gUnknown_03005930 > 1 || p->unk5c == 0)
                gUnknown_03005930--;
            else
            {
                p->unk5c--;
                p->unk30 = 1;
            }

            gUnknown_03005900 = p->unk5c;
        }
        else
        {
            if (gUnknown_03005980 > 1 || p->unk5c == 0)
                gUnknown_03005980--;
            else
            {
                p->unk5c--;
                p->unk30 = 1;
            }

            gUnknown_03005990[gUnknown_0300596C] = p->unk5c;
        }

        if (p->unk4e != 0 || p->unk52 != 0)
        {
            sub_08013C54();
            sub_08013AFC();
            gUnknown_03002F18 = sub_08087298() + p->unk4e * 0x100;
            p->unk4c = 8;
            p->unk52 = 0;
        }
        else
            p->unk4c = 0;

        w = 0xFFFF;
        *(u16 *)&p->unk4e = w;
        gUnknown_03001FE8.bits.size = 2;
        sub_080876B4();
        sub_0803B4DC(0x67);
        return;
    }
    else if (gpKeySt->unk02 & 0x80)
    {
        if (p->unk58 >= gUnknown_02027F74.unk37)
            return;

        p->unk58++;

        if (gUnknown_03003FC0.unk01 == 2)
        {
            sub_08087B60(p->unk58);

            if (gUnknown_03005930 < (g = gUnknown_03005928) - 2
                || p->unk5c == gUnknown_02027F74.unk37 - g + 1)
                gUnknown_03005930++;
            else
            {
                p->unk5c++;
                p->unk30 = 1;
            }

            gUnknown_03005900 = p->unk5c;
        }
        else
        {
            if (gUnknown_03005980 < (g = gUnknown_03005928) - 2
                || p->unk5c == gUnknown_02027F74.unk37 - g + 1)
                gUnknown_03005980++;
            else
            {
                p->unk5c++;
                p->unk30 = 1;
            }

            gUnknown_03005990[gUnknown_0300596C] = p->unk5c;
        }

        if (p->unk4e != 0 || p->unk52 != 0)
        {
            sub_08013C54();
            sub_08013AFC();
            gUnknown_03002F18 = sub_08087298() + p->unk4e * 0x100;
            p->unk4c = 8;
            p->unk52 = 0;
        }
        else
            p->unk4c = 0;

        *(u16 *)&p->unk4e = 1;
        gUnknown_03001FE8.bits.size = 2;
        sub_080876B4();
        sub_0803B4DC(0x67);
        return;
    }
    else if ((gpKeySt->held & 1) && p->unk4e == 0
             && Proc_Find(gUnknown_084892C4) == 0)
    {
        q = (u8 *)&gUnknown_02027F74;
        q += 4;

        if (!(u8)sub_0803CA54(q[p->unk58]))
            return;

        if (gUnknown_03003FC0.unk01 == 2)
            gUnknown_03005900 = p->unk5c;
        else
            gUnknown_03005990[gUnknown_0300596C] = p->unk5c;

        q = (u8 *)&gUnknown_02027F74;
        q += 4;
        sub_0803BCD0(q[p->unk58]);
        sub_0803BD54();
        sub_0803B4DC(0x71);
        sub_08037780();
        Proc_Start(gUnknown_08616CCC, p);
        p->unk4e = 1;
        p->unk4c = 0x1E;
        Proc_Break(p);
        return;
    }
    else if ((gpKeySt->held & 2) && Proc_Find(gUnknown_084892C4) == 0
             && Proc_Find(gUnknown_08616CCC) == 0)
    {
        sub_0803B4DC(0x66);
        sub_0803BD60();
        sub_08037780();
        Proc_Start(gUnknown_08616CCC, p);
        p->unk4e = 1;
        p->unk4c = 0x1E;
        Proc_Break(p);
        return;
    }
    else if (gUnknown_03003FC0.unk01 == 2)
    {
        if (!(gpKeySt->held & 0x100))
            return;

        gUnknown_0200C420.unk0c = 1 - gUnknown_0200C420.unk0c;

        if (gUnknown_0200C420.unk0c != 0)
            sub_0803B4DC(0x65);
        else
            sub_0803B4DC(0x66);

        sub_08087974(p->unk58, p);
        return;
    }
    else if (gpKeySt->held & 0x220)
    {
        gUnknown_03005990[gUnknown_0300596C] = p->unk5c;

        gUnknown_0300596C--;
        if (gUnknown_0300596C <= 1)
            gUnknown_0300596C = 8;

        while (!(u8)sub_08037448(gUnknown_0300596C))
        {
            gUnknown_0300596C--;
            if (gUnknown_0300596C <= 1)
                gUnknown_0300596C = 8;
        }

        p->unk5c = gUnknown_03005990[gUnknown_0300596C];

        if (gUnknown_03005980 > gUnknown_02027F74.unk37)
            gUnknown_03005980 = gUnknown_02027F74.unk37;

        p->unk58 = p->unk5c + gUnknown_03005980;

        if (p->unk4e != 0 || p->unk52 != 0)
        {
            sub_08013C54();
            sub_08013AFC();
            gUnknown_03002B34 = sub_08087248() + (p->unk52 << 8);
            p->unk4c = 8;
            p->unk4e = 0;
        }
        else
            p->unk4c = 0;

        p->unk2c = 0;
        p->unk52 = 0xFFFF;
        gUnknown_03001FE8.bits.size = 1;
        sub_080876B4();
        sub_0803B4DC(0x76);
        return;
    }
    else if (gpKeySt->held & 0x110)
    {
        gUnknown_03005990[gUnknown_0300596C] = p->unk5c;

        gUnknown_0300596C++;
        if (gUnknown_0300596C > 8)
            gUnknown_0300596C = 2;

        while (!(u8)sub_08037448(gUnknown_0300596C))
        {
            gUnknown_0300596C++;
            if (gUnknown_0300596C > 8)
                gUnknown_0300596C = 2;
        }

        p->unk5c = gUnknown_03005990[gUnknown_0300596C];

        if (gUnknown_03005980 > gUnknown_02027F74.unk37)
            gUnknown_03005980 = gUnknown_02027F74.unk37;

        p->unk58 = gUnknown_03005980;
        g = p->unk58;
        p->unk58 = p->unk5c + g;

        if (p->unk4e != 0 || p->unk52 != 0)
        {
            sub_08013C54();
            sub_08013AFC();
            gUnknown_03002B34 = sub_08087248() + (p->unk52 << 8);
            p->unk4c = 8;
            p->unk4e = 0;
        }
        else
            p->unk4c = 0;

        p->unk2c = 0;
        p->unk52 = 1;
        gUnknown_03001FE8.bits.size = 1;
        sub_080876B4();
        sub_0803B4DC(0x76);
    }
}






