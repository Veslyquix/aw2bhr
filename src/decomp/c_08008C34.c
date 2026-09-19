#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08008C34.
 * sub_08008C34 @ 0x08008C34, sub_08008C7C @ 0x08008C7C
 */

/* The c_08008B70.c idiom: the element address is split out statement by
 * statement so the pointer global's deref lands before the stride multiply. */
int sub_08008C34(int x, int y)
{
    int idx;

    idx = gMap->rowOffset[y] + x;

    if (gMap->terrain[idx] == 0xc && sub_08008C7C(x, y) != 0)
        return 1;
    return 0;
}

/* The index is SCALED before the +0xA22 base is formed: written
 * `*(u16 *)(tiles + idx * 2)` with `tiles` bound first, the base add lands
 * ahead of the `lsls #1` and the final add accumulates into the wrong
 * register. */
int sub_08008C7C(int x, int y)
{
    int idx;
    int v;

    idx = gMap->rowOffset[y] + x;
    v = gMap->tile[idx];

    if (v == 0x13 || v == 0x16)
        return 0;
    return 1;
}
