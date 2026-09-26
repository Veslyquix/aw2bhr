#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08020EDC.
 * sub_08020EDC @ 0x08020EDC
 */

#include "map.h"

/* sub_08020B88's twin against a caller-supplied u8 plane: same Manhattan-disk
 * walk, but every visited cell gets `buf[off] += d` instead of an overlay write,
 * and r == 0 short-circuits to the single centre cell.
 *
 * MATCHED wave 90 (W90-C), from the 90.7% park, by four changes:
 *   - every map access through the struct members, spelled like the sibling
 *     sub_08020B88 (c_08020984.c): `gMap->rowOffset[yy] + xx` with the row
 *     FIRST, `gMap->terrain[off]`, `gMap->unitUnk[off]` (0x51A; `unit` is
 *     0x12), `gMap->width` / `gMap->height`. That removed the p/rows/cells/ids
 *     pointer locals and put y in r5 as the ROM has it (98.4%).
 *   - `s8 d`: with `u8 d` the two `+= d` adds come out as `d + v`; the ROM
 *     has `v + d`. Same low byte either way.
 *   - the 6th parameter is `int`, not `u8`: a u8 formal is narrowed in the
 *     prologue ahead of `d = delta;`, the ROM narrows it at `f = flags;`.
 *     include/unknown-functions.h and the caller c_080210C8.c were changed to
 *     match (explicit `(u8)a6` there, re-verified by exit code).
 * Both stack parameters are copied into locals: the ROM's slot order (d at
 * sp+0xc, f at sp+0x10) is local-declaration order.
 * `ty = terrain & 0x1f; t = ty;` is the wave-73 live-range split, still needed. */
void sub_08020EDC(s16 x, s16 y, s16 r, u8 *buf, int delta, int flags)
{
    s8 d;
    u8 f;
    s16 xx;
    s16 yy;
    s16 dy;
    int off;
    int ty;
    int t;
    struct Unit *unit;

    d = delta;
    f = flags;

    if (r == 0)
    {
        buf[gMap->rowOffset[y] + x] += d;
        return;
    }

    dy = -r;

    for (yy = y - r; yy <= y + r; yy++, dy++)
    {
        if (yy < 0)
            continue;
        if (yy >= gMap->height)
            continue;

        for (xx = x - r + (dy < 0 ? -dy : dy);
             xx <= x + r - (dy < 0 ? -dy : dy);
             xx++)
        {
            if (xx < 0)
                continue;
            if (xx >= gMap->width)
                continue;

            if ((sub_08043050(f) & 8) == 0
             && (xx - x < 0 ? x - xx : xx - x)
              + (yy - y < 0 ? y - yy : yy - y) > 1)
            {
                off = xx + gMap->rowOffset[yy];
                ty = gMap->terrain[off] & 0x1f;
                t = ty;
                if (t == 4 || t == 0x13)
                {
                    if (gMap->unitUnk[off] == 0)
                        continue;
                    if ((u8)((unit = &gUnknown_08499594[gMap->unitUnk[off]])->type - 0x10) > 4)
                        continue;
                }
            }

            buf[gMap->rowOffset[yy] + xx] += d;
        }
    }
}
