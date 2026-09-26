#include "global.h"

/* WAVE 86 (W86-A).  Wave 84's killed permuter chain was RE-RUN FULL LENGTH
 * from w84-start.c: 14,942 iterations / 4 threads / 300 s, "no candidate
 * scored better than the starting point". best.c/best.json unchanged. The
 * permuter axis is now closed with a completed run, not an aborted one.
 *
 * THE RESIDUAL IS EXACTLY 2 REAL CODE BYTES, +0xd5 and +0xd6 (ROM 20/68 =
 * `movs r0,#0; strh r0,[r5,#2]`, candidate 23/6b = the same pair in r3).
 * +0x34 and +0x164 are relocation addends of the equivalent .rodata alias.
 *
 * W80-F's premise "the ROM has the zero in r0 AND something live in r3 across
 * the store" is REFUTED by direct trace: r3's live range is props+off, and it
 * ENDS at +0xbe (`ldrb r1,[r3]`); r3 is next written at +0xfa. At the store
 * both r2 and r3 are free in the ROM. The value live across the store is
 * r1 = *gUnknown_030040D8, which this draft already keeps.
 *
 * The real residual is a two-way TRADE that never composes (four spellings
 * measured in one unit, no try_match spent):
 *   long-lived zero local  -> zero r3 (wrong) + ip copy r2 (RIGHT)  <- this draft
 *   literal / late-bound / dead-extra -> zero r0 (RIGHT) + ip copy r3 (wrong)
 * Both are 2 bytes. NEW: it is the zero local's live-range START that pins it
 * to r3 -- `new_var3 = 0;` moved to immediately before the store compiles
 * byte-identically to the literal, so wave 66's "late-binding" and "literal"
 * measurements were the same experiment.
 * See work/sub_0805A0EC/W86-notes.md. */

/* Wave 62 (W62-C) supersedes the historical -4 verdict below. Volatile at the
 * second selector read makes agbcc retain the force-address pointer and emit
 * the missing late `ldrb`; selective row-index rematerialisation plus the two
 * permuter-discovered binding locals make the draft size-exact at 380 bytes.
 * The configured residual is now exactly FOUR differing code bytes at the
 * zero store: ROM `movs r0,#0; strh r0,[r5,#2]`, candidate the same pair in
 * r3. Everything after that is byte-identical apart from symbolic branch-label
 * display and equivalent `.rodata` relocations. Two chained 300-second runs
 * (~19.9k and ~18.3k iterations) improved 96.8 -> 98.4 -> 98.9% but did not
 * reach the r0 allocation. `no-force` is 364/380 (-16), so it is ruled out.
 * u8/s16/u16 spellings of the zero binding all emit the same r3 pair.
 * Wave 66 also measured literal, chained-assignment, late-binding, pointer-
 * binding and zero-use variants. A literal emits the ROM's `movs r0` / `strh
 * r0`, but rotates the immediately following row-pointer copy from the ROM's
 * `mov r2, ip; ldrh r0, [r2]` to r3. The residual remains the same four-byte
 * allocation tie, so the configured r3-store fixpoint is retained.
 * WAVE 70 (W70-C) additionally tested the separating mechanism directly:
 * deleted off/rowp/props/x lifetime anchors after a literal zero, a held off
 * copy, narrow-scope and function-scope fixed-r2 row copies, and fixed-r0 zero
 * locals. The deleted anchors are neutral; fixed locals rotate out/r6/r7 and
 * worsen the block. None preserves both ROM decisions, so 380/380 with the
 * r3 zero-store pair remains strongest. */

/* HISTORICAL: PARKED at 376/380 bytes. The shape is settled -- prologue, both loops, every
 * guard, the call and the whole epilogue are instruction-for-instruction the
 * ROM, and the pool is in the ROM's order. THE ENTIRE RESIDUAL IS ONE `ldrb`.
 *
 * REMAINING DIFF, exactly: the ROM keeps the -fforce-addr ADDRESS of
 * gUnknown_03003F38 in r4 across the merge and RELOADS the byte at the late
 * test (`ldrb r4,[r4]`); this draft caches the byte itself in r4 at the earlier
 * test and compares against it directly, so the reload is missing. The other
 * differences the diff prints are all knock-on: losing 2 bytes brings the outer
 * loop's back-branch into short range, so the ROM's `bge`/`b` long-jump pair
 * collapses to one `blt` (-2 more), and every later offset shifts.
 *
 * WHY IT HAPPENS: the store `out->v = 0;` sits between the two reads and ought
 * to kill the cached load -- that is the c_0805A95C.c "a non-const global's MEM
 * does not survive the merge" mechanism, and the ROM behaves exactly that way.
 * agbcc here does NOT kill it, and the plausible reason is type-based aliasing:
 * the store is `s16` through a parameter pointer and the load is `u8`, so they
 * are treated as non-conflicting. If that is right, the fix is a spelling that
 * makes the store alias, not a register-allocation lever.
 *
 * RULED OUT BY MEASUREMENT (do not retry):
 *  - Binding the address, `f38 = &gUnknown_03003F38;`, and reading `*f38` at
 *    the two late sites -- the documented c_local workaround. It is STRICTLY
 *    WORSE: it merges the two force-addr reads with the ordinary-pool read as
 *    well, so gUnknown_0816D980 disappears from the pool entirely and the
 *    function loses 8 bytes instead of 4.
 *  - Leaving `off` unbound. That version recomputes the index at the late site
 *    as the ROM does, but then `cells = q + 0x1432` is emitted BEFORE the
 *    `ldrh`, costing an extra `mov rN,ip`. Binding `off` (this draft) fixes the
 *    ordering and the late site still recomputes, because the late test is
 *    written longhand as `props[*(u16 *)rowp + x]` -- that longhand is
 *    load-bearing and must stay.
 *
 * SETTLED AND WORTH KEEPING: gUnknown_0816D978/0816D97C/0816D980 are NOT
 * globals -- the ROM words hold 0x030040D8, 0x08499590 and 0x03003F38, the
 * addresses of real objects (checked in baserom.gba). Binding
 * `p = gUnknown_030040D8;` before `out->v = 0;` is what orders its pool word
 * ahead of gUnknown_030033EC's and hoists the pointer load above the store,
 * both of which the ROM does. Promotion would need
 * "rodata": ["0x0816D978", "0x0816D97C", "0x0816D980"].
 *
 * The record type is sub_0805A514's {u8 x; u8 y; s16 v;}, terminated with
 * 0xFFFF, same as its three siblings in this block. */

/* WAVE 80 (W80-F). Dead-statement transfer test by compile_probe; no
 * try_match spent, the draft below is unchanged:
 *  - literal `out->v = 0;` plus a DEAD `z = 0;` created just before the p
 *    binding (the W80-B form): identical to the plain literal -- `movs r0,#0`
 *    (ROM) but the row-pointer copy goes `mov r3,ip` (ROM r2). cse never
 *    substitutes one register for a literal's own register, so a dead
 *    CONSTANT set is not reusable the way a dead computation is, and flow
 *    deletes it.
 *  - W80-A dead-int form `if ((v = props[off]) == *new_var)`: rewrites the
 *    selector block (`ldrb r2,[r2]` / `ldrb r0,[r3]`), worse.
 *  - literal zero plus a LIVE copy of the props+off pointer (`pp = props +
 *    off; pp2 = pp;` with pp2 read in the u block) to inflate r3's reload
 *    use count: same code, still `mov r3,ip`.
 * Refined reading of the residual: the permuter's long-lived `new_var3`
 * zero in r3 is what makes r3 UNAVAILABLE at the copy, so reload takes r2;
 * with the literal, r3 is free and sorts before r2. The ROM has the zero in
 * r0 AND something live in r3 across the store, and no measured construct
 * supplies that value.
 */

struct Unk5A514Cell
{
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ s16 v;
};

void sub_0805A0EC(void *out_)
{
    volatile u8 *new_var;
    int new_var3;
    struct Unk5A514Cell *out;
    struct Unk08499594 *u;
    struct Unk030040D8 *p;
    u8 *q;
    u8 *rows;
    u8 *rowp;
    u8 *cells;
    u8 *props;
    int x;
    int y;
    int t;
    int off;
    struct Unk030040D8 *new_var2;
    int key;

    out = out_;
    key = gUnknown_0857680F[gUnknown_030040D8->unk00];

    for (y = 0; y < *(u16 *)(gUnknown_08499590 + 2); y++)
    {
        for (x = 0; x < *(u16 *)gUnknown_08499590; x++)
        {
            if ((s8)gUnknown_03003340[y][x] < 0)
                continue;

            q = gUnknown_08499590;
            t = y * 2;
            rows = q + 0x417a;
            rowp = rows + t;
            new_var3 = 0;
            off = *(u16 *)rowp + x;
            cells = q + 0x1432;

            if ((cells[*(u16 *)rowp + x] & 0xe0) != gUnknown_03004084)
                continue;
            if (gUnknown_085767F2[cells[*(u16 *)rowp + x] & 0x1f] != key)
                continue;

            props = q + 0x12;

            if (props[*(u16 *)rowp + x] != 0 && props[off] != gUnknown_03003F38)
                continue;

            new_var = (volatile u8 *)&gUnknown_03003F38;
            if (props[off] == *new_var)
            {
                u = &gUnknown_08499594[props[off]];
                if (u->unk0b == 5)
                    continue;
            }

            p = gUnknown_030040D8;
            new_var2 = p;
            out->v = new_var3;

            if (props[*(u16 *)rowp + x] != 0
             && props[*(u16 *)rowp + x] != gUnknown_03003F38)
                out->v = out->v + sub_08042D1C(gUnknown_030033EC, new_var2->unk00) * 5;

            out->v += (s8)gUnknown_03003340[y][x];
            out->x = x;
            out->y = y;
            out++;
        }
    }

    out->v = 0xFFFF;
}
