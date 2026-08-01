#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804247C.
 * sub_0804247C @ 0x0804247C
 */

/* The c_08001158.c map-cell idiom: gUnknown_08499590 is a `u8 *` whose +0x417A
 * is a table of per-row halfword offsets and whose +0x1432 is the cell array
 * this one reads (c_08001158.c uses +0xA22 for tiles). The four locals are what
 * keep the two constants in their own pool words and the adds on the base,
 * rather than folding into the load displacement. */
int sub_0804247C(s16 a, s16 b)
{
    u8 *p;
    u8 *rows;
    u8 *cells;
    int t;
    int off;

    p = gUnknown_08499590;
    t = b * 2;
    rows = p + 0x417a;
    off = *(u16 *)(rows + t) + a;
    cells = p + 0x1432;

    if ((cells[off] & 0x1f) == 0x11)
        return 1;
    else
        return 0;
}
