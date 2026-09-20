#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043418.
 * sub_08043418 @ 0x08043418
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043418.
 * sub_08043418 @ 0x08043418
 */


/* A `switch` over 19 sprite kinds that nudges the (x, y) it was handed, picks
 * an animation id and puts one sprite. Cases 4 and 8..11 are absent -- their
 * jump-table slots point at the tail, which is also the default, and the id
 * that reaches sub_0801C7DC in those cases is the selector itself.
 *
 * Case 0 reads the unit id under the pixel position: the s16 scroll fields
 * (gMap->scrollX / scrollY) are added before the `>> 4` that turns a pixel
 * coordinate into a cell coordinate, and the cell is gMap->unit[idx]. They are
 * a different pair from the tile-granularity camX / camY.
 *
 * `id` is REUSED as the 4-or-0 flag in case 0, rather than a `flag` local:
 * a separate local lands the constant straight in r2 and the original spends
 * `adds r2, r4, #0` copying it out of the switch variable's register. The
 * rowOffset load is its own statement with the column computed after it, which
 * keeps the frame at `push {r4, r5, r6, lr}`.
 */
void sub_08043418(int x, int y, int id)
{
    int idx;
    int col;
    int row;

    switch (id)
    {
    case 0:
        x += 8;
        y += 8;
        row = (y + gMap->scrollY) >> 4;
        idx = gMap->rowOffset[row];
        col = (x + gMap->scrollX) >> 4;
        idx += col;
        if (gMap->unit[idx] == 0 && sub_08042424(col, row))
            id = 4;
        else
            id = 0;
        id = sub_08043574(x, y, id);
        break;
    case 1:
        x += 8;
        y += 8;
        id = sub_08043574(x, y, 0);
        break;
    case 2:
        x += 8;
        y += 8;
        id = 0x10;
        break;
    case 3:
        id = 0x11;
        break;
    case 5:
        x += 8;
        y += 8;
        id = sub_08043574(x, y, 8);
        break;
    case 6:
        x += 8;
        y += 8;
        id = sub_08043574(x, y, 0xc);
        break;
    case 7:
        x += 8;
        y += 8;
        id = 0x12;
        break;
    case 12:
        x += 8;
        y += 0x10;
        id = 0x14;
        break;
    case 13:
        x += 8;
        y += 0x10;
        id = 0x13;
        break;
    case 14:
        id = 0x15;
        break;
    case 15:
        id = 0x16;
        break;
    case 16:
        id = 0x17;
        break;
    case 17:
        id = 0x18;
        break;
    case 18:
        x += 8;
        y += 8;
        id = 0x19;
        break;
    }

    sub_0801C7DC(gUnknown_08101EC0, id, gGameClock,
                 x & 0x1FF, y & 0xFF, 0x1365, 1);
}
