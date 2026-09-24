#include "global.h"

struct ArmyUnitBlock
{
    struct Unk08499594 units[64];
};
void CalcDamage(struct BattleUnit *a, struct BattleUnit *b, s16 c, u8 d)
{
    const struct Unk085D5ABC *t;
    u16 army;
    u32 v1;
    s16 v2;
    u32 v3;

    army = ((struct ArmyUnitBlock *)a->unit
            - (struct ArmyUnitBlock *)gUnits) + 1;
    v3 = 0;
    v1 = 0;
    v2 = 0;
    t = &gUnknown_085D5ABC[a->unit->unk00];

    if (c == 1)
    {
        v2 = sub_080433F8(a->unit->unk00, b->unit->unk00, 1);
        if (v2 != 0)
            v1 = (u16)sub_08043070(gPlayers[army].co,
                              gPlayers[army].coMode,
                              a->unit->unk00, b->unit->unk00, c);
        if (t->minRange == 1 && a->unit->unk04_7 != 0)
        {
            if ((b->unit->unk01 & 0x20) != 0)
                v3 = (u16)sub_08043070(gPlayers[army].co,
                                  gPlayers[army].coMode,
                                  a->unit->unk00, 0x19, v3);
            else
                v3 = (u16)sub_08043070(gPlayers[army].co,
                                  gPlayers[army].coMode,
                                  a->unit->unk00, b->unit->unk00, v3);
        }
    }
    else if (t->minRange <= c && c <= GetUnitFiringRangeWithCoBonus(army, a->unit->unk00)
             && a->unit->unk04_7 != 0 && d == 1)
    {
        if ((b->unit->unk01 & 0x20) != 0)
            v3 = (u16)sub_08043070(gPlayers[army].co,
                              gPlayers[army].coMode,
                              a->unit->unk00, 0x19, v3);
        else
            v3 = (u16)sub_08043070(gPlayers[army].co,
                              gPlayers[army].coMode,
                              a->unit->unk00, b->unit->unk00, v3);
    }

    if (v3 <= v1)
    {
        if (v2 != 0)
        {
            a->attackType = 5;
            a->baseDamage = v1;
        }
    }
    else
    {
        a->attackType = 1;
        a->baseDamage = v3;
        a->ammo--;
    }
}

asm(".global sub_08024ABC\n.thumb_set sub_08024ABC, CalcDamage\n");

void sub_08024C58(struct BattleUnit *a1, int a2, u8 a3)
{
    int idx;
    int x;
    int y;
    int acc;
    int hp;
    int r;
    int q;

    idx = (a1->unit - gUnits) >> 6;
    x = *(s16 *)((u8 *)&gPlayers[idx] + 0x62);
    y = *(s16 *)((u8 *)&gPlayers[idx] + 0x64);
    acc = 100;

    if (a1->unit->unk04_0 != 0)
        hp = Div(a1->unit->unk04_0 - 1, 10) + 1;
    else
        hp = 0;

    a1->terrainDefense = sub_08043304((struct Unk43304 *)a1);
    a1->totalDefense = Div(hp * a1->terrainDefense, 10);
    a1->totalDefense = a1->totalDefense
              + GetUnitDefenceWithCoBonus(((a1->unit - gUnits) >> 6) + 1, a1->unit->unk00)
              + y;
    a1->damage = a1->baseDamage;

    if (a2 == 1)
        acc += sub_0804338C((struct Unk43304 *)a1);

    acc += sub_0804334C((struct Unk43304 *)a1);
    acc += x;

    a1->damage = Div(acc * a1->damage, 100);
    a1->displayDamage = a1->damage;

    if (a1->damage != 0)
    {
        if (gPlaySt.campaignRelated == 0 || a3 != 0)
        {
            r = DivRem(GetNextRandomNumber(),
                       GetPlayerCoLuckBonus(((a1->unit - gUnits) >> 6) + 1));
            q = GetPlayerCoNegativeLuckBonus(((a1->unit - gUnits) >> 6) + 1);
            if (q != 0)
                q = DivRem(GetNextRandomNumber(), q);

            a1->damage = a1->damage + r - q;
            if (a1->damage < 0)
                a1->damage = 0;
        }
    }
}

void sub_08024DDC(struct BattleUnit *a1, struct BattleUnit *a2)
{
    int hp;

    if (a2->unit->unk04_0 != 0)
        hp = Div(a2->unit->unk04_0 - 1, 10) + 1;
    else
        hp = 0;

    a2->displayDamage = Div((200 - a1->totalDefense) * a2->displayDamage, 100);
    a2->displayDamage = Div(hp * a2->displayDamage, 10);

    if (a2->displayDamage > 998)
        a2->displayDamage = 999;

    a1->hpLoss = Div((200 - a1->totalDefense) * a2->damage, 100);
    a1->remainingHp = a1->unit->unk04_0 - a1->hpLoss;
}

void sub_08024E60(struct BattleUnit *a1, struct BattleUnit *a2)
{
    int v;
    s16 hp;

    if (a1->unit->unk04_0 != 0)
        v = a1->damage * (Div(a1->unit->unk04_0 - 1, 10) + 1);
    else
        v = 0;

    a1->damage = Div(v, 10);

    sub_08024DDC(a2, a1);

    if (a2->remainingHp >= 0)
        hp = a2->remainingHp;
    else
        hp = 0;

    if (hp != 0)
        v = a2->damage * (Div(hp - 1, 10) + 1);
    else
        v = 0;

    a2->damage = Div(v, 10);

    sub_08024DDC(a1, a2);
}

void sub_08024ED8(struct BattleUnit *a, struct BattleUnit *b)
{
    if (a->remainingHp <= 0)
    {
        if (b->remainingHp <= 0)
        {
            if (a->remainingHp < b->remainingHp)
            {
                b->remainingHp = 1;
                a->remainingHp = 0;
            }
            else
            {
                a->remainingHp = 1;
                b->remainingHp = 0;
            }

            return;
        }

        if (a->remainingHp < 0)
            a->remainingHp = 0;
    }

    if (b->remainingHp < 0)
        b->remainingHp = 0;
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

    sub_08024A2C(gBattleAttacker, a1);
    sub_08024A2C(gBattleDefender, a2);

    dx = gBattleAttacker->unit->unk02
       - gBattleDefender->unit->unk02;
    if (dx < 0)
        dx = -dx;

    dy = gBattleAttacker->unit->unk03
       - gBattleDefender->unit->unk03;
    if (dy < 0)
        dy = -dy;

    d = dx + dy;

    CalcDamage(gBattleAttacker,
                 gBattleDefender, d, 1);
    CalcDamage(gBattleDefender,
                 gBattleAttacker, d, 0);
    sub_08024C58(gBattleAttacker, 0, 1);
    sub_08024C58(gBattleDefender, 1, 1);

    if ((GetPlayerSpecialAbilities(((gBattleDefender->unit
                        - gUnits) >> 6) + 1) & 4) != 0)
        sub_08024E60(gBattleDefender,
                     gBattleAttacker);
    else
        sub_08024E60(gBattleAttacker,
                     gBattleDefender);

    sub_08024ED8(gBattleAttacker,
                 gBattleDefender);

    gUnits[a1].unk02 = saved;
    gUnits[a1].unk03 = saved >> 16;
}

asm(".global sub_08024F20\n.thumb_set sub_08024F20, CalcBattleDamage\n");

void sub_08025058(void)
{
}

void sub_0802505C(void *a1)
{
    struct BattleUnit *p = a1;
    int v;
    u16 w;

    if (p->unit->unk04_0 != 0)
        v = Div(p->unit->unk04_0 - 1, 10) + 1;
    else
        v = 0;

    if (p->remainingHp != 0)
        w = v - 1 - Div(p->remainingHp - 1, 10);
    else
        w = v;

    sub_08025B24(p->unit, w);

    p->unit->unk04_0 = p->remainingHp;
    p->unit->unk04_7 = p->ammo;

    if (p->unit->unk04_0 == 0)
        sub_0804018C(p->unit);
}

void sub_080250E8(void)
{
    if (gBattleAttacker->remainingHp <= 0)
        sub_08026588(
            ((gBattleDefender->unit - gUnits) >> 6) + 1,
            ((gBattleAttacker->unit - gUnits) >> 6) + 1,
            gBattleAttacker->unit->unk00);

    if (gBattleDefender->remainingHp <= 0)
        sub_08026588(
            ((gBattleAttacker->unit - gUnits) >> 6) + 1,
            ((gBattleDefender->unit - gUnits) >> 6) + 1,
            gBattleDefender->unit->unk00);

    sub_0802505C(gBattleAttacker);
    sub_0802505C(gBattleDefender);
}

void sub_080251AC(void)
{
    sub_0802505C(gBattleAttacker);
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

    sub_08024A2C(gBattleAttacker, a1);

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
            gBattleAttacker->attackType = 5;
            gBattleAttacker->baseDamage = b;
        }
    }
    else
    {
        gBattleAttacker->attackType = 1;
        gBattleAttacker->baseDamage = a;
        gBattleAttacker->ammo--;
    }

    sub_08024C58(gBattleAttacker, 0, 0);

    if (gBattleAttacker->unit->unk04_0 != 0)
        t = gBattleAttacker->displayDamage
          * (Div(gBattleAttacker->unit->unk04_0 - 1, 10) + 1);
    else
        t = 0;

    gBattleAttacker->displayDamage =
        gBattleAttacker->damage = Div(t, 10);
}

void sub_080252E8(void *arg)
{
}

void sub_080252EC(void)
{
    sub_080252E8(gBattleAttacker);
    sub_080252E8(gBattleDefender);
}
