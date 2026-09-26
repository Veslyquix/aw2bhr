#include "global.h"

/* A map-edge predicate: "does the bridge/river tile at (x, y) connect to a
 * compatible neighbour?". Returns 1 or 0 and calls nothing.
 *
 * The cell access is c_08001158.c's idiom, re-derived per access because each
 * one sits in its own basic block and CSE does not carry the global's value
 * across a merge -- the ROM reloads gUnknown_08499590 through this unit's own
 * -fforce-addr pool word (kept in ip) at every use.
 *
 * The long `||` chains are literal source order: agbcc folds only the FIRST
 * adjacent pair of a left-associative chain into a range test, which is why
 * `v == 322 || v == 323` becomes `(unsigned)(v - 322) <= 1` while the 320/321
 * pair two terms later stays two compares. Read backwards, a range test at the
 * head of a compare chain and plain compares after it fixes the source order of
 * the whole chain.
 *
 * The trailing constants are agbcc chaining one live constant rather than
 * rematerialising each: 323, +0x1d -> 352, +1 -> 353, +2 -> 355, -0x40 -> 291,
 * -0x20 -> 259, -1 -> 258. Nothing in the source distinguishes that from
 * writing the literals.
 * * ===================== STATE: NOT MATCHED ==============================
 * Wave 20 (W20-B). 600 candidate instructions against the target's 544, and
 * the residual is REGISTER PRESSURE, not structure. Evidence that the body is
 * right:
 *   - the whole compare tail is instruction-identical, including agbcc's
 *     constant chain (`adds #29`, `adds #1`, `adds #2`, `subs #64`,
 *     `subs #32`, `subs #1`) and all four pool words (0x417a, 0xa22,
 *     0xfffffebf, 0x143), in the same order;
 *   - the `-fforce-addr` double indirection at the head reproduces from the
 *     honest spelling;
 *   - every branch target and every compare constant lines up.
 * The one difference that propagates: the candidate needs SIX callee-saved
 * registers where the ROM needs five -- it pushes r9/sb as well as r8, so the
 * prologue is `mov r7,sl; mov r6,sb; push {r6,r7}` against the ROM's
 * `mov r7,r8; push {r7}`, and the extra spill/reload accounts for the 56
 * instructions. The ROM keeps exactly three things live across the whole body:
 * `ip` = the ADDRESS of this unit's -fforce-addr pool word, r5 = x, r4 = y.
 *
 * RULED OUT (measured, each a full probe round):
 *   - function-scope `p`/`rows`/`tiles`/`t`/`off` reused across all 13 accesses
 *     (608 insns, three extra high registers) -- worse;
 *   - the same five bound in a BLOCK per access, 13 blocks (600) -- better by
 *     8 instructions and the shape this file now carries;
 *   - `n` block-scoped per branch rather than function-scope (600) -- exactly
 *     byte-neutral, so `n` is not the extra live value.
 *   - the c_local recipe with `pp = &gUnknown_08499590` bound once and `*pp`
 *     at each access: 574 instructions, the BEST score seen -- and WRONG. It
 *     scores better while emitting only TWO indirections at the head where the
 *     ROM has three, i.e. it buys 26 instructions by dropping a level of the
 *     model. Wave 18's warning ("a lever that appears to work may be paying for
 *     a wrong aggregate type elsewhere") applies verbatim to pointer depth.
 *   - declaring the pool word `u8 **const gUnknown_0808D898` and writing
 *     `*gUnknown_0808D898`: 602 instructions and FOUR indirections -- agbcc
 *     force-addrs the declared symbol's address on top. So the pool word must
 *     NOT be declared; the honest `gUnknown_08499590` is what supplies the
 *     ROM's middle level, and this file now carries that spelling.
 * NEXT AXIS, untried: the extra live value is not `n`, not the access locals'
 * scope and not the pointer spelling -- all three are measured above. The
 * remaining candidate is `v`: the ROM may re-read the centre cell in each
 * branch instead of holding it across the whole dispatch, which would free the
 * sixth callee-saved register. That is one probe and it was not reached.
 * =======================================================================
 */

int sub_0800F8D4(int x, int y)
{
    int v;

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int t;
        int off;

        p = gUnknown_08499590;
        t = y * 2;
        rows = p + 0x417A;
        off = (*(u16 *)(rows + t) + x) * 2;
        tiles = p + 0xA22;
        v = *(u16 *)(tiles + off);
    }

    if (v != 322 && v != 323 && v != 320 && v != 321 && v != 352 && v != 353
        && v != 354 && v != 355 && v != 290 && v != 291 && v != 289 && v != 288
        && v != 259 && v != 258)
        return 0;

    if (v == 322 || v == 354)
    {
        u16 n;

        if (x - 1 < 0)
            return 0;

        if (x + 1 >= *(u16 *)gUnknown_08499590)
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = y * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) - 1 + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n != 322 && n != 320 && n != 352 && n != 354 && n != 290
            && n != 289 && n != 288)
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = y * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) + 1 + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n == 321 || n == 322 || n == 353 || n == 354 || n == 290
            || n == 289 || n == 288)
            return 1;

        return 0;
    }

    if (v == 323 || v == 355)
    {
        u16 n;

        if (y - 1 < 0)
            return 0;

        if (y + 1 >= *(u16 *)(gUnknown_08499590 + 2))
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = (y - 1) * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n != 323 && n != 320 && n != 321 && n != 355 && n != 291
            && n != 259 && n != 258)
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = (y + 1) * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n == 323 || n == 352 || n == 353 || n == 355 || n == 291
            || n == 259 || n == 258)
            return 1;

        return 0;
    }

    if (v == 353)
    {
        u16 n;

        if (x - 1 < 0)
            return 0;

        if (y - 1 < 0)
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = y * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) - 1 + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n != 322 && n != 320 && n != 352 && n != 354 && n != 290
            && n != 289 && n != 288)
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = (y - 1) * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n == 323 || n == 320 || n == 321 || n == 355 || n == 291
            || n == 259 || n == 258)
            return 1;

        return 0;
    }

    if (v == 321)
    {
        u16 n;

        if (x - 1 < 0)
            return 0;

        if (y + 1 >= *(u16 *)(gUnknown_08499590 + 2))
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = y * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) - 1 + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n != 322 && n != 320 && n != 352 && n != 354 && n != 290
            && n != 289 && n != 288)
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = (y + 1) * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n == 323 || n == 352 || n == 353 || n == 355 || n == 291
            || n == 259 || n == 258)
            return 1;

        return 0;
    }

    if (v == 352)
    {
        u16 n;

        if (x + 1 >= *(u16 *)gUnknown_08499590)
            return 0;

        if (y - 1 < 0)
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = y * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) + 1 + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n != 321 && n != 322 && n != 353 && n != 354 && n != 290
            && n != 289 && n != 288)
            return 0;

        {
            u8 *p;
            u8 *rows;
            u8 *tiles;
            int t;
            int off;

            p = gUnknown_08499590;
            t = (y - 1) * 2;
            rows = p + 0x417A;
            off = (*(u16 *)(rows + t) + x) * 2;
            tiles = p + 0xA22;
            n = *(u16 *)(tiles + off);
        }

        if (n == 323 || n == 320 || n == 321 || n == 355 || n == 291
            || n == 259 || n == 258)
            return 1;

        return 0;
    }

    if (v != 320)
        return 0;

    {
        u16 n;

    if (x + 1 >= *(u16 *)gUnknown_08499590)
        return 0;

    if (y + 1 >= *(u16 *)(gUnknown_08499590 + 2))
        return 0;

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int t;
        int off;

        p = gUnknown_08499590;
        t = y * 2;
        rows = p + 0x417A;
        off = (*(u16 *)(rows + t) + 1 + x) * 2;
        tiles = p + 0xA22;
        n = *(u16 *)(tiles + off);
    }

    if (n != 321 && n != 322 && n != 353 && n != 354 && n != 290
        && n != 289 && n != 288)
        return 0;

    {
        u8 *p;
        u8 *rows;
        u8 *tiles;
        int t;
        int off;

        p = gUnknown_08499590;
        t = (y + 1) * 2;
        rows = p + 0x417A;
        off = (*(u16 *)(rows + t) + x) * 2;
        tiles = p + 0xA22;
        n = *(u16 *)(tiles + off);
    }

    if (n == 323 || n == 352 || n == 353 || n == 355 || n == 291
        || n == 259 || n == 258)
        return 1;

    return 0;
    }
}
