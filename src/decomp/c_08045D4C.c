#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08045D4C.
 * sub_08045D4C @ 0x08045D4C
 */

int sub_08045D4C(void)
{
    int x;
    int y;
    int side;
    int c;
    int oleft;
    int oright;

    x = gUnknown_030040D8->unk02;
    y = gUnknown_030040D8->unk03;

    switch (gUnknown_08499598[(((struct Unk08499594 *)gUnknown_030040D8
                                - gUnknown_08499594) >> 6) + 1].unk1a)
    {
    case 3:
        side = 1;
        break;
    case 1:
        side = 3;
        break;
    default:
        return 0;
    }

    if (y > 0)
    {
        c = gMap->unk051A[
                gMap->rowOffset[y - 1] + x];
        if (c != 0 && gUnknown_08499598[(c >> 6) + 1].unk1a == side)
            return 1;
    }

    if (y < gMap->height - 1)
    {
        c = gMap->unk051A[
                gMap->rowOffset[y + 1] + x];
        if (c != 0 && gUnknown_08499598[(c >> 6) + 1].unk1a == side)
            return 1;
    }

    if (x > 0)
    {
        oleft = gMap->rowOffset[y] - 1;
        c = gMap->unk051A[oleft + x];
        if (c != 0 && gUnknown_08499598[(c >> 6) + 1].unk1a == side)
            return 1;
    }

    if (x < gMap->width - 1)
    {
        oright = gMap->rowOffset[y] + 1;
        c = gMap->unk051A[oright + x];
        if (c != 0 && gUnknown_08499598[(c >> 6) + 1].unk1a == side)
            return 1;
    }

    return 0;
}
