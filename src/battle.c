#include "global.h"
#include "hardware.h"
#include "map.h"

/* Battle/map code, contiguous from 0x080247A4 through 0x08024C58.
 * The adjacent source units own separate .rodata placements.
 * Preserve function order for the original ROM layout. */

void LoadMapData(u16 a1)
{
    void *p;

    if (a1 >= 0xb4 && a1 <= 0xbf)
    {
        sub_08037B84(sub_08014E44(0x724));
        sub_0801AC58(8, gUnknown_03003F68);
    }
    else
    {
        sub_08037B84(sub_08014E44(0xa14));

        p = gUnknown_085C77A0[a1].mapData[IsHardCampaignMode()];
        if (p == NULL)
            p = gUnknown_085C77A0[a1].mapData[0];

        LZ77UnCompWram(p, gUnknown_03003F68);
    }
}

asm(".global sub_080247A4\n.thumb_set sub_080247A4, LoadMapData\n");

/* Family F031: `callee(gPointerGlobal)`. The DOUBLE load -- `ldr r0,=g` then
 * `ldr r0,[r0]` -- is the global being a pointer VARIABLE and being
 * dereferenced, not a pool word holding an address; `pop {r0}` makes the
 * wrapper void. Exemplar src/decomp/c_0804B14C.c. */

void sub_0802481C(void)
{
    sub_08014ED4(gUnknown_03003F68);
}

/* The palette half of LoadGameplayGraphics (src/decomp/c_08023360.c) lifted out as its
 * own routine: the same four `gUnknown_0810E6E0 + (gPlayers[i].unk1a
 * - 1) * 0x20` palette rows, on ApplyPaletteExt with a BYTE offset where the
 * exemplar uses ApplyPalette with a slot index -- 0x180/0x1A0/0x1C0/0x1E0 are
 * the exemplar's 12/13/14/15 times 0x20, and 0x240 is its 18.
 *
 * A data_refs-subset target (42% of LoadGameplayGraphics) and it behaved exactly as
 * that axis claims: all five globals and all eight callees already declared,
 * first draft, one attempt, nothing derived but statement order. The fourth
 * ApplyPaletteExt reuses the struct offset 0x10A as the base of its palette
 * constant (`movs r1,#0x85; lsls r1,#1` ... `adds r1,#0xd6` = 0x1E0) -- that is
 * gcc CSEing two unrelated integer constants, not a source feature. */

void sub_08024830(void)
{
    ApplyPaletteExt((u16 *)(gUnknown_0810E6E0 + (gPlayers[1].teamColor - 1) * 0x20),
                    0x180, 0x20);
    ApplyPaletteExt((u16 *)(gUnknown_0810E6E0 + (gPlayers[2].teamColor - 1) * 0x20),
                    0x1A0, 0x20);
    ApplyPaletteExt((u16 *)(gUnknown_0810E6E0 + (gPlayers[3].teamColor - 1) * 0x20),
                    0x1C0, 0x20);
    ApplyPaletteExt((u16 *)(gUnknown_0810E6E0 + (gPlayers[4].teamColor - 1) * 0x20),
                    0x1E0, 0x20);

    sub_0803F80C(8);
    sub_0802D2EC();

    ApplyPaletteExt(gUnknown_0809163C, 0x240, 0x20);

    sub_08035020(gPlaySt.weather);
    sub_08022A34();

    sub_0801A5B0(gUnknown_030033EC);
    sub_08043834(gUnknown_030033EC);
    sub_0801A57C(gUnknown_030033EC);
}

u8 *sub_080248E4(void)
{
    return gMap->unk421a;
}

u8 sub_080248F8(void)
{
    return gMap->unk4233;
}

/* `ldr r1,=0xFF4C0000; adds r0,r0,r1; lsrs r0,#0x10` is the id range test
 * `(u16)(a1 - 0xb4) <= 0xb` done on the still-shifted parameter -- one add and
 * one shift instead of a pair of compares. The 12 ids 0xb4..0xbf are the ones
 * sub_0803CD14 owns; everything else reads the row's own unk18.
 *
 * The branch polarity is load-bearing: agbcc branches on the TRUE condition to
 * the FIRST return's block and leaves the second in the fall-through, so
 * writing the range test the other way round swaps the two bodies. Measured.
 *
 * The `lsls #0x18; lsrs #0x18` before the `bl` is the conversion to
 * sub_0803CD14's `u8`; the one AFTER it is this function's own `u8` return
 * conversion, not a re-narrowing -- sub_0803CD14 returns `int`. */

u8 sub_0802490C(u16 a1)
{
    if ((u16)(a1 - 0xB4) <= 0xB)
        return sub_0803CD14(a1 + 0x4C);

    return gUnknown_085C77A0[a1].unk18;
}

/* The name-string twin of sub_0802490C -- same 0xb4..0xbf range test, same
 * branch polarity. Here the fallback is gTextTable[row.unk14], a table
 * of `u8 *`, which is why the return is a pointer and nothing narrows
 * sub_0803CCEC's result. */

u8 *sub_08024944(u16 a1)
{
    if ((u16)(a1 - 0xB4) <= 0xB)
        return sub_0803CCEC(a1 + 0x4C);

    return gTextTable[gUnknown_085C77A0[a1].nameIndex];
}

/* One accumulator, not two returns: the value lives in r1 across both arms and
 * only reaches r0 in the shared `adds r0, r1, #0` at the end, which is what an
 * assigned local gives and a pair of `return`s does not.
 *
 * The `||` is read off the branch pair -- `beq` into the second block on the
 * first test and `bne` past it on the second, i.e. either condition enters the
 * override. The tail is src/decomp/c_080249C8.c's shape: `i = a & 0xe0`, zero
 * short-circuits, and `i >> 5` is an ARITHMETIC shift, so a1 is signed. */

int sub_08024984(int a1)
{
    int r = gUnknown_085C77A0[gPlaySt.mapID].unk58;

    if (r == 0 || (a1 & 0x1F) == 8)
    {
        int i = a1 & 0xE0;

        if (i != 0)
            r = sub_08042DE0(i >> 5);
        else
            r = 0;
    }

    return r;
}

int sub_080249C8(int a)
{
    int i = a & 0xE0;

    if (i == 0)
        return 0;

    return gPlayers[i >> 5].teamColor;
}

/* THREE parameters and the FIRST is unused: the body opens on r1 and never
 * reads r0, so a1 exists only to put a2 and a3 in r1 and r2.
 *
 * a2 is `s8`, and the two shift pairs are what say so: PROMOTE_MODE narrows it
 * into r3 with `lsls #0x18; lsrs #0x18` (zero-extending, which says only
 * "narrow") and the USE re-reads it as `lsls #0x18; asrs #0x18` -- the second
 * pair is where the sign lives. a3 is the u8 index into gUnknown_085D5ABC.
 *
 * `lsls #0x19; asrs #0x18` is a NET LEFT SHIFT OF ONE under an (s8) cast, not a
 * mask: count it as `(s8)(x * 2)` and fold it into the x5 above it, giving
 * `(s8)(unk10 * 10)`. Written as a shift it is a different instruction
 * sequence -- shorten_binary_op applies to MULT_EXPR and not to shifts. */

int GetTerrainDefense(int a1, s8 a2, u8 a3)
{
    if (gUnknown_085D5ABC[a3].deployLocation == 0x10)
        return 0;

    return (s8)(gUnknown_085D583C[a2].defense * 10);
}

asm(".global sub_080249EC\n.thumb_set sub_080249EC, GetTerrainDefense\n");

void sub_08024A2C(struct Unk030013D0 *a1, s16 a2)
{
    struct Unk08499594 *e;
    struct Map *map;
    int idx;
    int t;

    e = &gUnits[a2];
    a1->unk00 = e;

    map = gMap;
    idx = map->rowOffset[e->unk03] + e->unk02;
    t = map->terrain[idx] & 0x1f;

    a1->unk04 = t;
    a1->unk06 = (s8)GetTerrainDefense((u16)(((e - gUnits) >> 6) + 1),
                                 t, e->unk00);
    a1->unk08 = a1->unk00->unk04_0;
    a1->unk0a = a1->unk00->unk04_7;
    a1->unk18 = 0;
    a1->unk10 = 0;
    a1->unk12 = 0;
}

struct Unk08024ABCBlk
{
    struct Unk08499594 unk00[64];
};
struct Unk08024ABCArg
{
    /* 0x00 */ struct Unk08499594 *unk00;
    /* 0x04 */ u8 filler_04[0x06];
    /* 0x0a */ u16 unk0a;
    /* 0x0c */ u8 filler_0c[0x04];
    /* 0x10 */ u16 unk10;
    /* 0x12 */ u8 filler_12[0x06];
    /* 0x18 */ u16 unk18;
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
