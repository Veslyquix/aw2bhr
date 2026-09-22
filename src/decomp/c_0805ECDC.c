#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805ECDC.
 * AiChargeAggressively @ 0x0805ECDC, AiMoveWithFrontLine @ 0x0805ED70, sub_0805EE40 @ 0x0805EE40, sub_0805EF00 @ 0x0805EF00, sub_0805EF9C @ 0x0805EF9C, AiMoveUpConservatively @ 0x0805F074
 */

void AiChargeAggressively(void)
{
    union Unk802C57CBuf v;
    u8 x;
    int t;

    if (gUnknown_085D5ABC[gUnknown_030040D8->unk00].deployLocation == 0x20)
        t = 0x11;
    else
        t = gUnknown_030040D8->unk00;

    sub_08058F30(&x);
    gUnknown_030013EC(gUnknown_030040D8->unk02, gUnknown_030040D8->unk03, t, x, 0);
    sub_08059AEC();

    if (sub_08058F90(&v) == -1)
        sub_0805F4F8();
    else if (gUnknown_085D5ABC[gUnknown_030040D8->unk00].deployLocation == 0x20)
        sub_080590DC(&v);
    else
        sub_080591E4(&v);

    sub_0805F7B8();
}

asm(".global sub_0805ECDC\n.thumb_set sub_0805ECDC, AiChargeAggressively\n");

void AiMoveWithFrontLine(void)
{
    union Unk802C57CBuf v;
    struct Unk03003338 *p;
    u8 x;

    p = gUnknown_03003F20;
    sub_08058F30(&x);
    gUnknown_030013EC(gUnknown_030040D8->unk02, gUnknown_030040D8->unk03,
                      gUnknown_030040D8->unk00, x, 0);
    sub_08059AEC();
    if (gUnknown_085D5ABC[gUnknown_030040D8->unk00].deployLocation == 0x20)
        sub_0805A008(p);
    else
        sub_08059F24(p);
    v.pos.unk00 = 0x270F;
    sub_08059C00(p, (u16 *)&v);
    if (v.pos.unk00 == 0x270F)
        sub_0805F4F8();
    gUnknown_03004730[gMap->unit[
        gMap->rowOffset[v.pos.unk02]
        + v.pos.unk00] & 0x3f]++;
    sub_080591E4(&v);
    sub_0805F7B8();
}

asm(".global sub_0805ED70\n.thumb_set sub_0805ED70, AiMoveWithFrontLine\n");

void sub_0805EE40(void)
{
    union Unk802C57CBuf v;
    struct Unk03003338 *p;
    u8 x;
    int q;
    int a;
    int b;

    p = gUnknown_03003F20;
    sub_08058F30(&x);
    gUnknown_030013EC(gUnknown_030040D8->unk02, gUnknown_030040D8->unk03,
                      gUnknown_030040D8->unk00, x, 0);
    sub_08059AEC();
    sub_08059A0C(p);
    if (gUnknown_085D5ABC[gUnknown_030040D8->unk00].minRange > 1)
    {
        q = CountUnitsWithTypeTag(4);
        a = gUnknown_085766E0->unk0c;
        b = 1;
    }
    else
    {
        q = CountUnitsWithTypeTag(5);
        a = gUnknown_085766E0->unk0c;
        b = 2;
    }
    v.pos.unk00 = 0x270F;
    sub_08059B4C(q, a, b, p, &v);
    if (v.pos.unk00 == 0x270F)
        sub_0805F4F8();
    sub_080591E4(&v);
    sub_0805F7B8();
}

void sub_0805EF00(void)
{
    union Unk802C57CBuf v;
    struct Unk03003338 *p;
    int q;
    int a;
    int b;

    p = gUnknown_03003F20;
    sub_08059A0C(p);
    if (gUnknown_085D5ABC[gUnknown_030040D8->unk00].minRange > 1)
    {
        q = CountUnitsWithTypeTag(4);
        a = gUnknown_085766E0->unk0c;
        b = 1;
    }
    else
    {
        q = CountUnitsWithTypeTag(5);
        a = gUnknown_085766E0->unk0c;
        b = 2;
    }
    v.pos.unk00 = 0x270F;
    sub_08059B4C(q, a, b, p, &v);
    if (v.pos.unk00 == 0x270F)
        sub_0805F4F8();
    sub_080591E4(&v);
    sub_0805F7B8();
}

void sub_0805EF9C(void)
{
    union Unk802C57CBuf v;
    struct Unk03003338 *p;
    u8 x;

    p = gUnknown_03003F20;
    sub_08058F30(&x);
    gUnknown_030013EC(gUnknown_030040D8->unk02, gUnknown_030040D8->unk03,
                      gUnknown_030040D8->unk00, x, 0);
    sub_08059AEC();
    sub_08059C60(p);
    v.pos.unk00 = 0x270F;
    sub_08059C00(p, (u16 *)&v);
    if (v.pos.unk00 == 0x270F)
        sub_0805F4F8();
    else if ((s8)gUnknown_03003340[v.pos.unk02][v.pos.unk00] <= 0x79)
        sub_080591E4(&v);
    sub_0801F92C(gMap->danger);
    gUnknown_030013EC(v.pos.unk00, v.pos.unk02, 0x10, 0x78, 0);
    sub_08059464(&v);
    sub_0805F7B8();
}

void AiMoveUpConservatively(void)
{
    union Unk802C57CBuf v;
    struct Unk03003338 *p;
    u8 x;

    p = gUnknown_03003F20;
    sub_08058F30(&x);
    gUnknown_030013EC(gUnknown_030040D8->unk02, gUnknown_030040D8->unk03,
                      gUnknown_030040D8->unk00, x, 0);
    sub_08059AEC();
    sub_08059E3C(p);
    v.pos.unk00 = 0x270F;
    sub_08059C00(p, (u16 *)&v);
    if (v.pos.unk00 == 0x270F)
        sub_0805EF00();
    sub_080591E4(&v);
    sub_0805F7B8();
}

asm(".global sub_0805F074\n.thumb_set sub_0805F074, AiMoveUpConservatively\n");
