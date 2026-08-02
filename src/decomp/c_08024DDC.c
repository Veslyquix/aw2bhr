#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08024DDC.
 * sub_08024DDC @ 0x08024DDC, sub_08024E60 @ 0x08024E60
 */

/* struct Unk030013D0 lives in include/unknown-globals.h -- see the note there
 * for how each member was measured. It is shared rather than local because
 * this function's prototype names it and sub_08024E60 calls it. */

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
