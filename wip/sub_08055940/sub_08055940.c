/* WAVE 87 (W87-E). Draft unchanged, still 9/248 (96.4%, `configured`).
 * THE `gUnknown_020296E4` ANCHOR IS REACHED -- see work/sub_08055940/W87-notes.md
 * and work/sub_08055940/w87-variantA.c. The two-statement split
 *     row1 = gUnknown_020296E4[0];   row0 = row1 - 20;
 * (as source binds inside a hand-inverted zero-trip `if`) leaves the pool word
 * PURE and derives row 0 with a runtime `sub #0x28`, and it emits the four
 * preheader values in the ROM's order [&counts0][E4][&counts1][E4-0x28]. Every
 * single-statement form of the -20 (incl. `gUnknown_020296E4[0] - 20`) folds
 * into a second pool word; the split is what defeats fold. Variant a scores
 * 92.7% (18/248) and is NOT promoted, because the pair
 * [adds r7,r0,#0][ldr =<.rodata force-addr word>; mov sb,r0] is emitted at the
 * END of the preheader's SOURCE material and BEFORE the LICM hoists in EVERY
 * spelling measured (a,b,c,d,e). The ROM has that pair BEFORE the four values,
 * so in the ROM the four are LICM HOISTS in a deferred order, not source binds
 * -- a source bind can reach their ORDER but never their POSITION. The open
 * problem is now purely the body-order rotation: body order is
 * [row0][c0][row1][c1] and the ROM's movable order is that rotated left by one.
 * The anchor direction is no longer part of the problem. */
#include "global.h"

/* Wave 80 (W80-D): still 248/248, nine bytes at +0x28..+0x30. Every row-1-
 * named spelling measured, none reaches the anchor: `gUnknown_020296E4[i-20]`
 * puts `subs #0x14` in the body; `(&E4)[-1][i]`, `*(E4 - 20 + i)` and
 * `*(u16 *)((u8 *)E4 - 0x28 + i * 2)` fold to one pool word E4-0x28 and add
 * 0x28 (this draft up to the reloc name); an IN-LOOP `u16 *row0 = E4 - 20;`
 * and an in-loop `int base` are byte-identical to this draft too (so wave
 * 77's -12 bytes came from locals defined outside the loop); naming both
 * symbols gives two pool words. Mechanism: the two row reads are separate
 * extended basic blocks, LICM hoists in body order, cse2 derives the second
 * preheader constant from the first. The ROM's [&c0][E4][&c1][E4-0x28] has
 * the row-0 constant hoisted LAST -- a deferred hoist no body spelling
 * produces. Parked as a hoist-order tie (docs chapter, wave 80). */
/* Wave 63, W63-A. NOT A MATCH: 248/248 bytes, 9 bytes differ (96.37%).
 * Everything after the counting-loop preheader is byte-exact. The residual is
 * one address-anchor direction: the ROM loads gUnknown_020296E4 (row 1), keeps
 * it in r5, and derives row 0 in r6 with `subs #0x28`; this draft loads
 * gUnknown_020296BC (row 0), keeps it in r6, and derives row 1 in r5 with
 * `adds #0x28`. The .rodata word for gUnknown_03004580 is relocation-equivalent.
 * A biased gUnknown_020296E4 declaration plus row1/row0 pointer locals reaches
 * the subtract direction, but swaps row0 with the live counts[1] address and
 * moves the preheader; negative flat and two-dimensional subscripts inhibit
 * the ROM's GIV. Function/block pointer scopes, zero-cost self-assignments and
 * moving the existing zero-trip do/while did not move that ceiling.
 * Wave 70, W70-B: configured re-verdict remains 248/248 with nine differing
 * bytes. A single in-loop row-1 cursor indexed as rows[-1]/rows[0] selects the
 * upper address, but keeps -0x28 on the varying address and drops 12 bytes.  *
 * WAVE 77, W77-L. Still 248/248, nine bytes, all five halfwords in ONE run at
 * +0x28..+0x30:
 *   ROM  mov r3,sp | ldr r5,=gUnknown_020296E4 | adds r4,r7,#0 |
 *        adds r6,r5,#0 | subs r6,#0x28
 *   here ldr r6,=gUnknown_020296BC | mov r3,sp | adds r5,r6,#0 |
 *        adds r5,#0x28 | adds r4,r7,#0
 * So the anchor direction and the interleaving of the invariant hoists are
 * ONE fact, not two. NEWLY RULED OUT: row1/row0 pointer locals with the
 * counts[] spelling left completely untouched -- both `row1 =
 * gUnknown_020296BC[1]; row0 = row1 - 20;` and `row0 = gUnknown_020296BC[0];`
 * land at -12 bytes / 13.7%, identical to each other and to wave 70's cursor.
 * That ISOLATES the collateral: it is not the counts cursor (byte-exact at
 * +0x18..+0x26 in this draft), it is that any pointer local for a row
 * inhibits the ROM's GIV and costs 12 bytes inside the loop. The next lever
 * must reach the row-1 anchor WITHOUT introducing a pointer local.
 */
void sub_08055940(u16 a1, u16 a2)
{
    u16 counts[2];
    u16 i;

    counts[0] = 0;
    counts[1] = 0;

    for (i = 0; i < 5; i++)
    {
        if (gUnknown_020296BC[0][i] != 0xff)
            counts[0]++;
        do
        {
            if (gUnknown_020296BC[1][i] != 0xff)
                counts[1]++;
        } while (0);
    }

    if (a1 == 2 && gUnknown_0300450C == 0)
        counts[1] = 0;
    if (a2 == 2 && gUnknown_0300450C == 1)
        counts[0] = 0;
    if (a1 == 2 && gUnknown_0300450C != 0)
        counts[0] = 0;
    if (a2 == 2 && gUnknown_0300450C != 1)
        counts[1] = 0;

    if (gUnknown_03004580[0][1] == 9 || gUnknown_03004580[0][1] == 0x14)
        counts[0] = 0;
    if (gUnknown_03004580[1][1] == 9 || gUnknown_03004580[1][1] == 0x14)
        counts[1] = 0;

    sub_08055A38(counts[0], 1);
    sub_08055A38(counts[1], 0);
}
