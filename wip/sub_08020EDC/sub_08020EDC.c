#include "global.h"

/* sub_08020B88's twin against a caller-supplied u8 plane: same Manhattan-disk
 * walk, but every visited cell gets `buf[off] += d` instead of an overlay write,
 * and r == 0 short-circuits to the single centre cell.
 *
 * BOTH stack parameters are copied into u8 locals rather than being narrow
 * themselves. The 5th is `int` on its caller's evidence -- sub_080210C8
 * sign-extends its own s8 into it with `lsls #0x18; asrs #0x18`, which a u8
 * formal would have made free -- yet the prologue narrows it, so the narrowing
 * is `d = delta;`. The 6th then needs its own copy too, because the ROM's slot
 * order (delta's at sp+0xc, flags' at sp+0x10) is local-declaration order and
 * not the parameter order a pair of parameter homes would give.
 *
 * `rows` / `cells` / `ids` are c_0805AD90.c's rule: bound to their own locals or
 * agbcc reassociates the 0x417A, 0x1432 and 0x51A constants to last.
 *
 * PARKED, SIZE-EXACT at 492 bytes, 46 of 492 differ, first difference at +0x1a.
 * The instruction SEQUENCE is aligned end to end; what is left is register
 * assignment plus two scheduling slips, and neither points at a statement:
 *
 *   1. First divergence at +0x1a. The ROM parks `y` in r5 and emits delta's
 *      narrowing group whole before flags'; this draft leaves `y` in r1 and
 *      hoists `lsls r4,r4,#24` one slot early. Same instructions, same count.
 *   2. Wave 71 settled the sunk-deref spelling at the gUnknown_08499594
 *      subscript: binding the element address inside
 *      `(unit = &gUnknown_08499594[ids[off]])->unk00` emits the ROM's order.
 *
 * RULED OUT by measurement, do not re-run:
 *   - Binding the unit id to a local (`m = ids[off]`) instead of writing
 *     `ids[off]` twice: 60.2%, i.e. 26 points WORSE.
 *   - Copying `y` into its own `s16` local before the `r == 0` test: 84.8%.
 *     decomp-permuter reaches 91.1% with the same copy placed INSIDE the
 *     `r == 0` block, where it is uninitialised on the loop path -- that is an
 *     allocation artefact, not a spelling. Legalising it (wave 65) enlarged the
 *     function by 8 bytes (492 -> 500).
 *   - Splitting the `r == 0` block's row base into two statements
 *     (`rows = p; rows = rows + 0x417a;`): 90.2%, WORSE than the 90.7% below.
 *     The permuter reached 91.5% with that split, but only in combination with
 *     widening the 6th parameter -- see the prototype note.
 *
 * The two u8 locals are NOT negotiable and are the reason the frame slots line
 * up (delta's copy at sp+0xc, flags' at sp+0x10); see the note above.
 *
 * WAVE 73 (W73-F). Improvement: `ty = cells[off] & 0x1f; t = ty;` in place of
 * `t = cells[off] & 0x1f;`, found by decomp-permuter run with --current and
 * checked semantically -- ty is dead across the split and is reassigned at its
 * next use, so the program is unchanged. 89.6% -> 90.7%, still size-exact.
 *
 * AND THE REST OF THE WAY IS BLOCKED BY A CROSS-TU PROTOTYPE CONTRACT. The only
 * thing the permuter found past 90.7% is 91.5% with the 6th parameter widened
 * from `u8` to `unsigned int`. That cannot be taken. include/unknown-functions.h
 * declares `void sub_08020EDC(s16, s16, s16, u8 *, int, u8)`, and the MATCHED
 * caller src/decomp/c_080210C8.c passes an `int a6` through
 * `lsls #0x18; lsrs #0x18` -- which is exactly the int->u8 narrowing this
 * prototype's 6th parameter requires. Widening it here deletes that narrowing
 * there and costs the caller 4 bytes, so the 0.8 points are bought by breaking
 * a promoted function. (Note the prose above that declaration in the header
 * asserts arguments 5 AND 6 are `int`, which contradicts the declaration itself
 * on the same lines; the declaration is the one the caller agrees with.)  *
 * WAVE 79 (W79-F). Re-measured, no probe spent: the DRAFT is 492 bytes
 * (SIZE-EXACT) at 90.7%, 46 of 492 differ, first difference at +0x1a --
 * unchanged from wave 73. The 93.9% that reached this wave's brief is best.c's
 * 496-byte (+4) variant, exactly the trap the parked entry already documents.
 * Residual kind 5 (cross-TU prototype contract); the brief's rule is to stop
 * and say so, and nothing has changed on the caller side since wave 73.
*/
void sub_08020EDC(s16 x, s16 y, s16 r, u8 *buf, int delta, u8 flags)
{
    u8 d;
    u8 f;
    s16 xx;
    s16 yy;
    s16 dy;
    u8 *p;
    u8 *rows;
    u8 *cells;
    u8 *ids;
    int off;
    int ty;
    int t;
    struct Unit *unit;

    d = delta;
    f = flags;

    if (r == 0)
    {
        p = gUnknown_08499590;
        ty = y * 2;
        rows = p + 0x417a;
        buf[x + *(u16 *)(rows + ty)] += d;
        return;
    }

    dy = -r;

    for (yy = y - r; yy <= y + r; yy++, dy++)
    {
        if (yy < 0)
            continue;
        if (yy >= *(u16 *)(gUnknown_08499590 + 2))
            continue;

        for (xx = x - r + (dy < 0 ? -dy : dy);
             xx <= x + r - (dy < 0 ? -dy : dy);
             xx++)
        {
            if (xx < 0)
                continue;
            if (xx >= *(u16 *)gUnknown_08499590)
                continue;

            if ((sub_08043050(f) & 8) == 0
             && (xx - x < 0 ? x - xx : xx - x)
              + (yy - y < 0 ? y - yy : yy - y) > 1)
            {
                p = gUnknown_08499590;
                ty = yy * 2;
                rows = p + 0x417a;
                off = xx + *(u16 *)(rows + ty);
                cells = p + 0x1432;
                ty = cells[off] & 0x1f;
                t = ty;
                if (t == 4 || t == 0x13)
                {
                    ids = p + 0x51a;
                    if (ids[off] == 0)
                        continue;
                    if ((u8)((unit = &gUnknown_08499594[ids[off]])->type - 0x10) > 4)
                        continue;
                }
            }

            p = gUnknown_08499590;
            ty = yy * 2;
            rows = p + 0x417a;
            buf[xx + *(u16 *)(rows + ty)] += d;
        }
    }
}

/* WAVE 86 (W86-E) -- MIRROR/TWIN AXIS, HYPOTHESIS REFUTED. See
 * work/sub_08020EDC/W86-notes.md.
 *
 * Pair class against the adjacent matched twin sub_08020DBC
 * (src/decomp/c_08020DBC.c, 0x120 away): TRUE SHAPE TWIN. The two share the
 * whole tile predicate literally -- same map, same 0x417a row indirection,
 * same terrain & 0x1f tested against 4 and 0x13, same unitId bail, same
 * (u8)(gUnknown_08499594[id].unk00 - 0x10) <= 4. DBC is the single-tile
 * predicate; EDC is the radius-r sweep of it.
 *
 * The twin was matched in wave 83 with two constant locals this park had never
 * tested: int rowOff = 0x417a with the address formed INLINE at every use, and
 * int new_var2 = 0x13 in place of the literal. The ruled-out list here holds
 * only the POINTER statement-split (rows = p; rows = rows + 0x417a), which is
 * the other form -- so the W86-D inline-sibling warning did apply.
 *
 * Transplanted both verbatim, everything else unchanged:
 *   size: match (492 bytes); 52 of 492 differ (89.4% identical);
 *   first difference at +0x1a
 * 90.7% -> 89.4%, still size-exact, FIRST DIFFERENCE UNMOVED at +0x1a. The
 * transplant does not reach the y/r5 allocation this park names. Draft
 * restored. Residual kind 5 verdict unchallenged. */
