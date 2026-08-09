#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08087A10.
 * sub_08087A10 @ 0x08087A10
 */

struct Unk08087A10
{
    /* 0x00 */ u8 filler_00[0x54];
    /* 0x54 */ int unk54;
};

void sub_08087A10(struct Unk08087A10 *proc)
{
    int v;
    int i;

    v = proc->unk54;

    sub_0801F34C(0x61, 0xb8, 0x20, 0, 2);
    sub_0801F34C(0x60, 0xd8, 0x20, 0, 2);

    for (i = 0; i <= 4; i++)
        sub_0801F34C(i + 0x6a, 0x70, i * 0x10 + 0x28, 0, 2);

    if (gUnknown_0200C078[gUnknown_02027F74.unk04[v] - 0x6c].unk00[0].unk00_08 == 0)
        return;

    for (i = 0; i <= 4; i++)
    {
        if (gUnknown_0200C078[gUnknown_02027F74.unk04[v] - 0x6c].unk00[i].unk00_08 != 0)
        {
            sub_08087B20(0xc4, i * 0x10 + 0x28,
                gUnknown_0200C078[gUnknown_02027F74.unk04[v] - 0x6c].unk00[i].unk00_08,
                0x79);
            sub_08087B20(0xe4, i * 0x10 + 0x28,
                gUnknown_0200C078[gUnknown_02027F74.unk04[v] - 0x6c].unk00[i].unk00_14,
                0x6f);
            sub_0804402C(0xa0, i * 0x10 + 0x38,
                0x400 | ((i + 0xa) << 12) | (i * 0xc + 0xb4), 6);
        }
    }
}
