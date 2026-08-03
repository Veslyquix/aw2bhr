#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803E354.
 * sub_0803E354 @ 0x0803E354, sub_0803E388 @ 0x0803E388
 */

struct Unk02028360 *sub_0803E354(int a1)
{
    struct Unk02028360 *p;

    for (p = gUnknown_02028360; p->unk02_6 != 0; p++)
    {
        if (p->unk02_6 == a1)
            return p;
    }
    return NULL;
}

bool8 sub_0803E388(int a1)
{
    struct Unk02028360 *p;
    int n;

    n = 0;
    for (p = gUnknown_02028360; p->unk02_6 != 0; p++)
    {
        if (p->unk02_6 == a1)
        {
            switch (a1)
            {
            case 1:
            case 3:
            case 4:
            case 5:
                if (p->unk04 != 0)
                    n++;
                break;
            default:
                n++;
                break;
            }
        }
    }
    if (n != 0)
        return TRUE;
    return FALSE;
}
