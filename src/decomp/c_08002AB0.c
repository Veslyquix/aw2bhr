#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08002AB0.
 * sub_08002AB0 @ 0x08002AB0, sub_08002C38 @ 0x08002C38
 */

void sub_08002AB0(void)
{
    int i;
    int j;
    int flag;
    struct Unk0200B0D0 *q;

    if (gUnknown_0200B0B0->unk00 & 0x10)
    {
        sub_0801BD00(0x78, 0x48C, (void *)gUnknown_08485B52, 0);
        if (gUnknown_0200B0B0->unk02 == 0x33)
        {
            flag = gUnknown_0200B0B0->unk07;
            j = gUnknown_0200B0B0->unk3a + 3;
            if (flag == 0)
                j = gUnknown_0200B0B0->unk3a + 4;
            if (j > 9)
                j -= 10;
            switch (gUnknown_0200B0D0[j].unk04 & 0x1F)
            {
            case 6:
            case 8:
            case 10:
            case 11:
            case 14:
                if (gUnknown_0200B0B0->unk6b == -1)
                    sub_08007B54();
                break;
            }
        }
        else
        {
            sub_08007B74();
        }
    }

    j = gUnknown_0200B0B0->unk3a;
    for (i = 9; i >= 0; i--)
    {
        q = &gUnknown_0200B0D0[j];
        j++;
        if (j > 9)
            j -= 10;
        if (q->unk00 & 1)
        {
            if (!(q->unk00 & 0x80))
                sub_08002964(q->unk06 + 1, (q->unk0c >> 8) - 4, (q->unk10 >> 8) + 0x21, q->unk04, q->unk00 & 0x20, q->unk00 & 8);
            if (!(q->unk00 & 0x40))
                sub_0800272C(q->unk06 + 1, q->unk0c >> 8, q->unk10 >> 8, q->unk04, q->unk00 & 0x10, q->unk00 & 0x100, q->unk00 & 8);
            q->unk00 &= ~8;
        }
    }
}

void sub_08002C38(void)
{
    int i;
    int j;
    struct Unk0200B0D0 *q;

    if (gUnknown_0200B0B0->unk00 & 0x10)
    {
        sub_0801BD00(0x78, 0x48C, (void *)gUnknown_08485B52, 0);
        if (gUnknown_0200B0B0->unk02 == 0x33)
        {
            j = gUnknown_0200B0B0->unk3a + 3;
            if (j > 7)
                j = gUnknown_0200B0B0->unk3a - 5;
            if (gUnknown_0200B0D0[j].unk04 != 0x19)
            {
                if (gUnknown_0200B0B0->unk6b == -1)
                    sub_08007B54();
            }
            else
            {
                sub_08007B74();
            }
        }
    }

    j = gUnknown_0200B0B0->unk3a;
    for (i = 7; i >= 0; i--)
    {
        q = &gUnknown_0200B0D0[j];
        j++;
        if (j > 7)
            j -= 8;
        if (q->unk00 & 1)
        {
            if (!(q->unk00 & 0x80))
                sub_080029F4(q->unk06 + 1, (q->unk0c >> 8) - 4, (q->unk10 >> 8) + 0x21, q->unk04, q->unk00 & 0x20, q->unk00 & 8);
            if (!(q->unk00 & 0x40))
                sub_08002844(q->unk06 + 1, q->unk0c >> 8, q->unk10 >> 8, q->unk04, q->unk00 & 0x10, q->unk00 & 0x100, q->unk00 & 8);
            q->unk00 &= ~8;
        }
    }
}
