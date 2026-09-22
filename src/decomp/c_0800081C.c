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

    if (gActiveMap->stateChanged != 0)
    {
        gActiveMap->stateChanged = 0;
        gActiveMap->state = 0;
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

    if (gActiveMap->state == 0)
    {
        gActiveMap->state = 1;
        return;
    }

    gActiveMap->soundId = 0;
    sub_08023824();
    v = sub_0800105C();
    sub_08023908(4);

    if (gUnknown_030033E4.unk00 != gActiveMap->cursorX
     || gUnknown_030033E4.unk02 != gActiveMap->cursorY)
    {
        keys = gpKeySt->held;
        gActiveMap->cursorX = gUnknown_030033E4.unk00;
        gActiveMap->cursorY = gUnknown_030033E4.unk02;
    }
    else
    {
        keys = gpKeySt->pressed;
    }

    if (gActiveMap->editMode == 0)
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
        else if (gActiveMap->flags & 0x2000)
        {
            r = 6;
        }
    }
    else if (gActiveMap->cursorUnit == 0x19)
    {
        r = 5;
    }
    else
    {
        s8 *tbl = gUnknown_085D3DD0[1].power[0].movementChart[0];

        index = MAP->terrain[MAP->rowOffset[gActiveMap->cursorY]
                             + gActiveMap->cursorX] & 0x1f;
        index += gUnknown_085D5ABC[gActiveMap->cursorUnit & 0x3f].movementType * 32;
        r = tbl[index] != -1 ? 1 : 6;
    }

    sub_08023274(r);

    if (keys & 1)
    {
        if (gActiveMap->editMode == 0)
        {
            if (r != 6)
            {
                MakeTile();
                sub_08021D10();
                sub_08024268();
            }
        }
        else
        {
            k = sub_08008928();
            if (k == 1)
            {
                gActiveMap->soundId = 0;
                v = 0;
                sub_08035850(gActiveMap->cursorX, gActiveMap->cursorY,
                             gActiveMap->cursorUnit & 0x3f);
            }
            if (k > 0)
                gActiveMap->flags |= 0x1000;
        }

        if (r == 6)
        {
            if (gpKeySt->pressed & 1)
                sub_0803B4DC(0x68);

            gActiveMap->cursorIdleFrames++;
            gActiveMap->cursorIdleTimer = 0xc;
            if (gActiveMap->cursorIdleFrames > 0x31)
            {
                gActiveMap->cursorIdleFrames = 0;
                sub_08004D10();
            }
        }
    }
    else
    {
        t = gpKeySt->pressed & 2;
        if (t != 0)
        {
            sub_080088F0();
            sub_08000BF8();
        }
        else if (gActiveMap->cursorIdleTimer-- <= 0)
        {
            gActiveMap->cursorIdleTimer = t;
            gActiveMap->cursorIdleFrames = t;
        }
    }

    if (sub_0802DBF8() && (keys & 8))
        sub_0800056C(5);

    if (gActiveMap->soundId != 0)
        sub_0803B4DC(gActiveMap->soundId);
    else if (v != 0)
        sub_0803B4DC((s16)v);

    if (gActiveMap->inputDelay > 0)
    {
        gActiveMap->inputDelay--;
        if (gActiveMap->inputDelay == 0)
            gActiveMap->flags &= 0xDFFF;
    }

    if (sub_0802DBF8() && GetCoPowerDepth() == 0)
    {
        t = gpKeySt->pressed & 4;
        if (t != 0)
        {
            sub_0800056C(3);
        }
        else
        {
            m = gpKeySt->pressed & (A_BUTTON | B_BUTTON | R_BUTTON | L_BUTTON);
            if (m == 0x100)
            {
                gActiveMap->editMode = t;
                sub_0800056C(2);
            }
            else if (m == 0x200)
            {
                gActiveMap->editMode = 1;
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
