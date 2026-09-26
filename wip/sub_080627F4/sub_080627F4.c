#include "global.h"

/* WAVE 86 (W86-A).  NAMED ACTION FROM W84-B COMPLETED AND REFUTED AS A ROUTE.
 * The W56-F gcse-pre insn-count lever DOES reach this function -- W84-B was
 * right about that -- but the reachable set is exactly TWO slot layouts and
 * neither is the ROM's.  38 spellings swept (see W86-notes.md).  The three
 * spilled values are P = the `t*0x40 + 0x40` bound temp, Q = the `t*0x40`
 * temp, R = `u`.  ROM = {Q@0x10, R@0x14, P@0x18}; every 0- or 1-split
 * spelling = {P@0x10, R@0x14, Q@0x18} (6 bytes); every 2-split spelling
 * (`(e->unk02 >> 1) >> 1` at BOTH x and y) = {Q@0x10, P@0x14, R@0x18}
 * (also 6 bytes).  Only a SIGNED right-shift-of-right-shift survives to gcse;
 * `(a << 1) >> 1`, `(t * 0x20) << 1`, `(t << 5) << 1`, `+0x20+0x20`, `& 3 & 1`
 * and every address-scaling respelling of `&gUnknown_08499594[u]` all fold
 * BEFORE gcse and are byte-identical, so no third insn count is reachable
 * from this body.  Residual unchanged: 6/752 at +0x3e, +0x4e, +0x5e, +0x62,
 * +0x2c8, +0x2d2.
 *
 * WAVE 77 (W77-M).  The ROM's `t * 0x40` spill is NOT a source local: an
 * explicit `base = t * 0x40;` used as the inner loop's init and bound is 469
 * bytes with the declaration first and 466 with it last, and an absolute inner
 * bound `(t + 1) * 0x40` is 491.  Declaring an unused extra local alone stays
 * byte-neutral at 6. */

void sub_080627F4(u8 a1)
{
    int t;
    int u;
    int m;
    struct Unit *e;
    int bit;
    int c;
    int x;
    int y;
    u32 v;

    for (t = 0; t <= 3; t++) {
        bit = (gPlayers[gUnknown_030033EC].unk2c >> t) & 1;
        if (a1 == 1 && bit == 1)
            continue;
        if (a1 == 0 && bit == 0)
            continue;
        for (u = t * 0x40; u < t * 0x40 + 0x40; u++) {
            e = &gUnknown_08499594[u];
            if (e->type == 0)
                continue;
            for (m = 1; m <= 0x18; m++) {
                switch (gUnknown_085D5ABC[e->type].deployLocation - 1) {
                case 0:
                    c = 0;
                    break;
                case 1:
                    c = 1;
                    break;
                case 3:
                    c = 2;
                    break;
                case 15:
                    c = 3;
                    break;
                case 31:
                    c = 4;
                    break;
                default:
                    continue;
                }
                v = e->hp
                    * sub_08043070(gPlayers[gUnknown_030033EC].co,
                                   gPlayers[gUnknown_030033EC].coMode,
                                   m, e->type, 0);
                x = e->x >> 2;
                y = e->y >> 2;
                if (gUnknown_085D5ABC[e->type].minRange == 1) {
                    gUnknown_0202DAD8[y][x].unk00[bit * 5 + c] += v;
                    if (y > 0)
                        gUnknown_0202DAD8[y - 1][x].unk00[bit * 5 + c] += v >> 1;
                    if (y <= 8)
                        gUnknown_0202DAD8[y + 1][x].unk00[bit * 5 + c] += v >> 1;
                    if (x > 0)
                        gUnknown_0202DAD8[y][x - 1].unk00[bit * 5 + c] += v >> 1;
                    if (x <= 0xa)
                        gUnknown_0202DAD8[y][x + 1].unk00[bit * 5 + c] += v >> 1;
                } else {
                    gUnknown_0202DAD8[y][x].unk00[bit * 5 + c] += v >> 2;
                    if (y > 0)
                        gUnknown_0202DAD8[y - 1][x].unk00[bit * 5 + c] += v;
                    if (y <= 8)
                        gUnknown_0202DAD8[y + 1][x].unk00[bit * 5 + c] += v;
                    if (x > 0)
                        gUnknown_0202DAD8[y][x - 1].unk00[bit * 5 + c] += v;
                    if (x <= 0xa)
                        gUnknown_0202DAD8[y][x + 1].unk00[bit * 5 + c] += v;
                }
            }
        }
    }
}
