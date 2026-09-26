#include "global.h"

/* PARKED.  SIZE-EXACT at 476 bytes and, as of wave 79 (W79-E), the ENTIRE
 * INSTRUCTION STREAM IS THE ROM'S -- every instruction, in order, with the
 * ROM's operands and the ROM's `_080093BE: b <return 0>` trampoline.  The
 * residual is now REGISTER NUMBERS ONLY plus the order of the two tail blocks.
 *
 * WAVE 79 RESULT.  Wave 37's knot ("the copy and the blocked merge are the
 * same knob in opposite directions") is HALF SOLVED.  Writing the default arm's
 * result into the FUNCTION-SCOPE `d` -- the local the two `sub_08008D14` arms
 * already use, so it is referenced from three basic blocks and is therefore a
 * GLOBAL allocno -- gives BOTH the ROM's `adds rN, r0, #0` copy AND the blocked
 * cross-jump (the tail tests `n`, the arm tests `d`, so rtx_equal_p fails).
 * That is the third spelling wave 37 was looking for and it reproduces the
 * ROM's instruction stream exactly.
 *
 * WHAT IS LEFT, AND WHY IT IS HARD.  The ROM puts the arm's value in r6 --
 * the SAME callee-saved register as `n`, with disjoint live ranges.  A pseudo
 * only reaches a callee-saved register in global_alloc if it is LIVE ACROSS A
 * CALL.  `n` is (it is set at _080093CE and read at _080094D4, across two
 * `bl`s).  `d` never is, in any of its three blocks, so global_alloc hands it
 * the call-clobbered r1 and the knock-on is that `n` takes r7 and the
 * gUnknown_08499590 force-addr pseudo takes r6, where the ROM has them the
 * other way round.  So the two requirements are still in tension, but the
 * tension is now precisely stated:
 *     - to BLOCK THE MERGE the arm's pseudo must differ from the tail's;
 *     - to WIN r6 the arm's pseudo must be live across a call;
 *   and `n` is the only local in this function that is live across a call.
 * Closing it needs a spelling that makes a NON-`n` local live across a call
 * without emitting an instruction, or a lever that raises a global allocno's
 * priority without a call crossing.  See docs/agbcc-codegen.md.
 *
 * MEASURED THIS WAVE (do not re-run):
 *   - arm writes `n`  -> registers come out EXACTLY right (r6 for the arm and
 *     for n, r7 for the pool pseudo) and cross-jumping folds the arm's
 *     cmp/ble/b/b into one `b`, 4 bytes short.  Confirms wave 37.
 *   - arm writes `n` with `break;` and a `return 0;` after the switch, to give
 *     the arm's `ble` a DIFFERENT label (the ROM's _080093BE trampoline) --
 *     jump-threaded away, byte-identical to the plain `n` spelling.  The
 *     trampoline is NOT a separate source `return 0`.
 *   - arm writes a block-local `int k` (wave 37) -> local allocno, r0, no copy.
 *
 * THE TAIL BLOCK ORDER IS AN INDEPENDENT THIRD FACT, not a consequence of the
 * arm.  All three arm spellings emit the tail as `bgt -> return 1` with
 * `return 0` falling through; the ROM has `ble -> return 0` with `return 1`
 * falling through (which is also what swaps 0x1c8/0x1d4 through both jump
 * tables and every `b`/`beq` in the body).  Source polarity does not reach it:
 * this draft's tail already IS `if (n > 0) return 1; return 0;`, whose natural
 * expansion is the ROM's, and gcc inverts it anyway.  Wave 37 measured the
 * flipped spelling `if (n <= 0) return 0; return 1;` as worse.
 *
 * Ruled out and load-bearing (do not undo these):
 *   - `d = sub_08008D14(x, y); if (d & 6)` -- the binding is REQUIRED.  Written
 *     inline as `if (sub_08008D14(x, y) & 6)` agbcc folds it to
 *     `mov r1,#6; and r1,r1,r0` (2 insns); the ROM's
 *     `adds r1,r0,#0; movs r0,#6; ands r0,r1` (3 insns) needs the local.
 *   - The `case 2/4/6` membership test MUST be one `||` with a single
 *     `n = 0x16;` store, which is why the comma operators are here: the ROM's
 *     first block does `beq _080094D2`, jumping INTO the store that the second
 *     block falls through to.  Two separate `if`s emit two stores and no merge;
 *     `n = 0x16; break;` merges them but is then jump-threaded away entirely.
 *   - The `case 0/8/9` arm has NO store at all: all three of its success paths
 *     are `return 1` in the ROM (the 0x13 value is fully jump-threaded away).
 *
 * Promotion note: gUnknown_0808D814 is NOT a global.  The ROM word at
 * 0x0808D814 is 0x08499590, i.e. agbcc's -fforce-addr .rodata copy of
 * &gUnknown_08499590.  This file names the global honestly, so promotion must
 * carry "rodata": ["0x0808D814"].
 */
int sub_08009310(int x, int y)
{
    int t;
    int terrain;
    int n;
    int d;

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
        return 1;

    if (terrain == 7 || terrain == 0xD || terrain == 0x13)
    {
        switch (sub_08008D14(x, y))
        {
        case 1:
        case 2:
        case 4:
        case 8:
            sub_08008CB8(x, y);
            return 1;
        case 3:
        case 5:
        case 10:
        case 12:
            return 0;
        case 6:
        case 7:
        case 9:
        case 11:
        case 13:
        case 14:
            return 1;
        default:
            d = sub_08008D70(x, y);
            if (d > 0)
                return 1;
            return 0;
        }
    }

    if (sub_08009B38(x, y) == 0)
        return 0;

    n = 0;

    switch (sub_08008CB8(x, y))
    {
    case 0:
    case 8:
    case 9:
        d = sub_08008D14(x, y);
        if (d & 6)
            return 1;
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
                return 1;
        }
        {
            u8 *pe;

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
                    return 1;
            }
        }
        break;
    case 2:
    case 4:
    case 6:
        {
            u8 *p;
            u8 *rows;
            u8 *cells;
            u8 *pe;
            u8 *rows2;
            u8 *cells2;
            int t2;
            int t3;
            int idx;
            int idx2;

            d = sub_08008D14(x, y);
            if (d & 9)
                return 1;
            if ((y > 0
                 && (p = gUnknown_08499590,
                     t2 = (y - 1) * 2,
                     rows = p + 0x417A,
                     idx = *(u16 *)(rows + t2) + x,
                     cells = p + 0x1432,
                     *(cells + idx) == 0xC))
                || (pe = gUnknown_08499590,
                    y < *(u16 *)(pe + 2) - 1
                    && (t3 = (y + 1) * 2,
                        rows2 = pe + 0x417A,
                        idx2 = *(u16 *)(rows2 + t3) + x,
                        cells2 = pe + 0x1432,
                        *(cells2 + idx2) == 0xC)))
                n = 0x16;
        }
        break;
    }

    if (n > 0)
        return 1;
    return 0;
}
