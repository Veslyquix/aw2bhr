#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08057D58.
 * sub_08057D58 @ 0x08057D58
 */

void *sub_08057D58(int a, int b, int c)
{
    const struct Unk085D64A8 *p;

    switch (b)
    {
    case 3:
        p = gUnknown_085D6688;
        break;
    case 2:
        p = gUnknown_085D6868;
        break;
    default:
        p = gUnknown_085D64A8;
        break;
    }
    return p[a].unk00[c];
}
