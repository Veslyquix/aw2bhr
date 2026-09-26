#include "global.h"

/* PARKED at configured 86.7% (256/256 bytes), reverified wave 67 from this
 * readable source. `best.c` is an older permuter-mutated 87.11% artifact and
 * is intentionally not used as the canonical readable draft. Recognises the 2x2 tile group
 * 0x24/0x25 + 0x27 over 0x64/0x65 + 0x67 on the gUnknown_08499590 screen and
 * returns which corner (x, y) is: 1 = top left, 2 = top right, 3 = bottom
 * left, 0 = not part of one.
 *
 * REMAINING DIFF: the result accumulator and the two screen-table pointers
 * permute registers. The ROM keeps x in r2, y in r5, the result in r6, the row
 * table in r3 and the cell table in r1; this draft shifts x to r3 and y to r6.
 * Size, pool words and pool order are all exact, and the arithmetic is
 * instruction-for-instruction identical -- only register names differ.
 *
 * RULED OUT (wave 31, W31-B): the STRUCT view of gUnknown_08499590. That is
 * the change that closed sub_0800B1FC, sub_0800BC5C and sub_0800BC98 on this
 * very screen in the same wave, and the transfer does NOT hold here -- it makes
 * this one strictly worse, spilling `result` into `ip` (`mov ip, r0` at each of
 * the four assignments, plus `mov r0, ip` at the return) and adding two bytes.
 * The reason is visible in the ROM and is worth carrying: this function already
 * computes `base + 0x417A` and `base + 0xA22` into their own registers and
 * keeps BOTH live across the whole body, which is exactly what the flat
 * `rows = p + 0x417A; p += 0xA22` locals below produce. The 0x0800B trio each
 * touch ONE table once, so there the member-array hoist was the only way to get
 * `base + offsetof` computed first. Same screen, opposite spellings -- the
 * wave-18 "do not normalise siblings onto one spelling" lesson again.
 *
 * NEXT: this is the ref-count/live-length species. `result` is live across the
 * entire switch with 5 references; the two table pointers have 4 and 7. Apply
 * the step-1a pinned-reference check in docs/agbcc-codegen.md before spending
 * attempts -- most of these references are pinned to emitted instructions.
 *
 * WAVE 65 (W65-I), confirmed wave 67: the residual remains the
 * instruction-order-exact three-
 * cycle x r3->r2, rows r1->r3, cells r2->r1, with size and pool order exact.
 * A zero-trip wrapper around the whole switch was byte-neutral, and this
 * function had already exhausted the permuter. No further source-order search
 * is justified at this fixpoint.
 */
int sub_0800E9F4(int x, int y)
{
    int result = 0;
    u8 *p;
    u8 *rows;
    int t;
    int ro;
    int ro2;
    int i;

    p = gUnknown_08499590;
    t = y * 2;
    rows = p + 0x417A;
    ro = *(u16 *)(rows + t);
    t = (ro + x) * 2;
    p += 0xA22;

    switch (*(u16 *)(p + t))
    {
    case 0x24:
    case 0x25:
        i = ro + 1;
        t = (i + x) * 2;
        if (*(u16 *)(p + t) == 0x27)
        {
            t = (y + 1) * 2;
            ro2 = *(u16 *)(rows + t);
            t = (ro2 + x) * 2;
            if (*(u16 *)(p + t) == 0x64 || *(u16 *)(p + t) == 0x65)
            {
                i = ro2 + 1;
                t = (i + x) * 2;
                if (*(u16 *)(p + t) == 0x67)
                    result = 1;
            }
        }
        break;

    case 0x27:
        i = ro - 1;
        t = (i + x) * 2;
        if (*(u16 *)(p + t) == 0x24 || *(u16 *)(p + t) == 0x25)
        {
            t = (y + 1) * 2;
            ro2 = *(u16 *)(rows + t);
            i = ro2 - 1;
            t = (i + x) * 2;
            if (*(u16 *)(p + t) == 0x64 || *(u16 *)(p + t) == 0x65)
            {
                t = (ro2 + x) * 2;
                if (*(u16 *)(p + t) == 0x67)
                    result = 2;
            }
        }
        break;

    case 0x64:
    case 0x65:
        t = (y - 1) * 2;
        ro2 = *(u16 *)(rows + t);
        t = (ro2 + x) * 2;
        if (*(u16 *)(p + t) == 0x24 || *(u16 *)(p + t) == 0x25)
        {
            i = ro2 + 1;
            t = (i + x) * 2;
            if (*(u16 *)(p + t) == 0x27)
            {
                i = ro + 1;
                t = (i + x) * 2;
                if (*(u16 *)(p + t) == 0x67)
                    result = 3;
            }
        }
        break;
    }

    return result;
}




