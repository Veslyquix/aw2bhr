#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08025D60.
 * sub_08025D60 @ 0x08025D60, sub_08025E08 @ 0x08025E08
 */

void sub_08025D60(int a1)
{
    struct Unk08499594 *p;
    struct Unk08499594 *q;
    int v;

    p = &gUnknown_08499594[a1];

    sub_0802A5C4(p);
    sub_08025D40((a1 >> 6) + 1);

    if (p->unk07 != 0)
    {
        q = &gUnknown_08499594[p->unk07];

        if (q->unk04_0 != 0)
            v = Div(q->unk04_0 - 1, 10) + 1;
        else
            v = 0;

        sub_08025B24(q, v);
        sub_08025D60(p->unk07);
    }

    if (p->unk08 != 0)
    {
        q = &gUnknown_08499594[p->unk08];

        if (q->unk04_0 != 0)
            v = Div(q->unk04_0 - 1, 10) + 1;
        else
            v = 0;

        sub_08025B24(q, v);
        sub_08025D60(p->unk08);
    }

    p->unk00 = 0;
}

/* Named per Xenesis's AW2 Subroutine List: "Costs for unit bought". The old
 * sub_08025E08 symbol is kept as a linker alias below so every other unit
 * keeps resolving it unchanged. */
void *BuyUnit(int a1, int a2, int a3)
{
    int cost;
    void *r;

    cost = sub_08042C9C(gUnknown_030033EC, a3) * 10;

    if (gUnknown_08499598[gUnknown_030033EC].unk00 < cost)
        return NULL;

    r = sub_08025C98(a1, a2, a3);

    if (r == NULL)
        return NULL;

    sub_08025B28(gUnknown_030033EC, cost);

    return r;
}

asm(".global sub_08025E08\n.thumb_set sub_08025E08, BuyUnit\n");
