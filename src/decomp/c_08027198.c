#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08027198.
 * sub_08027198 @ 0x08027198
 */

int sub_08027198(int a1)
{
    int i;

    for (i = 1; i <= 4; i++)
    {
        if (gUnknown_08499598[i].unk1b != 0 && gUnknown_08499598[i].unk1a == a1)
            return i;
    }
}
