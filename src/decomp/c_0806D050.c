#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806D050.
 * sub_0806D050 @ 0x0806D050, sub_0806D0D8 @ 0x0806D0D8
 */

/* sub_0806CFC8's source with a second latch triple and sprite id 0x44 instead
 * of 0x43. 0x0816E184 / 0x0816E188 are agbcc's own -fforce-addr pool words for
 * &gUnknown_0300061C / &gUnknown_0300061E (proved against baserom.gba), not
 * globals -- see include/unknown-globals.h. */
void sub_0806D050(int a1, int a2)
{
    if (gUnknown_03000618 == gUnknown_03004008 - 1)
    {
        a1 = (gUnknown_0300061C + a1) / 2;
        a2 = (gUnknown_0300061E + a2) / 2;
    }

    sub_0801F34C(0x44, a1 & 0x1ff, a2 & 0xff, 0, 0);

    gUnknown_03000618 = gUnknown_03004008;
    gUnknown_0300061C = a1;
    gUnknown_0300061E = a2;
}

void sub_0806D0D8(struct Unk08580934_Obj *obj)
{
    obj->unk4c(obj);

    sub_0801F34C(0xc8 - Div(obj->unk2a - 0x18, 8), obj->unk28 & 0x1ff,
        (obj->unk2a - 8) & 0xff, 0, 0);

    if (obj->unk46 == 0)
        sub_0801F34C(0xd8 - Div(obj->unk2a - 0x18, 8), obj->unk28 & 0x1ff,
            obj->unk2a & 0xff, 0, 3);
    else
        sub_0801F34C(0xd8 - Div(obj->unk2a - 0x18, 8), (obj->unk28 - 0x10) & 0x1ff,
            ((obj->unk2a - 0x10) & 0xff) | 0x300, 0, 3);
}
