#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801D84C.
 * sub_0801D84C @ 0x0801D84C, sub_0801D8B4 @ 0x0801D8B4
 */

void sub_0801D84C(int a1)
{
    int i;

    gUnknown_0200E438[a1].unk08 = 0;

    if (gUnknown_03003034 == a1 + 1)
    {
        for (i = a1 - 1; i >= 0; i--)
        {
            if (gUnknown_0200E438[i].unk08 != 0)
            {
                gUnknown_03003034 = i + 1;
                break;
            }
        }
    }
}

void sub_0801D8B4(void)
{
    int i;

    gUnknown_03003034 = 0;

    for (i = 0; i < 30; i++)
        gUnknown_0200E438[i].unk08 = 0;

    sub_0801DA94();
}
