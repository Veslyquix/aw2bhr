#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800081C.
 * sub_0800081C @ 0x0800081C
 */

#include "hardware.h"
struct MapScreen
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0A22 - 4];
    /* 0x0A22 */ u16 cells[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 terrain[0x417A - 0x1432];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct MapScreen *)gUnknown_08499590)

/* Wave 66: the final four bytes were allocation in the table lookup. A ternary
 * delays the default 6 until after the compare, and the explicit `index +=`
 * accumulator selects the ROM's add destination. */
void sub_0800081C(void)
{
    int r;
    int v;
    int keys;
    int k;
    int m;
    int index;
    u16 t;

    if (gUnknown_0200B0B0->unk06 != 0)
    {
        gUnknown_0200B0B0->unk06 = 0;
        gUnknown_0200B0B0->unk02 = 0;
        gUnknown_0200B0B0->unk08 = gUnknown_030033E4.unk00;
        gUnknown_0200B0B0->unk0a = gUnknown_030033E4.unk02;
        sub_08002E3C();
        sub_08002E5C();
        sub_08002D7C();
        sub_080059E4();
        sub_08001D8C();
        sub_08003934();
        sub_080088F0();
    }

    if (gUnknown_0200B0B0->unk02 == 0)
    {
        gUnknown_0200B0B0->unk02 = 1;
        return;
    }

    gUnknown_0200B0B0->unk6a = 0;
    sub_08023824();
    v = sub_0800105C();
    sub_08023908(4);

    if (gUnknown_030033E4.unk00 != gUnknown_0200B0B0->unk08
     || gUnknown_030033E4.unk02 != gUnknown_0200B0B0->unk0a)
    {
        keys = gpKeySt->unk00;
        gUnknown_0200B0B0->unk08 = gUnknown_030033E4.unk00;
        gUnknown_0200B0B0->unk0a = gUnknown_030033E4.unk02;
    }
    else
    {
        keys = gpKeySt->held;
    }

    if (gUnknown_0200B0B0->unk07 == 0)
    {
        r = 1;
        if (gUnknown_0200B0B0->unk2a == 0xd)
        {
            if (sub_0800B528(gUnknown_0200B0B0->unk08, gUnknown_0200B0B0->unk0a) < 0
             || sub_0800B61C(gUnknown_0200B0B0->unk08, gUnknown_0200B0B0->unk0a) < 0)
                r = 6;
        }
        else if (gUnknown_0200B0B0->unk2a == 2)
        {
            if (sub_0800AEAC(gUnknown_0200B0B0->unk08, gUnknown_0200B0B0->unk0a) == 0)
                r = 6;
        }
        else if (gUnknown_0200B0B0->unk2a == 0x13)
        {
            if (sub_0800BC5C(gUnknown_0200B0B0->unk08, gUnknown_0200B0B0->unk0a) == 0)
                r = 6;
        }
        else if (gUnknown_0200B0B0->unk2a == 0xc)
        {
            if (sub_08009310(gUnknown_0200B0B0->unk08, gUnknown_0200B0B0->unk0a) == 0)
                r = 6;
        }
        else if (gUnknown_0200B0B0->unk2a == 5)
        {
            if (MAP->terrain[MAP->rowOffset[gUnknown_0200B0B0->unk0a]
                             + gUnknown_0200B0B0->unk08] == 2)
            {
                if (sub_08009310(gUnknown_0200B0B0->unk08, gUnknown_0200B0B0->unk0a) == 0)
                    r = 6;
            }
        }
        else if (gUnknown_0200B0B0->unk2a == 0x10)
        {
            if (sub_08010DD4(gUnknown_0200B0B0->unk08, gUnknown_0200B0B0->unk0a) != 0)
                r = 6;
        }
        else if (gUnknown_0200B0B0->unk00 & 0x2000)
        {
            r = 6;
        }
    }
    else if (gUnknown_0200B0B0->unk24 == 0x19)
    {
        r = 5;
    }
    else
    {
        s8 *tbl = gUnknown_085D3DD0[1].unk38[0].unk18[0];

        index = MAP->terrain[MAP->rowOffset[gUnknown_0200B0B0->unk0a]
                             + gUnknown_0200B0B0->unk08] & 0x1f;
        index += gUnknown_085D5ABC[gUnknown_0200B0B0->unk24 & 0x3f].unk19 * 32;
        r = tbl[index] != -1 ? 1 : 6;
    }

    sub_08023274(r);

    if (keys & 1)
    {
        if (gUnknown_0200B0B0->unk07 == 0)
        {
            if (r != 6)
            {
                sub_080085E0();
                sub_08021D10();
                sub_08024268();
            }
        }
        else
        {
            k = sub_08008928();
            if (k == 1)
            {
                gUnknown_0200B0B0->unk6a = 0;
                v = 0;
                sub_08035850(gUnknown_0200B0B0->unk08, gUnknown_0200B0B0->unk0a,
                             gUnknown_0200B0B0->unk24 & 0x3f);
            }
            if (k > 0)
                gUnknown_0200B0B0->unk00 |= 0x1000;
        }

        if (r == 6)
        {
            if (gpKeySt->held & 1)
                sub_0803B4DC(0x68);

            gUnknown_0200B0B0->unk58++;
            gUnknown_0200B0B0->unk59 = 0xc;
            if (gUnknown_0200B0B0->unk58 > 0x31)
            {
                gUnknown_0200B0B0->unk58 = 0;
                sub_08004D10();
            }
        }
    }
    else
    {
        t = gpKeySt->held & 2;
        if (t != 0)
        {
            sub_080088F0();
            sub_08000BF8();
        }
        else if (gUnknown_0200B0B0->unk59-- <= 0)
        {
            gUnknown_0200B0B0->unk59 = t;
            gUnknown_0200B0B0->unk58 = t;
        }
    }

    if (sub_0802DBF8() && (keys & 8))
        sub_0800056C(5);

    if (gUnknown_0200B0B0->unk6a != 0)
        sub_0803B4DC(gUnknown_0200B0B0->unk6a);
    else if (v != 0)
        sub_0803B4DC((s16)v);

    if (gUnknown_0200B0B0->unk11 > 0)
    {
        gUnknown_0200B0B0->unk11--;
        if (gUnknown_0200B0B0->unk11 == 0)
            gUnknown_0200B0B0->unk00 &= 0xDFFF;
    }

    if (sub_0802DBF8() && sub_08034F6C() == 0)
    {
        t = gpKeySt->held & 4;
        if (t != 0)
        {
            sub_0800056C(3);
        }
        else
        {
            m = gpKeySt->held & 0x303;
            if (m == 0x100)
            {
                gUnknown_0200B0B0->unk07 = t;
                sub_0800056C(2);
            }
            else if (m == 0x200)
            {
                gUnknown_0200B0B0->unk07 = 1;
                sub_0800056C(2);
            }
            else
            {
                gUnknown_0200B0B0->unk08 = gUnknown_030033E4.unk00;
                gUnknown_0200B0B0->unk0a = gUnknown_030033E4.unk02;
            }
        }
    }
}
