#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08008928.
 * sub_08008928 @ 0x08008928, sub_08008A8C @ 0x08008A8C
 */

#include "hardware.h"

int sub_08008928(void)
{
    int x;
    int y;
    int v;
    int q;
    int f;
    int result;

    result = 0;

    gUnknown_030033EC = f = gActiveMap->unk2f;
    gUnknown_03003F2C = (f - 1) << 6;

    x = gActiveMap->cursorX;
    y = gActiveMap->cursorY;

    if (gActiveMap->unk24 == 0x19)
    {
        if (sub_08008A8C(1, x, y))
        {
            sub_08024268();
            result = 2;
        }
    }
    else
    {
        v = sub_08008B70(x, y);

        if (v != gActiveMap->unk24)
        {
            s8 *costs;
            int idx;
            int c;

            if (v == 0x19)
            {
                v = -1;
            }
            else if (sub_08025308(gActiveMap->unk2f) > 0x31
                     && (v >> 6) + 1 != gActiveMap->unk2f)
            {
                return -1;
            }

            /* WAVE 37 final sweep: `.unk18` was `s8 *` when this function was
             * verified; W37-H later widened it to `s8 *[3]`. Element 0 is at
             * the same offset, so `[0]` is byte-identical to the spelling that
             * matched -- this is a declaration change, not a behaviour one. */
            costs = gUnknown_085D3DD0[1].power[0].movementChart[0];

            idx = gMap->rowOffset[y] + x;
            c = (gMap->terrain[idx] & 0x1f)
                + gUnknown_085D5ABC[gActiveMap->unk24 & 0x3f].movementType * 32;

            q = costs[c];

            if (q != -1)
            {
                if (v > 0)
                    sub_08008A8C(0, x, y);

                if (sub_08025308(gActiveMap->unk2f) <= 0x31
                    && sub_08025CC8(x, y, gActiveMap->unk24 & 0x3f))
                    result = 1;
            }
            else
            {
                result = q;
            }
        }
    }

    if (result > 0)
        sub_080088F0();

    return result;
}

int RemoveUnitAt(int mode, int x, int y)
{
    struct Unk08499594 *e;
    int idx;
    int result;

    result = 0;

    idx = gMap->rowOffset[y] + x;

    if (gMap->unit[idx] != 0)
    {
        e = &gUnknown_08499594[gMap->unit[idx]];

        if (mode != 0)
        {
            SetWinEnable(1, 0, 0);

            gUnknown_03002B40 = 0;
            gUnknown_03002EFC = 0;
            gUnknown_03002B4C = 0;
            gUnknown_03002B44 = 0;

            gUnknown_030030A4.bits.win0_enable_blend = 0;
            gUnknown_030030DC.bits.win1_enable_blend = 1;

            gUnknown_030030A4.bits.win0_enable_bg0 = 1;
            gUnknown_030030A4.bits.win0_enable_bg1 = 1;
            gUnknown_030030A4.bits.win0_enable_bg2 = 1;
            gUnknown_030030A4.bits.win0_enable_bg3 = 1;
            gUnknown_030030A4.bits.win0_enable_obj = 1;

            gUnknown_030030DC.bits.win0_enable_bg0 = 1;
            gUnknown_030030DC.bits.win0_enable_bg1 = 1;
            gUnknown_030030DC.bits.win0_enable_bg2 = 1;
            gUnknown_030030DC.bits.win0_enable_bg3 = 1;
            gUnknown_030030DC.bits.win0_enable_obj = 1;

            sub_0804018C(e);
        }
        else
        {
            e->unk00 = 0;
        }

        sub_080088F0();

        result = 1;
    }

    return result;
}

asm(".global sub_08008A8C\n.thumb_set sub_08008A8C, RemoveUnitAt\n");
