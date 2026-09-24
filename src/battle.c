#include "global.h"

struct Unk08024ABCBlk
{
    struct Unk08499594 unk00[64];
};
struct Unk08024ABCArg
{
    struct Unk08499594 *unk00;
    u8 filler_04[0x06];
    u16 unk0a;
    u8 filler_0c[0x04];
    u16 unk10;
    u8 filler_12[0x06];
    u16 unk18;
};

void CalcDamage(struct Unk08024ABCArg *a, struct Unk08024ABCArg *b, s16 c, u8 d)
{
    const struct Unk085D5ABC *t;
    u16 army;
    u32 v1;
    s16 v2;
    u32 v3;

    army = ((struct Unk08024ABCBlk *)a->unk00
            - (struct Unk08024ABCBlk *)gUnits) + 1;
    v3 = 0;
    v1 = 0;
    v2 = 0;
    t = &gUnknown_085D5ABC[a->unk00->unk00];

    if (c == 1)
    {
        v2 = sub_080433F8(a->unk00->unk00, b->unk00->unk00, 1);
        if (v2 != 0)
            v1 = (u16)sub_08043070(gPlayers[army].co,
                              gPlayers[army].coMode,
                              a->unk00->unk00, b->unk00->unk00, c);
        if (t->minRange == 1 && a->unk00->unk04_7 != 0)
        {
            if ((b->unk00->unk01 & 0x20) != 0)
                v3 = (u16)sub_08043070(gPlayers[army].co,
                                  gPlayers[army].coMode,
                                  a->unk00->unk00, 0x19, v3);
            else
                v3 = (u16)sub_08043070(gPlayers[army].co,
                                  gPlayers[army].coMode,
                                  a->unk00->unk00, b->unk00->unk00, v3);
        }
    }
    else if (t->minRange <= c && c <= GetUnitFiringRangeWithCoBonus(army, a->unk00->unk00)
             && a->unk00->unk04_7 != 0 && d == 1)
    {
        if ((b->unk00->unk01 & 0x20) != 0)
            v3 = (u16)sub_08043070(gPlayers[army].co,
                              gPlayers[army].coMode,
                              a->unk00->unk00, 0x19, v3);
        else
            v3 = (u16)sub_08043070(gPlayers[army].co,
                              gPlayers[army].coMode,
                              a->unk00->unk00, b->unk00->unk00, v3);
    }

    if (v3 <= v1)
    {
        if (v2 != 0)
        {
            a->unk18 = 5;
            a->unk10 = v1;
        }
    }
    else
    {
        a->unk18 = 1;
        a->unk10 = v3;
        a->unk0a--;
    }
}

asm(".global sub_08024ABC\n.thumb_set sub_08024ABC, CalcDamage\n");

void sub_08024C58(struct Unk030013D0 *a1, int a2, u8 a3)
{
    int idx;
    int x;
    int y;
    int acc;
    int hp;
    int r;
    int q;

    idx = (a1->unk00 - gUnits) >> 6;
    x = *(s16 *)((u8 *)&gPlayers[idx] + 0x62);
    y = *(s16 *)((u8 *)&gPlayers[idx] + 0x64);
    acc = 100;

    if (a1->unk00->unk04_0 != 0)
        hp = Div(a1->unk00->unk04_0 - 1, 10) + 1;
    else
        hp = 0;

    a1->unk06 = sub_08043304((struct Unk43304 *)a1);
    a1->unk0e = Div(hp * a1->unk06, 10);
    a1->unk0e = a1->unk0e
              + GetUnitDefenceWithCoBonus(((a1->unk00 - gUnits) >> 6) + 1, a1->unk00->unk00)
              + y;
    a1->unk0c = a1->unk10;

    if (a2 == 1)
        acc += sub_0804338C((struct Unk43304 *)a1);

    acc += sub_0804334C((struct Unk43304 *)a1);
    acc += x;

    a1->unk0c = Div(acc * a1->unk0c, 100);
    a1->unk14 = a1->unk0c;

    if (a1->unk0c != 0)
    {
        if (gPlaySt.campaignRelated == 0 || a3 != 0)
        {
            r = DivRem(GetNextRandomNumber(),
                       GetPlayerCoLuckBonus(((a1->unk00 - gUnits) >> 6) + 1));
            q = GetPlayerCoNegativeLuckBonus(((a1->unk00 - gUnits) >> 6) + 1);
            if (q != 0)
                q = DivRem(GetNextRandomNumber(), q);

            a1->unk0c = a1->unk0c + r - q;
            if (a1->unk0c < 0)
                a1->unk0c = 0;
        }
    }
}

void sub_08024DDC(struct Unk030013D0 *a1, struct Unk030013D0 *a2)
{
    int hp;

    if (a2->unk00->unk04_0 != 0)
        hp = Div(a2->unk00->unk04_0 - 1, 10) + 1;
    else
        hp = 0;

    a2->unk14 = Div((200 - a1->unk0e) * a2->unk14, 100);
    a2->unk14 = Div(hp * a2->unk14, 10);

    if (a2->unk14 > 998)
        a2->unk14 = 999;

    a1->unk12 = Div((200 - a1->unk0e) * a2->unk0c, 100);
    a1->unk08 = a1->unk00->unk04_0 - a1->unk12;
}

void sub_08024E60(struct Unk030013D0 *a1, struct Unk030013D0 *a2)
{
    int v;
    s16 hp;

    if (a1->unk00->unk04_0 != 0)
        v = a1->unk0c * (Div(a1->unk00->unk04_0 - 1, 10) + 1);
    else
        v = 0;

    a1->unk0c = Div(v, 10);

    sub_08024DDC(a2, a1);

    if (a2->unk08 >= 0)
        hp = a2->unk08;
    else
        hp = 0;

    if (hp != 0)
        v = a2->unk0c * (Div(hp - 1, 10) + 1);
    else
        v = 0;

    a2->unk0c = Div(v, 10);

    sub_08024DDC(a1, a2);
}

void sub_08024ED8(struct Unk030013D0 *a, struct Unk030013D0 *b)
{
    if (a->unk08 <= 0)
    {
        if (b->unk08 <= 0)
        {
            if (a->unk08 < b->unk08)
            {
                b->unk08 = 1;
                a->unk08 = 0;
            }
            else
            {
                a->unk08 = 1;
                b->unk08 = 0;
            }

            return;
        }

        if (a->unk08 < 0)
            a->unk08 = 0;
    }

    if (b->unk08 < 0)
        b->unk08 = 0;
}

void CalcBattleDamage(s16 a1, s16 a2, struct Unk802C57C *a3)
{
    u32 saved;
    int dx;
    int dy;
    int d;

    saved = gUnits[a1].unk02;
    gUnits[a1].unk02 = a3->unk00;
    saved |= gUnits[a1].unk03 << 16;
    gUnits[a1].unk03 = a3->unk02;

    sub_08024A2C((struct Unk030013D0 *)gUnknown_030013D0, a1);
    sub_08024A2C((struct Unk030013D0 *)gUnknown_030013B0, a2);

    dx = ((struct Unk030013D0 *)gUnknown_030013D0)->unk00->unk02
       - ((struct Unk030013D0 *)gUnknown_030013B0)->unk00->unk02;
    if (dx < 0)
        dx = -dx;

    dy = ((struct Unk030013D0 *)gUnknown_030013D0)->unk00->unk03
       - ((struct Unk030013D0 *)gUnknown_030013B0)->unk00->unk03;
    if (dy < 0)
        dy = -dy;

    d = dx + dy;

    CalcDamage((struct Unk08024ABCArg *)gUnknown_030013D0,
                 (struct Unk08024ABCArg *)gUnknown_030013B0, d, 1);
    CalcDamage((struct Unk08024ABCArg *)gUnknown_030013B0,
                 (struct Unk08024ABCArg *)gUnknown_030013D0, d, 0);
    sub_08024C58((struct Unk030013D0 *)gUnknown_030013D0, 0, 1);
    sub_08024C58((struct Unk030013D0 *)gUnknown_030013B0, 1, 1);

    if ((GetPlayerSpecialAbilities(((((struct Unk030013D0 *)gUnknown_030013B0)->unk00
                        - gUnits) >> 6) + 1) & 4) != 0)
        sub_08024E60((struct Unk030013D0 *)gUnknown_030013B0,
                     (struct Unk030013D0 *)gUnknown_030013D0);
    else
        sub_08024E60((struct Unk030013D0 *)gUnknown_030013D0,
                     (struct Unk030013D0 *)gUnknown_030013B0);

    sub_08024ED8((struct Unk030013D0 *)gUnknown_030013D0,
                 (struct Unk030013D0 *)gUnknown_030013B0);

    gUnits[a1].unk02 = saved;
    gUnits[a1].unk03 = saved >> 16;
}

asm(".global sub_08024F20\n.thumb_set sub_08024F20, CalcBattleDamage\n");

void sub_08025058(void)
{
}

struct Unk30013D0
{
    struct Unk08499594 *unk00;
    u8 filler_04[0x04];
    s16 unk08;
    u16 unk0a;
};

void sub_0802505C(void *a1)
{
    struct Unk30013D0 *p = a1;
    int v;
    u16 w;

    if (p->unk00->unk04_0 != 0)
        v = Div(p->unk00->unk04_0 - 1, 10) + 1;
    else
        v = 0;

    if (p->unk08 != 0)
        w = v - 1 - Div(p->unk08 - 1, 10);
    else
        w = v;

    sub_08025B24(p->unk00, w);

    p->unk00->unk04_0 = p->unk08;
    p->unk00->unk04_7 = p->unk0a;

    if (p->unk00->unk04_0 == 0)
        sub_0804018C(p->unk00);
}

void sub_080250E8(void)
{
    if (((struct Unk30013D0 *)gUnknown_030013D0)->unk08 <= 0)
        sub_08026588(
            ((((struct Unk30013D0 *)gUnknown_030013B0)->unk00 - gUnits) >> 6) + 1,
            ((((struct Unk30013D0 *)gUnknown_030013D0)->unk00 - gUnits) >> 6) + 1,
            ((struct Unk30013D0 *)gUnknown_030013D0)->unk00->unk00);

    if (((struct Unk30013D0 *)gUnknown_030013B0)->unk08 <= 0)
        sub_08026588(
            ((((struct Unk30013D0 *)gUnknown_030013D0)->unk00 - gUnits) >> 6) + 1,
            ((((struct Unk30013D0 *)gUnknown_030013B0)->unk00 - gUnits) >> 6) + 1,
            ((struct Unk30013D0 *)gUnknown_030013B0)->unk00->unk00);

    sub_0802505C(gUnknown_030013D0);
    sub_0802505C(gUnknown_030013B0);
}

void sub_080251AC(void)
{
    sub_0802505C(gUnknown_030013D0);
}

void sub_080251BC(int a1, int a2, struct Unk802C57C *a3)
{
    if (a2 == 0)
        sub_080251D8(a1);
    else
        CalcBattleDamage(a1, a2, a3);
}

void sub_080251D8(int a1)
{
    struct Unk08499594 *e;
    int a;
    int b;
    int ok;
    int t;

    a = 0;
    b = 0;
    ok = 0;

    e = &gUnits[a1];

    sub_08024A2C((struct Unk030013D0 *)gUnknown_030013D0, a1);

    if (e->unk04_7 != 0)
    {
        a = sub_08043070(gPlayers[gUnknown_030033EC].co,
                         gPlayers[gUnknown_030033EC].coMode,
                         e->unk00, 3, 0);
    }
    else
    {
        ok = sub_080433F8(e->unk00, 3, 1);
        if (ok != 0)
            b = sub_08043070(gPlayers[gUnknown_030033EC].co,
                             gPlayers[gUnknown_030033EC].coMode,
                             e->unk00, 3, 1);
    }

    if (a <= b)
    {
        if (ok != 0)
        {
            ((struct Unk030013D0 *)gUnknown_030013D0)->unk18 = 5;
            ((struct Unk030013D0 *)gUnknown_030013D0)->unk10 = b;
        }
    }
    else
    {
        ((struct Unk030013D0 *)gUnknown_030013D0)->unk18 = 1;
        ((struct Unk030013D0 *)gUnknown_030013D0)->unk10 = a;
        ((struct Unk030013D0 *)gUnknown_030013D0)->unk0a--;
    }

    sub_08024C58((struct Unk030013D0 *)gUnknown_030013D0, 0, 0);

    if (((struct Unk030013D0 *)gUnknown_030013D0)->unk00->unk04_0 != 0)
        t = ((struct Unk030013D0 *)gUnknown_030013D0)->unk14
          * (Div(((struct Unk030013D0 *)gUnknown_030013D0)->unk00->unk04_0 - 1, 10) + 1);
    else
        t = 0;

    ((struct Unk030013D0 *)gUnknown_030013D0)->unk14 =
        ((struct Unk030013D0 *)gUnknown_030013D0)->unk0c = Div(t, 10);
}

void sub_080252E8(void *arg)
{
}

void sub_080252EC(void)
{
    sub_080252E8(gUnknown_030013D0);
    sub_080252E8(gUnknown_030013B0);
}
