#include "global.h"

/* PARKED (wave 37, W37-F; re-worked wave 80, W80-A). Control flow settled --
 * all four tile cases, every `||` pair and every guard match the ROM. The
 * wave-37 entry called the residual a bare r7/r8 allocno tie (`ok` vs the
 * kept neighbour coordinate). Wave 80 measured that this is NOT a tie and the
 * entry's "instruction order is already correct" was wrong in one respect:
 *
 *   - The ROM carries an EXTRA COPY after each case's first call:
 *         subs r4,r6,#1 / adds r0,r5,#0 / adds r1,r4,#0 / bl / mov r8,r4
 *     i.e. the kept coordinate is TWO pseudos -- a per-case scratch (r4) that
 *     is the call argument, and a second variable assigned FROM it AFTER the
 *     call, before the call's result is tested. A single per-case `ny` (the
 *     wave-37 draft) has no copy at all, and with `ok` losing r7 the candidate
 *     came out 448 bytes (-40): the cases then cross-jump wholesale.
 *   - The spelling below reproduces the copy (`n = y - 1; r = f(x, n);
 *     keep = n; if (r) ok = 1;`) with ONE function-scope `keep` shared by all
 *     four cases. Function-scope `nx`/`ny` (two variables) put the kept value
 *     in r5 ahead of x and y; the single `keep` lands in r7 with `ok` in r8 --
 *     still inverted against the ROM (ok r7, keep r8), so `ok` must outrank
 *     `keep` on allocno priority (refs*log2(refs)/live_length) in the original
 *     and does not here. Not found: a spelling that lowers keep's priority or
 *     raises ok's without adding instructions.
 *   - decomp-permuter (wave 80, 300 s, 4 threads, from this valid draft after
 *     best.c was found holding an INVALID 46.5% variant `ok = tile;
 *     switch (ok)` with a `volatile long nx`): best 34.4% at +56 bytes, i.e.
 *     nothing. Chaining from that result is pointless; do not.
 *
 * Ruled out by wave 37 (all leave ok in r8): nx/ny at function scope; nx/ny
 * per case; one function-scope kept var + per-case scratch WITHOUT the
 * post-call copy; `u8 ok`. Seven compiler profiles swept by the wave-80
 * orchestrator: none helps.
 *
 * Confirmed and not worth re-deriving: the tail is `r = 0; if (ok == 0)
 * r = 1; return r;` and NOT `return ok == 0;`; the `beq L; b far` pairs are
 * Thumb conditional-branch RANGE expansions (the candidate emits the same
 * `@long jump` sequences), not source; the `if (ok == 0) { if (A) {...}
 * if (ok == 0 && B) {...} }` nesting is forced by the edges.
 *
 * Promotion note: gUnknown_0808D818 is NOT a global -- the ROM word at
 * 0x0808D818 is agbcc's -fforce-addr .rodata copy of &gUnknown_08499590.
 * Promotion must carry "rodata": ["0x0808D818"]. */
int sub_08009538(int x, int y)
{
    u8 *p;
    u8 *rows;
    u8 *tiles;
    int t;
    int off;
    int tile;
    int ok = 0;
    int r;
    int keep;

    p = gUnknown_08499590;
    t = y * 2;
    rows = p + 0x417A;
    off = (*(u16 *)(rows + t) + x) * 2;
    tiles = p + 0xA22;
    tile = *(u16 *)(tiles + off);

    switch (tile)
    {
    case 0xFC:
        if (y > 0)
        {
            int n;

            n = y - 1;
            r = sub_080015E4(x, n);
            keep = n;
            if (r)
                ok = 1;
            if (ok == 0)
            {
                if (x > 0)
                {
                    n = x - 1;
                    if (sub_080015E4(n, keep) || sub_080015E4(n, y))
                        ok = 1;
                }
                if (ok == 0 && x < *(u16 *)gUnknown_08499590 - 1)
                {
                    n = x + 1;
                    if (sub_080015E4(n, keep) || sub_080015E4(n, y))
                        ok = 1;
                }
            }
        }
        break;
    case 0xFD:
        if (x < *(u16 *)gUnknown_08499590 - 1)
        {
            int n;

            n = x + 1;
            r = sub_080015E4(n, y);
            keep = n;
            if (r)
                ok = 1;
            if (ok == 0)
            {
                if (y > 0)
                {
                    n = y - 1;
                    if (sub_080015E4(keep, n) || sub_080015E4(x, n))
                        ok = 1;
                }
                if (ok == 0 && y < *(u16 *)(gUnknown_08499590 + 2) - 1)
                {
                    n = y + 1;
                    if (sub_080015E4(keep, n) || sub_080015E4(x, n))
                        ok = 1;
                }
            }
        }
        break;
    case 0x11C:
        if (y < *(u16 *)(gUnknown_08499590 + 2) - 1)
        {
            int n;

            n = y + 1;
            r = sub_080015E4(x, n);
            keep = n;
            if (r)
                ok = 1;
            if (ok == 0)
            {
                if (x > 0)
                {
                    n = x - 1;
                    if (sub_080015E4(n, keep) || sub_080015E4(n, y))
                        ok = 1;
                }
                if (ok == 0 && x < *(u16 *)gUnknown_08499590 - 1)
                {
                    n = x + 1;
                    if (sub_080015E4(n, keep) || sub_080015E4(n, y))
                        ok = 1;
                }
            }
        }
        break;
    case 0x11D:
        if (x > 0)
        {
            int n;

            n = x - 1;
            r = sub_080015E4(n, y);
            keep = n;
            if (r)
                ok = 1;
            if (ok == 0)
            {
                if (y > 0)
                {
                    n = y - 1;
                    if (sub_080015E4(keep, n) || sub_080015E4(x, n))
                        ok = 1;
                }
                if (ok == 0 && y < *(u16 *)(gUnknown_08499590 + 2) - 1)
                {
                    n = y + 1;
                    if (sub_080015E4(keep, n) || sub_080015E4(x, n))
                        ok = 1;
                }
            }
        }
        break;
    }

    r = 0;
    if (ok == 0)
        r = 1;
    return r;
}
