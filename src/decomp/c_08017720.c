#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017720.
 * sub_08017720 @ 0x08017720
 */

/* WAVE 53 PARK (superseded by the Wave 65 result below). Keep
 * the FULL ARRAY EXPRESSION in the search loop, do NOT reintroduce a pointer.
 *
 * Everything except the search loop's ADDRESSING is byte-exact against the ROM:
 * the sub_0803861C guard, the switch, the whole loop BODY, the `k == 5` bail,
 * the `movs r2,#3` / three `lsls` pre-block, the insertion shift loop, all
 * three bitfield stores, and the entire `case 1` arm.
 *
 * REMAINING DIFF: the ROM walks the array with a single POINTER giv --
 *   ldr r1,[pool]; <r1 += b*0x14>;  ...  adds r1,#4 ; ldrh r0,[r1,#2]
 * -- while this draft gets a THREE-PART address: `ip` holds the base, `r2`
 * holds `b * 0x14`, and the giv `r4` holds `k * 4`, so every read costs
 * `adds r0,r4,r2; add r0,ip` instead of nothing. That is +2 instructions in the
 * loop bottom and +5 in the guard, and it forces one extra callee-saved
 * register (`pop {r3,r4,r5}` where the ROM has `pop {r3,r4}`).
 *
 * WHY THE OBVIOUS FIX IS WRONG -- MEASURED, TWICE, THIS WAVE.
 * Binding the base to a pointer gets the single giv and immediately LOSES the
 * loop body. Both `struct Unk0200C078Rec *e = &g[b].unk00[0]; e->unk00_14` and
 * `e = g[b].unk00; e[k].unk00_14` collapse the field reads:
 *
 *   ROM / this draft   ldrh r0,[r1,#2] ; lsrs r0,#4        (three times, one
 *                      ldr  r0,[r1]    ; lsls #0xc ; lsrs #0x14   per read site)
 *   pointer form       ldr  r0,[r1]    ; lsrs r1,r0,#20    (ONCE, shared)
 *
 * With a pointer, the SImode load that `unk00_08` needs is available at every
 * read site, so CSE rewrites `unk00_14`'s HImode load as an extract from the
 * word already in hand and then eliminates the two redundant reloads. The ROM
 * reads `unk00_14` THREE times per iteration -- guard, `== c` test, and
 * back-edge test -- and that redundancy only survives when each read
 * recomputes its own address, i.e. when the access is spelled through the
 * global array. Net: pointer form is 8 bytes SHORT, array form is 24 long.
 * Recorded as a chapter in docs/agbcc-codegen.md.
 *
 * NEXT THING TO TRY: something that gives the single pointer giv WITHOUT making
 * one address expression serve both fields -- e.g. two separate walking
 * pointers, or the array form with `b` pre-multiplied. Do not go back to a
 * single `e`.
 *
 * Read-out notes worth keeping:
 *  - `struct Unk0200C078Rec` (8/12/12 bitfields in one word) was already in
 *    include/unknown-globals.h from W38-H/W43-E and needed no change. This
 *    function exercises all three fields in both directions and agrees with it
 *    exactly, including the `strb` for field 0, the `ldr/and 0xFFF000FF/orr`
 *    for field 1 and the `ldrh [+2]/and 0xf/orr` for field 2.
 *  - The comparisons are SIGNED (`blt`/`bge`/`bgt`) with no cast: a 12-bit
 *    `u32` bitfield promotes to `int`, so `field >= c` with an `int c` gives
 *    the signed condition for free.
 *  - `sub_0803861C` is declared `bool8 (void)` -- the ROM's `bl` with r0 still
 *    holding the first parameter is not an argument, it is leftover.
 *  - `sub_0803866C()` is called FOUR times in `case 1`, once per access. It is
 *    a call, so nothing CSEs it; spell it at each use.
 *  - The switch bodies are emitted in SOURCE order but the compare chain is
 *    ascending, which is why `case 2` must be written FIRST: the ROM tests 1
 *    then 2 and falls through into 2's block.
 *  - gUnknown_0808E55C is an agbcc -fforce-addr address constant:
 *    [0x0808E55C] = 0x0200C078 -> gUnknown_0200C078. Note the ROM reaches the
 *    SAME array both ways in one function -- through that word in the search
 *    loop and the final stores, and from its own .text pool in the shift loop.
 *    Naming the global normally reproduces both. Promotion must carry
 *      "rodata": ["0x0808E55C"]
 *
 * Semantics: an ordered insert into a fixed 5-slot (gUnknown_0200C078, mode 2)
 * or 2-slot (gUnknown_0200C2D0, mode 1) priority list per unit, keyed on
 * unk00_14 descending and unk00_08 ascending within a tie. Mode 2 biases the
 * unit index by 0x6c and mode 1 by 0x8a. */


/* Wave 65: MATCHED. A source-level walking pointer gives the ROM's single
 * pointer induction variable. Reading the upper bitfield through a volatile
 * u16 overlay preserves its three separate `ldrh; lsrs #4` reads; making the
 * whole struct volatile instead selects word loads. The labels are also
 * load-bearing: structured loops cross-jump the initial and back-edge guards,
 * while this explicit loop keeps the ROM's duplicated guard and `bge` back
 * edge. Promotion needs rodata 0x0808E55C. */
void sub_08017720(int a, int b, int c, int d)
{
    int k;
    int j;
    struct Unk0200C078Rec *e;

    if (sub_0803861C() == 0)
        return;

    switch (gUnknown_03003FC0.unk01)
    {
    case 2:
        b -= 0x6c;
        k = 0;
        e = &gUnknown_0200C078[b].unk00[0];
        if ((*(volatile u16 *)((u8 *)e + 2) >> 4) < c)
            goto search_done;
search_loop:
        if ((*(volatile u16 *)((u8 *)e + 2) >> 4) == c
            && e->unk00_08 > d)
            goto search_done;
        e++;
        k++;
        if (k > 4)
            goto search_done;
        if ((*(volatile u16 *)((u8 *)e + 2) >> 4) >= c)
            goto search_loop;
search_done:
        if (k == 5)
            return;
        for (j = 3; j >= k; j--)
            gUnknown_0200C078[b].unk00[j + 1] = gUnknown_0200C078[b].unk00[j];
        gUnknown_0200C078[b].unk00[k].unk00_00 = a;
        gUnknown_0200C078[b].unk00[k].unk00_14 = c;
        gUnknown_0200C078[b].unk00[k].unk00_08 = d;
        break;

    case 1:
        b -= 0x8a;
        if (gUnknown_0200C2D0[b].unk00[sub_0803866C()].unk00_14 > c)
            return;
        gUnknown_0200C2D0[b].unk00[sub_0803866C()].unk00_00 = a;
        gUnknown_0200C2D0[b].unk00[sub_0803866C()].unk00_14 = c;
        gUnknown_0200C2D0[b].unk00[sub_0803866C()].unk00_08 = d;
        break;
    }
}
