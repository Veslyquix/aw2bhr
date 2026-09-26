#include "global.h"

/* PARKED at 392 of 400 bytes (wave 15, C). Structure, control flow, both `.LC`
 * pool spellings and every relocation are right; the candidate is 8 bytes SHORT
 * and the missing instructions are all zero-extensions agbcc elides here and
 * did not elide in the ROM.
 *
 * `ax` and `by` are `int` with an explicit `(u16)` cast at each use, NOT `u16`
 * locals -- that one change is worth 16 of the 24 bytes this was short before.
 * A `u16` local is a promoted SImode pseudo, so reading it costs nothing and
 * combine then folds the `* 2` of the definition into the `* 2` of the pointer
 * scaling and emits a single `lsls #2`; the ROM keeps `lsls rN, ax, #0x10` once
 * and `lsrs rM, rN, #0xf` at every use, which only the explicit cast produces.
 * A STRAIGHT-LINE probe cannot tell the two spellings apart -- both fold there
 * -- so this has to be measured in the real function.
 *
 * What is still missing is the same effect on `id`: the ROM stores it with
 * `lsls #0x10; lsrs #0x10` after the `ldrb` and this draft elides that pair.
 * `int id` with `(u16)`/`(s16)` casts fixes those 4 bytes and costs more
 * elsewhere (it re-enables the ax/by folding), so it is not the answer either;
 * the two want different spellings of the same idea and I did not find one that
 * holds both. Ruled out: old_agbcc (identical size), and ax/by as unused
 * parameters overwritten on entry (identical output -- flow deletes the dead
 * incoming copy and the promotion survives).  *
 * WAVE 79 (W79-F). -8 bytes -> -4, 10.0% -> 11.8%. THE ID NARROWING IS NOT A
 * SPELLING, IT IS A LIVE-RANGE FACT.
 *
 * The ROM's `id` is emitted as `ldrb; lsls #0x10; lsrs r7,#0x10` at the store
 * and re-narrows at EVERY read (`lsls r6,r7,#0x10` shared by CSE, then
 * `lsrs r0,r6,#0x10` for the u16 call argument and `asrs r1,r6,#0x10` for the
 * signed index). That is the emission profile of a narrow local that is NOT a
 * promoted pseudo, and the discriminator is that the pseudo is SET IN MORE THAN
 * ONE BASIC BLOCK. `flags` in this same function already proved it: it is s16,
 * set three times in three blocks, and its code is byte-identical to the ROM's.
 *
 * Measured here, all against the same draft:
 *   u16 id (single-set)       -12 bytes, 12.0%  everything folds, INCLUDING an
 *                                               explicit (s16)id at the use
 *   s16 id (single-set)        -8 bytes, 10.0%  def keeps lsls/asrs, reads free
 *   int id, (u16)/(s16) casts  -8 bytes,  9.8%
 *   int id = (u16)q[off]       -8 bytes,  9.8%
 *   s16 id = (u16)q[off]       -8 bytes, 10.0%
 *   id = q[off]; id = id;      -8 bytes, 10.0%
 *   id = q[off]; id &= 0xff;   -8 bytes, 10.0%
 *   id = 0; id = q[off];       -8 bytes, 10.0%
 *   ONE VARIABLE FOR id AND flags  -4 bytes, 11.8%   <- this draft
 *
 * So a MANUFACTURED second store does not work: flow deletes it before combine
 * and the pseudo is single-set again. Only a genuine second definition in a
 * second basic block keeps the narrowing alive. Reusing one s16 for `id` and
 * then for `flags` is legal here (id is dead after `rec = &gUnknown_08499594[id]`)
 * and is what the ROM's own register use suggests: r7 holds id in the guard and
 * flags in the else block.
 *
 * REMAINING 4 BYTES. The merged pseudo's live range now spans the guard and the
 * else block, and that costs a 4-byte stack slot the ROM does not have
 * (`sub sp,#4` plus `str r0,[sp,#0]` for `by`). The ROM holds x=r5, y=r4, ax=sl,
 * by=sb, id/flags=r7, id<<16=r6, rec=r8; this draft spills one of them. So the
 * right spelling is a second definition of `id` that does NOT lengthen its live
 * range -- i.e. the original probably reused a variable I have not identified,
 * not `flags`. Declaration order of the merged variable makes no difference
 * (both slots tested: identical 396 bytes / 11.8%).
 *
 * POOL WORDS ARE NOT A RESIDUAL HERE. Counted emission points in
 * work/sub_08022618/target.s against the candidate .s: gUnknown_080909A8,
 * gUnknown_080909AC, gUnknown_08499590 and gUnknown_08499594 are each named
 * EXACTLY ONCE in both. The "four uses is enough" figure this comment used to
 * lean on is not doing any work -- the draft has THREE source-level *pp
 * dereferences and still lands on the ROM's one emission point.
*/

void sub_08022618(u16 x, u16 y)
{
    u16 **const *pp;
    const struct UnitType *const *pp2;
    struct Unit *rec;
    u8 *p;
    u8 *rows;
    u8 *q;
    u16 *tile;
    s16 id;
    int ax;
    int by;
    int off;
    int t;
    int cap;

    p = gUnknown_08499590;
    if (y >= *(u16 *)(p + 2))
        return;

    ax = ((x - *(u16 *)(p + 0xC)) & 0xF) * 2;
    by = ((y - *(u16 *)(p + 0xE)) & 0xF) * 2;
    t = y * 2;
    rows = p + 0x417A;
    off = *(u16 *)(rows + t) + x;
    q = p + 0x51A;
    id = q[off];
    q = p + 0x234A;
    if (id == 0 || q[off] == 0 || !sub_0802571C(id)
        || (gUnknown_08499594[id].flags & 4))
    {
        sub_080225CC(x, y);
    }
    else
    {
        rec = &gUnknown_08499594[id];
        pp = &gUnknown_080909A8;
        tile = **pp + (u16)ax + (u16)by * 32;
        tile[0] = 0x360;
        id = 0;
        pp2 = &gUnknown_080909AC;
        cap = (*pp2)[rec->type].maxAmmo;
        if (cap != 0 && rec->ammo <= Div(cap, 3))
            id = 1;
        cap = (*pp2)[rec->type].maxFuel;
        if (cap != 0 && rec->fuel <= Div(cap, 3))
            id += 2;
        if (id != 0)
            (**pp + (u16)ax + (u16)by * 32)[1] = id + 0xA33C;
        else
            (**pp + (u16)ax + (u16)by * 32)[1] = 0x360;
        tile = **pp + (u16)ax + (u16)by * 32;
        tile[0x21] = 0x360;
        tile[0x20] = 0x360;
    }
}
