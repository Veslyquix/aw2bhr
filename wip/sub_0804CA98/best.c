#include "global.h"

/* gUnknown_08136060 and gUnknown_08136064 are `-fforce-addr` .rodata words
 * holding &gUnknown_02029A10 and &gUnknown_02029B94 (dumped from baserom.gba).
 *
 * The `= 0` writes inside the guarded block come out as the register that
 * already holds unk00, which `cmp r3,#0; beq` proved zero -- agbcc substituting
 * the compare's register, the same thing src/decomp/c_08003DC4.c records. */
void sub_0804CA98(u16 a1, u16 a2, s16 a3)
{
    struct Unk56E28 s;
    u16 cnt;

    if (gUnknown_02029A10[a1].entries[a2].unk00 == 0)
    {
        gUnknown_02029A10[a1].entries[a2].unk20 += gUnknown_02029B94[a1][a2];
        if (((*(volatile u16 *)&gUnknown_02029A10[a1].entries[a2].unk20) & 0xf)
            == 1)
        {
            gUnknown_02029A10[a1].entries[a2].unk22++;
            if (gUnknown_02029A10[a1].entries[a2].unk22 == 3)
            {
                gUnknown_02029B94[a1][a2] = 0;
                gUnknown_02029A10[a1].entries[a2].unk20 = 0xff;
            }
            cnt = gUnknown_02029A10[a1].entries[a2].unk22;
            gUnknown_02029A10[a1].entries[cnt].x =
                gUnknown_02029A10[a1].entries[gUnknown_08552148[a1]].x
                + ((u16 *)gUnknown_0855335C)[a1 * 10 + cnt * 2];
            gUnknown_02029A10[a1].entries[cnt].y =
                gUnknown_02029A10[a1].entries[gUnknown_08552148[a1]].y
                + ((u16 *)gUnknown_0855335C)[a1 * 10 + cnt * 2 + 1];
        }
        if (gUnknown_02029B80[a1][a2] != 0)
        {
            gUnknown_02029B80[a1][a2] = 0;
            gUnknown_02029B94[a1][a2] = 1;
            gUnknown_02029A10[a1].entries[a2].frame = 0;
            s.unk00 = a1;
            s.unk02 = a2;
            s.unk04 = ((u16 *)gUnknown_08553354)[a1 * 2];
            s.unk06 = ((u16 *)gUnknown_08553354)[a1 * 2 + 1];
            s.unk08 = 0;
            s.unk0a = 0;
            s.unk0c = 0x78;
            sub_08056E28(&s);
        }
        if (gUnknown_02029A10[a1].entries[a2].frame
                == gUnknown_02029A10[a1].entries[a2].frameCount
            && a3 != -1 && sub_080153F0(a3))
            sub_08015328(a3);
    }
}

/* PARKED, wave 37 (W37-I), ONE attempt only -- the batch ran out of budget, so
 * this is a first draft and not an exhausted one. The whole tail (the
 * gUnknown_02029B80 block, the struct Unk56E28 fill and the frame ==
 * frameCount guard) is structurally right and reads instruction-for-
 * instruction against the ROM. What is wrong:
 *   - the frame is 28 bytes, the ROM's is 32: the ROM CSEs THREE index
 *     intermediates to the stack ([sp,#0x14] = a1 * 10, [sp,#0x18] = a1 * 4,
 *     [sp,#0x1c] = a2 * 2) and reuses them across gUnknown_0855335C,
 *     gUnknown_02029B80/B94 and gUnknown_08553354. This draft spills only two
 *     and keeps a1/a2 themselves in r8/r9, where the ROM has them in the low
 *     r6/r7 and puts `a1 * 0xb4` in ip and gUnknown_02029A10 in sl.
 *   - gUnknown_0855335C: the ROM computes a HALFWORD index
 *     `a1 * 10 + cnt * 2` and then `+1` for the second read, i.e. one shared
 *     subexpression. Declared `u16 [][5][2]` and written `[a1][cnt][0]` /
 *     `[a1][cnt][1]` this draft folds the `+2` onto the BASE instead
 *     (`adds r5,#2`). `u16 [][10]` with `[a1][cnt * 2]` / `[a1][cnt * 2 + 1]`
 *     is the spelling that should reproduce it.
 *   - gUnknown_08553354[a1][1] has the same disease (`adds r0,#2; add r0,sl`
 *     where the ROM has `lsls r0,r6,#1; adds r0,#1; lsls r0,#1; adds r0,r0,r2`,
 *     i.e. the flat `(a1 * 2 + 1)` index).
 * Wave 66 (W66-D) tried both flat-index changes, plus a read-site-only
 * volatile cast on unk20. Together they produce the ROM's 0x20-byte frame and
 * restore the post-store `ldrh`, but gUnknown_02029A10 remains a plain literal
 * instead of the ROM's -fforce-addr word and the reload rebuilds the entry
 * address. Keeping an explicit entry pointer avoids that rebuild but collapses
 * the frame back to 0x1c. The configured fixpoint remains +26 code / +20
 * section bytes; flat indexing is ruled out as a standalone fix.
 *
 * The struct Unk02029A10 members unk20/unk22 added for this function are
 * independent of all that and are believed right (see include/unknown-globals.h). */






/* WAVE 77 (W77-A).  Improved from +8 bytes / 14.2% to -12 bytes / 14.9%, and
 * the register assignment now agrees with the ROM where before it agreed with
 * almost nothing (r5 entry, r6 a1, r7 a2, r8 the gUnknown_02029B94 element
 * pointer, r9 the zero, ip = a1 * 180).
 *
 * WHAT MOVED IT -- reuse this, it is the region's idiom and sub_0804F3C8 two
 * functions away already carried it:
 *   - The guarded region's four gUnknown_02029A10 accesses are spelled
 *     `(struct Unk02029A10 *)(n * sizeof(struct Unk02029A10)
 *        + a1 * sizeof(struct Unk02029A10Group) + (u8 *)gUnknown_02029A10)`,
 *     not `gUnknown_02029A10[a1].entries[n]`.  The array form folds the base
 *     into each MEM address so agbcc re-materialises the literal per use; the
 *     `(u8 *)` cast as an operand of `+` creates ONE address-constant pseudo.
 *   - gUnknown_0855335C is read through a FLAT `u16 *` cast at
 *     `a1 * 10 + cnt * 2`, not `[a1][cnt][0]` on the declared `[][5][2]`.
 *     The flat form makes the CSEd subexpression `a1 * 10`, which is what the
 *     ROM parks at [sp,#20] and what the neighbouring gUnknown_02029B94 index
 *     then reuses; the 3-D form shares `a1 * 5` instead.
 *   - gUnknown_08553354 likewise flat at `a1 * 2` / `a1 * 2 + 1`.
 *
 * REMAINING, and it is one fact: the ROM parks &gUnknown_02029A10 in `sl`,
 * loaded from the `-fforce-addr` .rodata word gUnknown_08136060 before the
 * unk00 test, and reaches all four uses with `add rN, sl`.  This candidate
 * still materialises a plain literal at each of the four.  Everything else in
 * the diff (the a1*4 stack slot vs sl, the gUnknown_08553354 `(base+2) + a1*4`
 * refactor, the 0x1c vs 0x20 frame) is downstream of that one difference.
 *
 * MEASURED AND RULED OUT this wave:
 *   - Converting the TAIL's three gUnknown_02029A10 accesses to the same
 *     `(u8 *)` idiom: -36 bytes / 6.5%.  The ROM's pool carries BOTH
 *     gUnknown_08136060 and a plain gUnknown_02029A10 word; the tail
 *     deliberately recomputes from the plain literal.  Convert the region, not
 *     the function.
 *   - Binding the base to a local (`u8 *base = (u8 *)gUnknown_02029A10;`) and
 *     using `base` in the sums: BYTE-IDENTICAL.  gcc const-propagates it.  The
 *     documented `c_local` workaround does not reach this.
 *   - Binding `dst` to an explicit local: byte-identical (CSE already did it).
 *     Kept anyway, because it mirrors sub_0804F3C8 and reads better.
 * Residual kind 3 (allocation / constant placement).
 */
