#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044854.
 * sub_08044854 @ 0x08044854
 */

/* MATCHED. Byte-for-byte the same function as sub_08026100. Read that one --
 * the comma chain in the index expression is three separate position readouts
 * and none of them is guessable. */
void sub_08044854(int x, int y, int c)
{
    int idx;
    struct Unk08499594 *u;
    struct Unk08499594 **pp;

    if (x < 0)
        return;
    if (y < 0)
        return;

    if (x >= gMap->width)
        return;
    if (y >= gMap->height)
        return;

    u = &gUnknown_08499594[(pp = &gUnknown_08499594,
        idx = gMap->rowOffset[y] + x,
        gMap->unitUnk[idx])];

    if (u->unk00 == 0)
        return;
    if ((u->unk01 & 8) != 0)
        return;

    if (u->unk04_0 < c + 1)
        u->unk04_0 = 1;
    else
        u->unk04_0 = u->unk04_0 - c;
}
