#include "global.h"

/* PARKED at 542 of 544 bytes (best hand candidate; decomp-permuter reached
 * 93.9% over 300 s from here and matched nothing).
 *
 * This is sub_0800977C's twin -- see src/decomp/c_0800977C.c, which is the
 * exemplar for the whole shape: terrain byte at +0x1432, tile u16 at +0xA22,
 * `ok` knocked back down by the two sub_08009720 neighbour probes, a `cnt` of
 * matching diagonal neighbours, and `return terrain == 2 || ok;`.
 *
 * Everything structural is settled and matches:
 *   - `ok = sub_08009CF8(x, y) != 0;` gives the ROM's `rsbs; orrs; lsrs #0x1f`.
 *   - `cnt` must be declared ONCE at the `terrain == 0xC` block scope, not per
 *     arm.  Per-arm declarations give two pseudos, and then the shared
 *     `adds r6,#1; cmp r6,#1; ble` tail at _08009B06 is duplicated into the
 *     x-arm instead of being cross-jumped with the y-arm's.
 *   - Each row offset must be bound as its own statement (`t2 = (y - 1) * 2;`,
 *     `t3 = (y + 1) * 2;`).  Written inline in one expression, CSE finds the
 *     common `rows + y*2` and emits `subs r0, r3, #2` / `ldrh r0, [r3, #2]`,
 *     which the ROM does not have -- it recomputes each with `subs/lsls` and
 *     `adds/lsls` off the shared `rows`.
 *   - The 0x13/0x14 pair is one `||` written as an if/else so the second index
 *     stays lazily computed; the two `cnt = 1` stores cross-jump into one.
 *   - `off = idx * 2;` must precede `tiles = p + 0xA22;` (the exemplar
 *     c_080094EC.c ordering), otherwise the tiles pointer is materialised
 *     before the shift.
 *
 * REMAINING DIFF -- a register-allocation inversion in the y-branch only, worth
 * -2 bytes net:
 *   ROM keeps `rows` in r3 (a low scratch) and spills the CELLS POINTER to r8
 *   (`ldr r0,=0x1432; adds r0,r0,r1; mov r8,r0; add r8,r2; mov r0,r8; ldrb`),
 *   and holds `cnt` in r6.  The candidate has `cnt` in r3, which leaves r6 free,
 *   so it keeps `rows` in r8 and computes the cells pointer in r0 with two
 *   fewer instructions -- i.e. the ROM is under ONE MORE unit of low-register
 *   pressure at that point than the candidate is.  Consequences visible in the
 *   diff: `adds r0, r1, r6` where the ROM has `adds r0, r0, r1` (operand order),
 *   `mov r4, r8; lsls r0, r4, #1` where the ROM has `lsls r0, r3, #1`.
 *   The lever is whatever makes `cnt` a higher-priority allocno than `rows`;
 *   hoisting `cnt` to function scope was not tried and is the next thing to try.
 *
 * Promotion note: gUnknown_0808D820 is NOT a global.  The ROM word at
 * 0x0808D820 is 0x08499590, agbcc's -fforce-addr .rodata copy of
 * &gUnknown_08499590.  Promotion must carry "rodata": ["0x0808D820"].
 */
int sub_08009918(int x, int y)
{
    int t;
    int terrain;
    u8 ok = 0;

    {
        u8 *p;
        u8 *rows;
        u8 *cells;
        int idx;

        p = gUnknown_08499590;
        t = y * 2;
        rows = p + 0x417A;
        idx = *(u16 *)(rows + t) + x;
        cells = p + 0x1432;
        terrain = *(cells + idx);
    }

    if (terrain == 0xC)
    {
        int tile;
        int cnt;
        u8 *pe;

        ok = sub_08009CF8(x, y) != 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int off;

            p = gUnknown_08499590;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) + x) * 2;
            tiles = p + 0xA22;
            tile = *(u16 *)(tiles + off);
        }

        if (tile == 0x16 || tile == 0x36)
        {
            if (x > 0 && sub_08009720(x - 1, y))
                ok = 0;
            if (x < *(u16 *)gUnknown_08499590 - 1 && sub_08009720(x + 1, y))
                ok = 0;

            if (ok)
            {
                cnt = 0;

                if (x > 0)
                {
                    u8 *p;
                    u8 *rows;
                    u8 *cells;
                    int t2;
                    int idx;

                    p = gUnknown_08499590;
                    t2 = y * 2;
                    rows = p + 0x417A;
                    idx = *(u16 *)(rows + t2);
                    idx--;
                    idx += x;
                    cells = p + 0x1432;
                    if (*(cells + idx) == 0xC)
                    {
                        u8 *tiles;
                        int off;
                        int tl;

                        off = idx * 2;
                        tiles = p + 0xA22;
                        tl = *(u16 *)(tiles + off);
                        if (tl == 0x16 || tl == 0x36)
                            cnt = 1;
                    }
                }

                pe = gUnknown_08499590;

                if (x < *(u16 *)pe - 1)
                {
                    u8 *rows;
                    u8 *cells;
                    int t2;
                    int idx;

                    t2 = y * 2;
                    rows = pe + 0x417A;
                    idx = *(u16 *)(rows + t2);
                    idx++;
                    idx += x;
                    cells = pe + 0x1432;
                    if (*(cells + idx) == 0xC)
                    {
                        u8 *tiles;
                        int off;
                        int tl;

                        off = idx * 2;
                        tiles = pe + 0xA22;
                        tl = *(u16 *)(tiles + off);
                        if (tl == 0x16 || tl == 0x36)
                            cnt++;
                    }
                }
                if (cnt > 1)
                    ok = 0;
            }
        }
        else
        {
            if (y > 0 && sub_08009720(x, y - 1))
                ok = 0;
            if (y < *(u16 *)(gUnknown_08499590 + 2) - 1 && sub_08009720(x, y + 1))
                ok = 0;

            if (ok)
            {
                cnt = 0;

                if (y > 0)
                {
                    u8 *p;
                    u8 *rows;
                    u8 *cells;
                    int t2;
                    int idx;

                    p = gUnknown_08499590;
                    t2 = (y - 1) * 2;
                    rows = p + 0x417A;
                    idx = *(u16 *)(rows + t2) + x;
                    cells = p + 0x1432;
                    if (*(cells + idx) == 0xC)
                    {
                        u8 *tiles;
                        int off;

                        off = idx * 2;
                        tiles = p + 0xA22;
                        if (*(u16 *)(tiles + off) == 0x13)
                            cnt = 1;
                        else
                        {
                            int t3;
                            int idx2;

                            t3 = (y + 1) * 2;
                            idx2 = *(u16 *)(rows + t3) + x;
                            if (*(u16 *)(tiles + idx2 * 2) == 0x14)
                                cnt = 1;
                        }
                    }
                }

                pe = gUnknown_08499590;

                if (y < *(u16 *)(pe + 2) - 1)
                {
                    u8 *rows;
                    u8 *cells;
                    int t2;
                    int idx;

                    t2 = (y + 1) * 2;
                    rows = pe + 0x417A;
                    idx = *(u16 *)(rows + t2) + x;
                    cells = pe + 0x1432;
                    if (*(cells + idx) == 0xC)
                    {
                        u8 *tiles;
                        int t3;
                        int idx2;
                        int off2;

                        t3 = (y - 1) * 2;
                        idx2 = *(u16 *)(rows + t3) + x;
                        off2 = idx2 * 2;
                        tiles = pe + 0xA22;
                        if (*(u16 *)(tiles + off2) == 0x13)
                            cnt++;
                        else if (*(u16 *)(tiles + idx * 2) == 0x14)
                            cnt++;
                    }
                }
                if (cnt > 1)
                    ok = 0;
            }
        }
    }

    return terrain == 2 || ok;
}
