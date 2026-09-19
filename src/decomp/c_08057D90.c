#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08057D90.
 * sub_08057D90 @ 0x08057D90
 */

/* Scans the whole map for the reachable cell with the lowest cost byte and
 * writes its (x, y) back through the two out-parameters, after running two
 * map-plane setups and one indirect draw call.
 *
 * Uses `gMap` (include/map.h), the typed linker alias for `gUnknown_08499590`
 * -- but the two `sub_0801F92C` calls must spell it `(u8 *)gMap + offset`,
 * not `gUnknown_08499590 + offset`. agbcc's CSE unifies repeated loads of the
 * SAME symbol, not two symbols that happen to share an address: casting the
 * setup calls to `gMap` too lets the compiler reuse the one pointer load for
 * the whole function, exactly as it did with the raw symbol before the
 * struct-typed rewrite. Mixing the two spellings forces a second, separate
 * pool load and permanently breaks the match.
 *
 *  - the planes must be STRUCT MEMBERS. `gMap[0x12 + idx]` on a bare `u8 *`
 *    would fold 0x12 into ldrb's displacement (`ldrb r0,[r1,#18]`), where the
 *    ROM computes `(map + 0x12) + idx`; `map->unk0012[idx]` is the spelling
 *    that keeps the constant on the base. Same for +0x2D5A.
 *  - `map->rowOffset[y]` likewise: reassociating to `(map + y*2) + 0x417A`
 *    is the wrong way round.
 *  - `map` is bound INSIDE the innermost `if`, not before the loops: the ROM
 *    reloads the pointer once per accepted cell and CSEs the three uses
 *    within it. A binding outside the loops loads it once for the function.
 *
 * The loop counters are `s16` (the `lsl #16 / asr #16` biv) and the two winners
 * are `u16` locals in promoted SImode stack slots -- which is what makes
 * `bx = x` a zero-extending `lsrs` rather than a sign-extending `asrs`.
 *
 * MATCHED. */
void sub_08057D90(s16 *px, s16 *py)
{
    struct Map *map;
    s16 x;
    s16 y;
    u16 bx;
    u16 by;
    int best;
    int idx;
    int v;

    bx = 0;
    by = 0;

    sub_0801F92C((u8 *)gMap + 0x2D5A);
    gUnknown_030013EC(*px, *py, gUnknown_030040D8->unk00, 0x78, by);
    sub_0801F92C((u8 *)gMap + 0x2852);
    sub_080202A4(gUnknown_030040D8);

    best = 0x7FFF;

    for (y = 0; y < gMap->height; y++)
    {
        for (x = 0; x < gMap->width; x++)
        {
            if ((s8)gUnknown_03003340[y][x] >= 0)
            {
                map = gMap;
                idx = map->rowOffset[y] + x;
                if (map->unk0012[idx] == 0)
                {
                    v = map->unk2D5A[idx];
                    if (v <= best)
                    {
                        best = v;
                        bx = x;
                        by = y;
                    }
                }
            }
        }
    }

    *px = bx;
    *py = by;
}
