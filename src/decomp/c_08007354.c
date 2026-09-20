#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08007354.
 * sub_08007354 @ 0x08007354
 */

void sub_08007354(void)
{
    struct ActiveMap *p = gActiveMap;
    int i;

    if (p->unk07 == 0)
    {
        if (p->unk00 & 1)
            return;

        p->unk00 |= 1;

        i = p->unk3a + 4;
        if (i > 9)
            i = p->unk3a - 6;

        p->unk2c = gUnknown_0200B0D0[i].unk04;
        p->unk37 = p->unk36;
        gActiveMap->unk30 = gActiveMap->unk2e;
    }
    else
    {
        if (p->unk00 & 2)
            return;

        p->unk00 |= 2;

        i = p->unk3a + 3;
        if (i > 7)
            i = p->unk3a - 5;

        p->unk26 = gUnknown_0200B0D0[i].unk04;
        p->unk39 = p->unk38;
        gActiveMap->unk31 = gActiveMap->unk2f;
    }
}
