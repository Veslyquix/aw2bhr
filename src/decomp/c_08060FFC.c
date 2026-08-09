#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08060FFC.
 * sub_08060FFC @ 0x08060FFC
 */

struct Unk60FFCRow
{
    /* 0x00 */ u8 v[7];
    /* 0x07 */ u8 unk07;
    /* 0x08 */ u8 filler_08[4];
};
struct Unk60FFCTbl
{
    /* 0x00 */ u8 filler_00[0x14];
    /* 0x14 */ struct Unk60FFCRow rows[1];
};

u8 sub_08060FFC(void)
{
    int v;
    u8 best;
    u8 n;
    u8 i;

    v = 0xff;
    best = 0;
    n = 0;

    for (i = 1; i <= 24; i++)
    {
        if ((s16)gUnknown_03004640[i] < v)
        {
            v = (s16)gUnknown_03004640[i];
            best = i;
        }
    }

    if (v > gUnknown_085766E0->unk04[4])
        return 0xff;

    for (i = 1; i <= 24; i++)
    {
        if (v == (s16)gUnknown_03004640[i])
        {
            gUnknown_030046E0[n] = i;
            n++;
        }
    }

    if (n <= 1)
        return gUnknown_030046E0[0];

    v = 0;

    for (i = 0; i < n; i++)
    {
        if (((struct Unk60FFCTbl *)gUnknown_085766E0)->rows[gUnknown_030046E0[i] - 1].unk07 > v)
        {
            best = gUnknown_030046E0[i];
            v = ((struct Unk60FFCTbl *)gUnknown_085766E0)->rows[gUnknown_030046E0[i] - 1].unk07;
        }
    }

    return best;
}
