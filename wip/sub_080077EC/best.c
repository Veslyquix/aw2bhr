#include "global.h"

/* Residual 2 (the ROM's dead `(s8)p->unk36 + i`) is solved -- see
 * work/sub_080079B8/sub_080079B8.c, which matched with the same vehicle:
 * a loop whose body is dead keeps the computation alive past agbcc's only DCE
 * pass. `if (m == 0) dead;` does not; `while (m == 0) m = 1;` does. */

void sub_080077EC(int a1, int a2)
{
    int i, k;
    int idx;

    gUnknown_0200B0B0->unk2e = a2;
    for (i = 9; i <= 13; i++)
    {
        gUnknown_0200B224[i].unk00 = gUnknown_084887AC[(i - 9) * 10 + a2 * 2];
        gUnknown_0200B224[i].unk02 = gUnknown_084887AC[(i - 9) * 10 + a2 * 2 + 1];
    }

    switch (a1 & 0x1F)
    {
    case 6:
        i = 3;
        break;
    case 8:
        i = 4;
        break;
    case 10:
        i = 1;
        break;
    case 11:
        i = 0;
        break;
    case 14:
        i = 2;
        break;
    }

    for (k = 0; k < 5; k++)
    {
        struct Unk0200B0B0 *p;
        int m;

        p = gUnknown_0200B0B0;
        idx = p->unk3a + i;
        if (idx > 9)
            idx -= 10;
        m = (s8)p->unk36 + i;
        while (m == 0)
            m = 1;
        gUnknown_0200B0D0[idx].unk04 = gUnknown_0200B224[k + 9].unk00;
        i++;
    }
}
