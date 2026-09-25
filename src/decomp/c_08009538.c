#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08009538.
 * sub_08009538 @ 0x08009538
 */

#include "map.h"

/* Returns 1 when the bridge-end tile at (x, y) (0xFC/0xFD/0x11C/0x11D,
 * one per direction) has no occupied neighbour on its far side, 0 when
 * sub_080015E4 reports one.
 *
 * `keep` is pinned to r8. It stands for a second copy of each case's
 * neighbour coordinate, taken after the first call (ROM `mov r8, r4`).
 * Without the pin, `ok` loses r7 to it and the four symmetric cases
 * cross-jump (+44 bytes). Waves 37 and 80 ruled out every unpinned
 * spelling they tried. */
int sub_08009538(int x, int y)
{
    int ok = 0;
    int tile = gMap->tile[gMap->rowOffset[y] + x];
    int n;
    register int keep asm("r8");
    int r;

    switch (tile)
    {
    case 0xFC:
        if (y <= 0)
            break;
        n = y - 1;
        r = sub_080015E4(x, n);
        keep = n;
        if (r) ok = 1;
        if (ok == 0)
        {
            if (x > 0)
            {
                if (sub_080015E4(x - 1, keep)) { ok = 1; break; }
                if (sub_080015E4(x - 1, y)) ok = 1;
            }
            if (!ok && x < gMap->width - 1)
                if (sub_080015E4(x + 1, keep) || sub_080015E4(x + 1, y))
                    ok = 1;
        }
        break;
    case 0xFD:
        if (x >= gMap->width - 1)
            break;
        n = x + 1;
        r = sub_080015E4(n, y);
        keep = n;
        if (r) ok = 1;
        if (ok == 0)
        {
            if (y > 0)
            {
                if (sub_080015E4(keep, y - 1)) { ok = 1; break; }
                if (sub_080015E4(x, y - 1)) ok = 1;
            }
            if (!ok && y < gMap->height - 1)
                if (sub_080015E4(keep, y + 1) || sub_080015E4(x, y + 1))
                    ok = 1;
        }
        break;
    case 0x11C:
        if (y >= gMap->height - 1)
            break;
        n = y + 1;
        r = sub_080015E4(x, n);
        keep = n;
        if (r) ok = 1;
        if (ok == 0)
        {
            if (x > 0)
            {
                if (sub_080015E4(x - 1, keep)) { ok = 1; break; }
                if (sub_080015E4(x - 1, y)) ok = 1;
            }
            if (!ok && x < gMap->width - 1)
                if (sub_080015E4(x + 1, keep) || sub_080015E4(x + 1, y))
                    ok = 1;
        }
        break;
    case 0x11D:
        if (x <= 0)
            break;
        n = x - 1;
        r = sub_080015E4(n, y);
        keep = n;
        if (r) ok = 1;
        if (ok == 0)
        {
            if (y > 0)
            {
                if (sub_080015E4(keep, y - 1)) { ok = 1; break; }
                if (sub_080015E4(x, y - 1)) ok = 1;
            }
            if (!ok && y < gMap->height - 1)
                if (sub_080015E4(keep, y + 1) || sub_080015E4(x, y + 1))
                    ok = 1;
        }
        break;
    }

    r = 0;
    if (ok == 0)
        r = 1;
    return r;
}
