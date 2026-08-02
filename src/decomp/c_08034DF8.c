#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034DF8.
 * sub_08034DF8 @ 0x08034DF8
 */

void sub_08034DF8(void)
{
    if (sub_08019260())
        return;

    if (sub_08015BD0((s32)gUnknown_0849A00C) != -1)
        return;

    sub_0801B780(0);

    if (gUnknown_03003FC0.unk32 == 0
     || gUnknown_08499598[gUnknown_030033EC].unk1b == 1)
    {
        sub_08029088(gUnknown_08499598[gUnknown_030033EC].unk2f,
                     gUnknown_08499598[gUnknown_030033EC].unk30);
    }

    if (sub_08015BD0((s32)gUnknown_0849A00C) == -1)
    {
        sub_08043DAC(gUnknown_030033EC);
        sub_0802BB98();
        sub_080351F0();
        gUnknown_030032D8 = 7;
    }
}
