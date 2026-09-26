#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08086A58.
 * sub_08086A58 @ 0x08086A58
 */

/* Draws the two-row list of campaign-map entries from
 * gUnknown_02027F74.unk04[], one sub_080149C0 per row.
 *
 * Spelled like its matched sibling c_08086BF8.c: the list is read as the
 * struct member `gUnknown_02027F74.unk04[a + i]`, not through a local pointer
 * bumped by 4. With the member, the `ldr =gUnknown_02027F74` lands ahead of
 * the k-giv's zero init and the `+4` after it, which is the ROM's preheader
 * order; the reload scratch registers (the zero for r8, the sl copy, the
 * latch's #2) then come out right with no other change. Promotion needs
 * "rodata": ["0x081D9438"]. */

void sub_08086A58(int a, int n, int b)
{
    int i;
    int f;
    int y;
    int z;
    u8 c;

    sub_08013C00();

    if (gPlaySt.gameMode == 2)
    {
        for (i = 0; i < n; i++)
        {
            c = sub_0803CB24(gUnknown_02027F74.unk04[a + i]);
            f = 1;
            if (c)
                f = 0;

            if (gUnknown_02027F74.unk04[a + i] <= 0xB3 && (u8)sub_0803CA54(gUnknown_02027F74.unk04[a + i]) == 0)
            {
                int k = i * 2;
                y = b + 5;
                z = k + y;
                sub_080149C0(1, (s16)z, gUnknown_08499578,
                             gUnknown_084C3F50, 0, f);
            }
            else
            {
                u8 *p = sub_08024944(gUnknown_02027F74.unk04[a + i]);
                int k = i * 2;
                y = b + 5;
                z = k + y;
                sub_080149C0(1, (s16)z, gUnknown_08499578, p, 0, f);
            }
        }

        sub_08087548(a, n, b);
    }
    else
    {
        sub_08014A5C(1, 5, gUnknown_08499578,
                     gUnknown_08499CE4[gUnknown_0300596C], 0, 0);

        if (gUnknown_02027F74.unk37 < n)
            n = gUnknown_02027F74.unk37 + 1;

        for (i = 0; i < n; i++)
        {
            c = sub_0803CB24(gUnknown_02027F74.unk04[a + i]);
            f = 1;
            if (c)
                f = 0;

            if (gUnknown_02027F74.unk04[a + i] <= 0xB3 && (u8)sub_0803CA54(gUnknown_02027F74.unk04[a + i]) == 0)
            {
                int k = i * 2;
                y = b + 9;
                z = k + y;
                sub_080149C0(1, (s16)z, gUnknown_08499578,
                             gUnknown_084C3F50, 0, f);
            }
            else
            {
                u8 *p = sub_08024944(gUnknown_02027F74.unk04[a + i]);
                int k = i * 2;
                y = b + 9;
                z = k + y;
                sub_080149C0(1, (s16)z, gUnknown_08499578, p, 0, f);
            }
        }
    }

    sub_08013AEC();
}
