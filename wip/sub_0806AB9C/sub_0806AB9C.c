#include "global.h"
#include "proc.h"
#include "hardware.h"

/* Wave 77 (W77-C): configured baseline is 352/360 (-8), 41.9% -- the launch
 * brief's "-6" is wrong. The open question stated below is unchanged, and FOUR
 * more spellings of it were measured and fold. Do not re-spend these:
 *   - dropping the mask entirely, `PutSpriteExt(0, x, ...)`:      344 (-16), 37.2%
 *   - `x += 0x10` moved into the for-increment:                   352 (-8),  41.9% (byte-identical)
 *   - `int x`, `x = (u16)(x + 0x10)`, mask spelled as the explicit
 *     shift pair `(int)((u32)x << 16 >> 16) & 0x1ff`:             348 (-12), 41.4%
 *   - no accumulator at all, `(u16)(i * 0x10 + 0x6a) & 0x1ff`:    348 (-12), 39.7%
 *
 * So the mask is REAL (dropping it costs 8 more bytes) and the `(u16)`
 * truncation in front of it is still unreachable. Nine spellings have now
 * folded. The -8 breaks down as: the ROM hoists `movs r0, #31`-style loading of
 * 0x1ff into r9 in the loop-3 preheader (2 insns this draft does not have),
 * spills `&proc->unk44` to sp+4 for a 8-byte frame against this draft's 4, and
 * copies `sy << 16` into r7; the body then pays 1 fewer instruction because
 * `lsls r5, r1, #0x10` is PRE-hoisted and serves both the mask and the
 * increment. Every one of those is downstream of the truncation surviving. */
/* Wave 78 searched the promoted PutSprite loops before probing. The closest
 * new construction used a wide accumulator plus a separate u16 snapshot and
 * reused the wide local for `proc->unk2c[i]` at the fifth argument. It restores
 * the ROM's 8-byte frame and spilled `&proc->unk44`, but the snapshot truncates
 * before the byte load and the mask still consumes the narrow value rather
 * than the shifted pseudo. Reversing the roles leaves the 4-byte frame. Thus
 * explicit narrow snapshots and live wide argument sets are now ruled out;
 * the retained configured residual remains 352/360 (-8), 41.9%. */
/* Wave 56, W56-P. NOT MATCHED -- size exact (360 B), everything through the
 * PutSprite at _0806ABFE is byte-identical, and the whole residual is the
 * register allocation of the THIRD loop (the `_0806AC3E` icon loop).
 *
 * WHAT IS SETTLED (do not re-derive these -- each was measured with a probe):
 *
 *  - `y` is `u16` and every use casts it back to `s16`. The initialiser's
 *    `ldrh; lsls #0x10; asrs #0x11; lsls #0x10; lsrs #0x10` is a ZERO extension
 *    of `(s16)proc->unk44 >> 1`; an `s16 y` sign-extends (`asrs`) instead, and
 *    combine would delete the extension outright because `asrs #0x11` already
 *    fits. The tail's `subs #1; strh; lsls #0x10; asrs #0x11` on the value it
 *    just stored is the same `(s16)v >> 1` with no load, which is what proves
 *    the shift pair is a source cast and not the wave-37 `ldrsh` artefact.
 *
 *  - `sy` must be a separate `s16` LOCAL, and the `+ 0x20` must be its own
 *    statement (`sy = y; sy += 0x20;`). Written as one expression,
 *    `(s16)(y + 0x20)`, gcc folds the inner cast away at TREE level and emits
 *    `adds #0x20; lsls #0x10` -- two statements keep the sign extension long
 *    enough for combine to distribute the shift and produce the ROM's
 *    `lsls r0,y,#0x10; movs r1,#0x80; lsls r1,#0xe; adds r5,r0,r1`.
 *
 *  - Loop 1's third argument really does carry an EXTRA `(s16)` narrowing that
 *    loop 3's does not (`lsls #0x10 ... asrs #0x10` after the `& 0xff` in loop
 *    1, absent in loop 3). That asymmetry is in the ROM, not in the draft; both
 *    sites were probed with and without it.
 *
 *  - `movs r2,#0xff; ands r2,r7` (2 insns, constant loaded into the DEST) vs
 *    `mov r0,#0xff; adds r2,r4,#0; ands r2,r2,r0` (3) is not an operand-order
 *    choice in the source -- `0xff & sy` and `sy & 0xff` compile identically.
 *    It falls out of `sy` being the callee-saved allocno, and it came right on
 *    its own once the `s16 sy` model above was used.
 *
 * THE REMAINING DIFF, precisely: in loop 3 the ROM carries `x` in the SHIFTED
 * form. It computes `lsls r5, r1, #0x10` at the top of the body (before the
 * `!= -1` test), extracts `lsrs r1, r5, #0x10` for the `& 0x1ff`, and does the
 * increment as `adds r0, r5, #0x100000; lsrs r1, r0, #0x10`. That shape is
 * gcse PRE: `x << 16` is partially redundant between the masked use and the
 * increment, so it is hoisted to the one point that dominates both. This draft
 * only needs `x << 16` for the increment, so there is nothing to hoist, and the
 * knock-on is that the ROM has a register spare for the `0x1ff` pool load
 * (hoisted into sb) and spills `&proc->unk44` to sp+4 instead, while this draft
 * keeps `&proc->unk44` in sl and reloads 0x1ff every iteration. Frame is
 * `sub sp,#4` against the ROM's `sub sp,#8` for exactly that reason.
 *
 * So the open question is ONE thing and only one: what source spelling makes
 * the `& 0x1ff` operand need a u16 truncation that gcc cannot fold. Ruled out
 * by probe: `u16 x` with `x & 0x1ff` (folds), `int x` with `(u16)x & 0x1ff` and
 * `x = (u16)(x + 0x10)` (nonzero_bits proves x narrow from its two defs, so the
 * cast still folds), an additional in-place `x = (u16)x` at the loop top (also
 * folds and leaves the same 352-byte output), and `s16 x` (gives `asrs`, not
 * `lsrs`, on the increment).
 * Whatever it is, it must leave x provably WIDER than 16 bits at the mask.
 */

struct UnkAB9CProc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ s8 unk2c[3];
    /* 0x2f */ u8 unk2f[0x15];
    /* 0x44 */ u16 unk44;
    /* 0x46 */ u8 filler_46[0x02];
    /* 0x48 */ int unk48;
    /* 0x4c */ int unk4c;
    /* 0x50 */ u16 unk50;
    /* 0x52 */ u16 unk52;
};

void sub_0806AB9C(struct UnkAB9CProc *proc)
{
    int i;
    u16 y;
    u16 x;
    s16 sy;

    y = (s16)proc->unk44 >> 1;

    for (i = 0; i < proc->unk48; i++)
    {
        sy = y;
        if ((u16)(sy + 0x1f) <= 0xbe)
            PutSpriteExt(0, proc->unk2f[i], (s16)(sy & 0xff), gUnknown_08581730,
                         i * 8 + proc->unk52);
    }

    sy = y;
    sy += 0x20;

    if ((u16)(sy + 0xf) <= 0xae)
        PutSprite(0, 0x3a, sy, gUnknown_08581738, 0);

    x = 0x6a;

    for (i = 0; i < 3; i++)
    {
        if (proc->unk2c[i] != -1 && (u16)(sy + 0xf) <= 0xae)
            PutSpriteExt(0, x & 0x1ff, sy & 0xff, gUnknown_08581752,
                         proc->unk2c[i] << 2);
        x += 0x10;
    }

    sy += 0x10;

    if ((u16)(sy + 0x4f) <= 0xee)
        PutSprite(0, 0x58, sy + gUnknown_085816F0[proc->unk4c].unk0c,
                  gUnknown_085816F0[proc->unk4c].unk08,
                  (proc->unk52 + 0x90) | (proc->unk50 << 12));

    proc->unk44--;

    if (((s16)proc->unk44 >> 1) < -0x7c)
        Proc_Break(proc);
}







