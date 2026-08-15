#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800EC20.
 * sub_0800EC20 @ 0x0800EC20
 */

/* sub_0800EC20 -- MATCHED, wave 60 (W60-H).  Autotile fixup: on the tile at
 * (x, y), look at the neighbour named by gUnknown_0200B0B0->unk20 and repaint
 * the corner it shares with this one.  Eight of the nine arms read the map
 * through the same five-statement idiom as the matched c_08001158.c, and the
 * whole function turns on how that idiom is punctuated:
 *
 *  1. `col` MUST be its own statement.  Written as `(*(u16 *)(rows + t) - 1 + x)`
 *     gcse/PRE hoists the `- 1` out of the successor blocks and reassociates it
 *     into `rowval + (x - 1)`, which steals x's low register.  30.8% -> 95.3%.
 *  2. `p += 0xA22;` in place, not `tiles = p + 0xA22;`.  95.3% -> 96.1%.
 *  3. `p += off;` as its own statement, not `*(u16 *)(p + off)`.  96.1% -> 99.5%
 *     -- see the allocno note below; this is the whole ballgame.
 *  4. `tile` is a real local in ALL eight arms, including the four that test the
 *     value exactly once.  Inline, the load lands in r0 instead of r1.  99.5% ->
 *     match.
 *
 * (3) is not a code-shape change at all -- both spellings emit the identical
 * `adds r1,r1,r0; ldrh r1,[r1]` -- it only changes agbcc's REFERENCE COUNT for
 * p, and that is what decides whether p or t gets the lower hard register.  See
 * the "allocno_compare ranks by floor_log2(n_refs) * n_refs / live_length"
 * chapter in docs/agbcc-codegen.md. */
void sub_0800EC20(int x, int y)
{
    u8 *p;
    u8 *rows;
    int t;
    int off;
    int col;
    int tile;

    switch (gUnknown_0200B0B0->unk20)
    {
    case 70:
        sub_0800EBFC(x - 1, y - 1, 0x87);
        sub_0800EBFC(x, y - 1, 0x87);
        sub_0800EBFC(x + 1, y - 1, 0x87);
        sub_0800EBFC(x - 1, y, 0x87);
        sub_0800EBFC(x + 1, y, 0x87);
        sub_0800EBFC(x - 1, y + 1, 0x87);
        sub_0800EBFC(x, y + 1, 0x87);
        sub_0800EBFC(x + 1, y + 1, 0x87);
        break;

    case 103:
        p = gUnknown_08499590;
        t = (y - 1) * 2;
        rows = p + 0x417A;
        col = *(u16 *)(rows + t) - 1;
        off = (col + x) * 2;
        p += 0xA22;
        p += off;
        tile = *(u16 *)p;

        if (tile == 70)
        {
            sub_0800EBFC(x - 2, y - 2, 0x25);
            sub_08001158(x - 1, y - 2, 0x27);
            sub_0800EBFC(x, y - 2, 0x87);
            sub_0800EBFC(x - 2, y - 1, 0x65);
            sub_08001158(x - 1, y - 1, 0x67);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x - 2, y, 0x87);
            sub_0800EBFC(x - 1, y, 0x87);
        }
        else if (tile == 68 || tile == 69)
        {
            sub_0800EBFC(x - 1, y - 2, 0x25);
            sub_08001158(x, y - 2, 0x27);
            sub_0800EBFC(x - 1, y - 1, 0x65);
            sub_08001158(x, y - 1, 0x67);
            sub_0800EBFC(x - 1, y, 0x87);
        }
        else if (tile == 36 || tile == 37)
        {
            sub_0800EBFC(x - 1, y - 1, 0x87);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x - 1, y, 0x87);
        }
        break;

    case 100:
    case 101:
        p = gUnknown_08499590;
        t = (y - 1) * 2;
        rows = p + 0x417A;
        col = *(u16 *)(rows + t) + 1;
        off = (col + x) * 2;
        p += 0xA22;
        p += off;
        tile = *(u16 *)p;

        if (tile == 70)
        {
            sub_0800EBFC(x, y - 2, 0x87);
            sub_0800EBFC(x + 1, y - 2, 0x25);
            sub_08001158(x + 2, y - 2, 0x27);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x + 1, y - 1, 0x65);
            sub_08001158(x + 2, y - 1, 0x67);
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x + 2, y, 0x87);
        }
        else if (tile == 71)
        {
            sub_0800EBFC(x, y - 2, 0x25);
            sub_08001158(x + 1, y - 2, 0x27);
            sub_0800EBFC(x, y - 1, 0x65);
            sub_08001158(x + 1, y - 1, 0x67);
            sub_0800EBFC(x + 1, y, 0x87);
        }
        else if (tile == 39)
        {
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x + 1, y - 1, 0x87);
            sub_0800EBFC(x + 1, y, 0x87);
        }
        break;

    case 39:
        p = gUnknown_08499590;
        t = (y + 1) * 2;
        rows = p + 0x417A;
        col = *(u16 *)(rows + t) - 1;
        off = (col + x) * 2;
        p += 0xA22;
        p += off;
        tile = *(u16 *)p;

        if (tile == 70)
        {
            sub_08001158(x - 1, y, 0x27);
            sub_08001158(x - 1, y + 1, 0x67);
            sub_0800EBFC(x - 2, y + 1, 0x65);
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x, y + 2, 0x87);
            sub_0800EBFC(x - 2, y + 2, 0x87);
            sub_0800EBFC(x - 1, y + 2, 0x87);
        }
        else if (tile == 100 || tile == 101)
        {
            sub_0800EBFC(x - 1, y, 0x87);
            sub_0800EBFC(x - 1, y + 1, 0x87);
            sub_0800EBFC(x, y + 1, 0x87);
        }
        break;

    case 36:
    case 37:
        p = gUnknown_08499590;
        t = (y + 1) * 2;
        rows = p + 0x417A;
        col = *(u16 *)(rows + t) + 1;
        off = (col + x) * 2;
        p += 0xA22;
        p += off;
        tile = *(u16 *)p;

        if (tile == 103)
        {
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x + 1, y + 1, 0x87);
        }
        else if (tile == 71)
        {
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x, y + 1, 0x25);
            sub_08001158(x + 1, y + 1, 0x27);
        }
        else if (tile == 70)
        {
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x, y + 2, 0x87);
            sub_0800EBFC(x + 1, y, 0x25);
            sub_0800EBFC(x + 1, y + 1, 0x65);
            sub_0800EBFC(x + 1, y + 2, 0x87);
            sub_08001158(x + 2, y + 1, 0x67);
            sub_0800EBFC(x + 2, y + 2, 0x87);
        }
        break;

    case 68:
    case 69:
        p = gUnknown_08499590;
        t = y * 2;
        rows = p + 0x417A;
        col = *(u16 *)(rows + t) + 1;
        off = (col + x) * 2;
        p += 0xA22;
        p += off;
        tile = *(u16 *)p;

        if (tile == 70)
        {
            sub_0800EBFC(x + 1, y - 1, 0x25);
            sub_0800EBFC(x + 1, y, 0x65);
            sub_08001158(x + 2, y, 0x67);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x + 1, y + 1, 0x87);
            sub_0800EBFC(x + 2, y + 1, 0x87);
        }
        break;

    case 71:
        p = gUnknown_08499590;
        t = y * 2;
        rows = p + 0x417A;
        col = *(u16 *)(rows + t) - 1;
        off = (col + x) * 2;
        p += 0xA22;
        p += off;
        tile = *(u16 *)p;

        if (tile == 70)
        {
            sub_08001158(x - 1, y - 1, 0x27);
            sub_08001158(x - 1, y, 0x67);
            sub_0800EBFC(x - 2, y, 0x65);
            sub_0800EBFC(x, y - 1, 0x87);
            sub_0800EBFC(x, y + 1, 0x87);
            sub_0800EBFC(x - 1, y + 1, 0x87);
            sub_0800EBFC(x - 2, y + 1, 0x87);
        }
        break;

    case 102:
        p = gUnknown_08499590;
        t = (y - 1) * 2;
        rows = p + 0x417A;
        off = (*(u16 *)(rows + t) + x) * 2;
        p += 0xA22;
        p += off;
        tile = *(u16 *)p;

        if (tile == 70)
        {
            sub_08001158(x, y - 2, 0x27);
            sub_08001158(x, y - 1, 0x67);
            sub_0800EBFC(x - 1, y - 1, 0x65);
            sub_0800EBFC(x - 1, y, 0x87);
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x + 1, y - 1, 0x87);
            sub_0800EBFC(x + 1, y - 2, 0x87);
        }
        break;

    case 38:
        p = gUnknown_08499590;
        t = (y + 1) * 2;
        rows = p + 0x417A;
        off = (*(u16 *)(rows + t) + x) * 2;
        p += 0xA22;
        p += off;
        tile = *(u16 *)p;

        if (tile == 70)
        {
            sub_0800EBFC(x - 1, y + 1, 0x25);
            sub_08001158(x, y + 1, 0x27);
            sub_08001158(x, y + 2, 0x67);
            sub_0800EBFC(x - 1, y, 0x87);
            sub_0800EBFC(x + 1, y, 0x87);
            sub_0800EBFC(x + 1, y + 1, 0x87);
            sub_0800EBFC(x + 1, y + 2, 0x87);
        }
        break;
    }

    sub_0800CEF8(x, y);
}
