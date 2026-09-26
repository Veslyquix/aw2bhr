#include "global.h"

/* WAVE 86 (W86-D), twin-axis screen test. Twin sub_0805E87C (c_0805E87C.c)
 * supplies the bind-a-base-before-the-loop construct; TESTED AND REFUTED here.
 * Binding the 0x376A plane base across the second scan gives 732/740 (-8),
 * 41.9% -- WORSE than this draft's -4 / 47.6% on exactly the axis it targets.
 * Binding a base REDUCES pressure (second measurement of this, after W66-M on
 * the +0x12 base); it cannot supply the extra live value the residual needs.
 * See work/sub_0805DCD4/W86-notes.md. */

/* Wave 55, W55-C, re-verified by W55-F. NOT MATCHED, candidate is 4 bytes
 * SHORT. Everything from the prologue through the END OF THE FIRST SCAN AND
 * ITS WHOLE TAIL is byte-exact -- the first difference is inside the SECOND
 * scan, whose source is the same shape as the first.
 *
 * THE RESIDUAL IS ENTIRELY ALLOCATION, with no instruction-shape difference,
 * and it is exactly 2 literal-pool words:
 *  - the ROM keeps BOTH 0x417A and 0x376A in registers across the second
 *    loop body (0x417A in r8, 0x376A in r3 spilled over the sub_08058DEC
 *    call) and therefore has to re-materialise &gUnknown_08499590 from the
 *    pool at BOTH loop bottoms -- two extra pool words, the missing 4 bytes;
 *  - this draft keeps only 0x417A, so it has a spare callee-saved register,
 *    parks &gUnknown_08499590 in sl and reloads 0x376A from the pool instead.
 *    Same instruction count in the body, two fewer words at the end.
 *  - the knock-on: the ROM binds &buf to r5 and reads buf[1] as
 *    `ldrh r5,[r5,#2]`; this draft rebuilds sp+6 (`mov r0,sp; adds r0,#6`).
 *    The FIRST scan produces the ROM's form exactly from the same source
 *    shape, so this is pressure, not spelling.
 * In short: this candidate is the CHEAPER allocation and the ROM's is the more
 * expensive one. To match, one more value has to be live across the second
 * loop so that sl is not free.
 *
 * THE RELOC LINES ARE NOT DEFECTS, and gUnknown_0816DA50 / gUnknown_0816DA54
 * MUST NOT BE DECLARED. They are agbcc's own -fforce-addr address-constant
 * words for &gUnknown_030040D8 and &gUnknown_08499590; the candidate's
 * `.rodata+0` / `.rodata+4` at the same offsets is the correct output of the
 * honest spelling. Promotion carries
 * "rodata": ["0x0816DA50", "0x0816DA54"]. See the gUnknown_081D9328 note in
 * include/unknown-globals.h for why declaring one of these is always wrong.
 *
 * RULED OUT BY W55-F: decomp-permuter, 300 s from best.c, ~4 output
 * generations, best stayed 67.7% -- and every candidate it produced was
 * further off in SIZE (-12, +16, -4, +4), i.e. it is perturbing the shape
 * rather than the slots. A different starting point is worth more than a
 * longer run here.
 * RULED OUT BY W66-M: binding the +0x12 base before the second scan to keep it
 * live across that scan. The candidate stayed -4 bytes and regressed the
 * active draft from 47.6% to 19.5%; it does not create the ROM's missing
 * pressure pattern.
 *
 * Settled and reusable:
 *  - the map's +0x12 plane needs the bound-pointer spelling
 *    (`q = base + 0x12; q[i]`), while +0x193A and +0x376A are ordinary struct
 *    members because K > 31 cannot fold into an `ldrb` displacement.
 *  - `unk09_6--` on a file-local 6+2 bitfield view of gUnknown_030040D8's
 *    unk07[2] is the ROM's `lsrs #6; subs #1; lsls #6; and 0x3f; orr; strb`.
 *    Same view c_0805FB70.c uses for the ++ direction.
 *  - the first-scan guard `cmp #7 / beq / cmp #0x14 / beq / b <ret>` is the
 *    ordinary `!= 7 && != 0x14` chain, NOT the switch shape c_0805DCA4.c
 *    documents -- both compares branch to the same fallthrough label here.
 */

struct Unk5DCD4Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_04[0x193a - 4];
    /* 0x193a */ u8 unk193a[0x376a - 0x193a];
    /* 0x376a */ u8 unk376a[0x417a - 0x376a];
    /* 0x417a */ u16 rows[1];
};

struct Unk5DCD4Unit
{
    /* 0x00 */ u8 filler_00[9];
    /* 0x09 */ u8 unk09_0 : 6;
               u8 unk09_6 : 2;
    /* 0x0a */ u8 filler_0a[2];
};

void sub_0805DCD4(void)
{
    u16 buf[2];
    int bestX = 0;
    int bestY = 0;
    int bestVal = 0;
    int dstX = -1;
    int dstY = 0;
    u8 dir = 0;
    int x;
    int y;
    int idx;
    u8 *q;

    if ((gUnknown_030040D8->unk07[2] & 0xc0) == 0)
        return;
    if (gUnknown_030040D8->unk00 != 7 && gUnknown_030040D8->unk00 != 0x14)
        return;

    sub_080202A4(gUnknown_030040D8);
    sub_0801FD9C(0x79);

    for (y = 0; y < ((struct Unk5DCD4Map *)gUnknown_08499590)->height; y++)
    {
        for (x = 0; x < ((struct Unk5DCD4Map *)gUnknown_08499590)->width; x++)
        {
            if ((s8)gUnknown_03003340[y][x] < 0)
                continue;
            if (sub_0804236C(x, y) != 1)
                continue;
            idx = ((struct Unk5DCD4Map *)gUnknown_08499590)->rows[y] + x;
            q = gUnknown_08499590 + 0x12;
            if (q[idx] != 0)
                continue;
            if ((s8)gUnknown_03003340[y][x] <= bestVal)
                continue;
            if (sub_08058DEC(x, y, buf) != 0)
                continue;
            bestX = x;
            bestY = y;
            dstX = buf[0];
            dstY = buf[1];
            bestVal = (s8)gUnknown_03003340[y][x];
        }
    }

    if (dstX > 0)
    {
        gUnknown_084995A0[(s8)((struct Unk5DCD4Map *)gUnknown_08499590)->unk193a[
                ((struct Unk5DCD4Map *)gUnknown_08499590)->rows[dstY] + dstX]].unk03[0]++;
        ((struct Unk5DCD4Unit *)gUnknown_030040D8)->unk09_6--;
        if (bestX != dstX)
            dir = dstX - bestX + 3;
        else if (bestY != dstY)
            dir = bestY - dstY + 2;
        sub_0805D648(dstX, dstY, 8, dir, 0);
        return;
    }

    bestVal = 0;
    dstX = -1;

    for (y = 0; y < ((struct Unk5DCD4Map *)gUnknown_08499590)->height; y++)
    {
        for (x = 0; x < ((struct Unk5DCD4Map *)gUnknown_08499590)->width; x++)
        {
            if ((s8)gUnknown_03003340[y][x] < 0)
                continue;
            idx = ((struct Unk5DCD4Map *)gUnknown_08499590)->rows[y] + x;
            if (((struct Unk5DCD4Map *)gUnknown_08499590)->unk376a[idx] <= bestVal)
                continue;
            q = gUnknown_08499590 + 0x12;
            if (q[idx] != 0)
                continue;
            if (sub_08058DEC(x, y, buf) != 0)
                continue;
            bestX = x;
            bestY = y;
            dstX = buf[0];
            dstY = buf[1];
            bestVal = ((struct Unk5DCD4Map *)gUnknown_08499590)->unk376a[
                    ((struct Unk5DCD4Map *)gUnknown_08499590)->rows[y] + x];
        }
    }

    if (dstX <= 0)
        return;

    ((struct Unk5DCD4Unit *)gUnknown_030040D8)->unk09_6--;
    if (bestX != dstX)
        dir = dstX - bestX + 3;
    else if (bestY != dstY)
        dir = bestY - dstY + 2;
    sub_0805D648(dstX, dstY, 8, dir, 0);
}
