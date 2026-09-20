#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800081C.
 * sub_0800081C @ 0x0800081C
 */

#include "hardware.h"
#define MAP gMap

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

    if (gActiveMap->unk06 != 0)
    {
        gActiveMap->unk06 = 0;
        gActiveMap->unk02 = 0;
        gActiveMap->cursorX = gUnknown_030033E4.unk00;
        gActiveMap->cursorY = gUnknown_030033E4.unk02;
        sub_08002E3C();
        sub_08002E5C();
        sub_08002D7C();
        sub_080059E4();
        sub_08001D8C();
        sub_08003934();
        sub_080088F0();
    }

    if (gActiveMap->unk02 == 0)
    {
        gActiveMap->unk02 = 1;
        return;
    }

    gActiveMap->unk6a = 0;
    sub_08023824();
    v = sub_0800105C();
    sub_08023908(4);

    if (gUnknown_030033E4.unk00 != gActiveMap->cursorX
     || gUnknown_030033E4.unk02 != gActiveMap->cursorY)
    {
        keys = gpKeySt->unk00;
        gActiveMap->cursorX = gUnknown_030033E4.unk00;
        gActiveMap->cursorY = gUnknown_030033E4.unk02;
    }
    else
    {
        keys = gpKeySt->held;
    }

    if (gActiveMap->unk07 == 0)
    {
        r = 1;
        if (gActiveMap->selectedTerrain == 0xd)
        {
            if (sub_0800B528(gActiveMap->cursorX, gActiveMap->cursorY) < 0
             || sub_0800B61C(gActiveMap->cursorX, gActiveMap->cursorY) < 0)
                r = 6;
        }
        else if (gActiveMap->selectedTerrain == 2)
        {
            if (sub_0800AEAC(gActiveMap->cursorX, gActiveMap->cursorY) == 0)
                r = 6;
        }
        else if (gActiveMap->selectedTerrain == 0x13)
        {
            if (sub_0800BC5C(gActiveMap->cursorX, gActiveMap->cursorY) == 0)
                r = 6;
        }
        else if (gActiveMap->selectedTerrain == 0xc)
        {
            if (sub_08009310(gActiveMap->cursorX, gActiveMap->cursorY) == 0)
                r = 6;
        }
        else if (gActiveMap->selectedTerrain == 5)
        {
            if (MAP->terrain[MAP->rowOffset[gActiveMap->cursorY]
                             + gActiveMap->cursorX] == 2)
            {
                if (sub_08009310(gActiveMap->cursorX, gActiveMap->cursorY) == 0)
                    r = 6;
            }
        }
        else if (gActiveMap->selectedTerrain == 0x10)
        {
            if (sub_08010DD4(gActiveMap->cursorX, gActiveMap->cursorY) != 0)
                r = 6;
        }
        else if (gActiveMap->unk00 & 0x2000)
        {
            r = 6;
        }
    }
    else if (gActiveMap->unk24 == 0x19)
    {
        r = 5;
    }
    else
    {
        s8 *tbl = gUnknown_085D3DD0[1].unk38[0].unk18[0];

        index = MAP->terrain[MAP->rowOffset[gActiveMap->cursorY]
                             + gActiveMap->cursorX] & 0x1f;
        index += gUnknown_085D5ABC[gActiveMap->unk24 & 0x3f].unk19 * 32;
        r = tbl[index] != -1 ? 1 : 6;
    }

    sub_08023274(r);

    if (keys & 1)
    {
        if (gActiveMap->unk07 == 0)
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
                gActiveMap->unk6a = 0;
                v = 0;
                sub_08035850(gActiveMap->cursorX, gActiveMap->cursorY,
                             gActiveMap->unk24 & 0x3f);
            }
            if (k > 0)
                gActiveMap->unk00 |= 0x1000;
        }

        if (r == 6)
        {
            if (gpKeySt->held & 1)
                sub_0803B4DC(0x68);

            gActiveMap->unk58++;
            gActiveMap->unk59 = 0xc;
            if (gActiveMap->unk58 > 0x31)
            {
                gActiveMap->unk58 = 0;
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
        else if (gActiveMap->unk59-- <= 0)
        {
            gActiveMap->unk59 = t;
            gActiveMap->unk58 = t;
        }
    }

    if (sub_0802DBF8() && (keys & 8))
        sub_0800056C(5);

    if (gActiveMap->unk6a != 0)
        sub_0803B4DC(gActiveMap->unk6a);
    else if (v != 0)
        sub_0803B4DC((s16)v);

    if (gActiveMap->unk11 > 0)
    {
        gActiveMap->unk11--;
        if (gActiveMap->unk11 == 0)
            gActiveMap->unk00 &= 0xDFFF;
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
                gActiveMap->unk07 = t;
                sub_0800056C(2);
            }
            else if (m == 0x200)
            {
                gActiveMap->unk07 = 1;
                sub_0800056C(2);
            }
            else
            {
                gActiveMap->cursorX = gUnknown_030033E4.unk00;
                gActiveMap->cursorY = gUnknown_030033E4.unk02;
            }
        }
    }
}
