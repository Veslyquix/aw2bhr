#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08009BF4.
 * sub_08009BF4 @ 0x08009BF4, sub_08009CF8 @ 0x08009CF8
 */

/* Wave 57 (W57-A). Neighbour-count on the typed gMap alias, the same
 * rowOffset/terrain idiom as the promoted sub_08009B38 in
 * src/decomp/c_08009B38.c 188 bytes below.
 *
 * `mov r7, sb; mov r6, r8` is not a loop -- it is five live values: x, y, the
 * count, the neighbour row, and the cached map pointer that survives each
 * sub_080094EC call.
 *
 * The per-block scoping of p/rows/cells/t/idx is load-bearing, not style: one
 * function-level `p` assigned in all four blocks is a multi-block pseudo, which
 * local_alloc skips, and the ROM's `adds r1,r1,r2` (cells overwriting the dead
 * p) plus its in-place `adds r0,r0,r5` (idx tied to the ldrh result) are
 * exactly local_alloc's reuse-the-dying-register tie.  Hoisting `t = yy * 2`
 * to its own statement ahead of `rows` is what puts the `lsls` before the
 * 0x417A pool load, as in the exemplar. */
int sub_08009BF4(int x, int y)
{
    int n;
    int yy;

    n = 0;
    if (y > 0)
    {
        yy = y - 1;
        if (sub_080094EC(x, yy) == 0)
        {
            struct Map *p;
            u8 *rows, *cells;
            int t, idx;

            p = gMap;
            t = yy * 2;
            rows = (u8 *)p->rowOffset;
            idx = *(u16 *)(rows + t) + x;
            cells = p->terrain;
            if (*(cells + idx) == 2)
                n++;
        }
    }
    if (y < gMap->height - 1)
    {
        yy = y + 1;
        if (sub_080094EC(x, yy) == 0)
        {
            struct Map *p;
            u8 *rows, *cells;
            int t, idx;

            p = gMap;
            t = yy * 2;
            rows = (u8 *)p->rowOffset;
            idx = *(u16 *)(rows + t) + x;
            cells = p->terrain;
            if (*(cells + idx) == 2)
                n++;
        }
    }
    if (x > 0)
    {
        if (sub_080094EC(x - 1, y) == 0)
        {
            struct Map *p;
            u8 *rows, *cells;
            int t, idx;

            p = gMap;
            t = y * 2;
            rows = (u8 *)p->rowOffset;
            idx = *(u16 *)(rows + t) + (x - 1);
            cells = p->terrain;
            if (*(cells + idx) == 2)
                n++;
        }
    }
    if (x < gMap->width - 1)
    {
        if (sub_080094EC(x + 1, y) == 0)
        {
            struct Map *p;
            u8 *rows, *cells;
            int t, idx;

            p = gMap;
            t = y * 2;
            rows = (u8 *)p->rowOffset;
            idx = *(u16 *)(rows + t) + (x + 1);
            cells = p->terrain;
            if (*(cells + idx) == 2)
                n++;
        }
    }
    return n;
}

/* Wave 57 (W57-A). sub_08009BF4's neighbour count with a two-value terrain
 * test (2 or 0xC) and the map read hoisted AHEAD of the sub_080094EC call
 * instead of after it -- which is why the terrain byte lands in a
 * callee-saved register here and does not in sub_08009BF4. Same typed gMap
 * rowOffset/terrain idiom as src/decomp/c_08009B38.c.
 *
 * NOT a twin of sub_08009BF4 despite both being exactly 260 bytes: 120 vs 121
 * instructions, the call/read order is reversed, and only this one needs the
 * 0xC case.  See the scoping note in work/sub_08009BF4/sub_08009BF4.c for why
 * p/rows/cells/t/idx are declared per block. */
int sub_08009CF8(int x, int y)
{
    int terrain;
    int n;

    n = 0;
    if (y > 0)
    {
        struct Map *p;
        u8 *rows, *cells;
        int t, idx, yy;

        p = gMap;
        yy = y - 1;
        t = yy * 2;
        rows = (u8 *)p->rowOffset;
        idx = *(u16 *)(rows + t) + x;
        cells = p->terrain;
        terrain = *(cells + idx);
        if (sub_080094EC(x, yy) == 0 && (terrain == 2 || terrain == 0xC))
            n++;
    }
    {
        struct Map *p;
        u8 *rows, *cells;
        int t, idx, yy;

        p = gMap;
        if (y < p->height - 1)
        {
            yy = y + 1;
            t = yy * 2;
            rows = (u8 *)p->rowOffset;
            idx = *(u16 *)(rows + t) + x;
            cells = p->terrain;
            terrain = *(cells + idx);
            if (sub_080094EC(x, yy) == 0 && (terrain == 2 || terrain == 0xC))
                n++;
        }
    }
    if (x > 0)
    {
        struct Map *p;
        u8 *rows, *cells;
        int t, idx;

        p = gMap;
        t = y * 2;
        rows = (u8 *)p->rowOffset;
        idx = *(u16 *)(rows + t) + (x - 1);
        cells = p->terrain;
        terrain = *(cells + idx);
        if (sub_080094EC(x - 1, y) == 0 && (terrain == 2 || terrain == 0xC))
            n++;
    }
    {
        struct Map *p;
        u8 *rows, *cells;
        int t, idx;

        p = gMap;
        if (x < p->width - 1)
        {
            t = y * 2;
            rows = (u8 *)p->rowOffset;
            idx = *(u16 *)(rows + t) + (x + 1);
            cells = p->terrain;
            terrain = *(cells + idx);
            if (sub_080094EC(x + 1, y) == 0 && (terrain == 2 || terrain == 0xC))
                n++;
        }
    }
    return n;
}
