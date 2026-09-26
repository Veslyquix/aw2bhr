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
 * * ===================== STATE: NOT MATCHED, 11.3% =======================
 * Wave 20 (W20-B), second pass. 1,276 bytes against 1,136 (+140).
 *
 * SETTLED, and none of it should be re-derived:
 *   - the whole control-flow skeleton: one 14-term dispatch on the centre cell,
 *     then six branches (322|354, 323|355, 353, 321, 352, 320), each of them
 *     two bounds guards + a 7-term neighbour chain + a second 7-term chain;
 *   - every compare constant, extracted mechanically rather than read: the ROM
 *     chains ONE live constant through the whole tail (0x143, +0x1d -> 352,
 *     +1 -> 353, +2 -> 355, -0x40 -> 291, -0x20 -> 259, -1 -> 258) and the
 *     branch tails jump INTO that chain after an adjusting `adds`/`subs`, so a
 *     chain's constants cannot be read off the immediates alone -- see the
 *     symbolic dump in _symtrace.txt and the extractor in tools/symtrace.py;
 *   - the pointer model: `p = gUnknown_08499590` honestly gives the ROM's THREE
 *     indirections. Measured alternatives are both wrong (see below);
 *   - `u16` for the neighbour value and `int` for the centre value: 11.3%
 *     against 9.3% for both-int and 9.7% for both-u16, and it is the `(u16)`
 *     truncation on the `(n - 321) <= 1` range test that predicts it -- the
 *     centre cell's equivalent range test has NO truncation, which is what says
 *     the two are different types rather than one.
 *
 * CORRECTED ON THIS PASS, and it is the reason a first-pass reading is not
 * trustworthy here: branch 322|354's second chain was transcribed as
 * `... || n == 259 || n == 258` and is really `... || n == 289 || n == 288`.
 * The wrong version SCORED BETTER (600 insns vs 607) because 259/258 happen to
 * be the shared tail's constants, so it cross-jumped where the correct code
 * does not. A tail that merges is not evidence the constants are right.
 *
 * REMAINING DIFF: the candidate needs SIX callee-saved registers where the ROM
 * needs five -- `mov r7,sl; mov r6,sb; push {r6,r7}` against `mov r7,r8;
 * push {r7}` -- and the extra spill accounts for the +140 bytes. The ROM keeps
 * exactly three things live: `ip` = the address of this unit's -fforce-addr
 * pool word, r5 = x, r4 = y.
 *
 * AXES RULED OUT (each measured, instruction counts against the ROM's 544):
 *   - function-scope p/rows/tiles/t/off shared by all 13 accesses: 608, worse;
 *   - the same five in a BLOCK per access (what this file carries): 600;
 *   - `n` block-scoped per branch rather than function-scope: byte-neutral, so
 *     `n` is NOT the extra live value;
 *   - c_local `pp = &gUnknown_08499590` + `*pp`: 574, the BEST count seen and
 *     WRONG -- it emits two indirections where the ROM has three, i.e. it buys
 *     26 instructions by dropping a level of the model;
 *   - declaring the pool word `u8 **const gUnknown_0808D898` and dereferencing
 *     it: 602 and FOUR indirections, because agbcc force-addrs the declared
 *     symbol's address on top. Do not declare the pool word.
 *   - `u16 v` for the centre cell: 9.7%, worse than `int v`.
 *
 * NEXT AXIS, untried: the sixth register is not the pointer spelling, not `n`
 * and not the access-local scope -- all measured above. The guard spelling is
 * NOT a candidate either: the ROM's `subs r0, r5, #1; cmp r0, #0; bge` is
 * literally this file's `if (x - 1 < 0)`, so that axis is already correct and
 * should not be spent on. What is left is the thirteen access blocks' `t`:
 * this file computes `t = (y - 1) * 2` and `t = (y + 1) * 2` inside the access
 * block, while the ROM hoists `lsls r2, r4, #1` for the CENTRE row once and
 * derives the neighbours from the already-shifted value in some branches. One
 * probe: bind the row index rather than the byte offset.
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
