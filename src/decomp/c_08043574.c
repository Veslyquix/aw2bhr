#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043574.
 * sub_08043574 @ 0x08043574
 */

/* Picks the corner an on-screen box should hang off: the screen is split at
 * x = 0xd0 and y = 0x80 and the sprite id is bumped by 1, 2 or 3 for three of
 * the four quadrants, leaving the top-left quadrant unchanged.  All three
 * comparisons are signed, so all three parameters are `int`.
 */
int sub_08043574(int x, int y, int id)
{
    if (x > 0xcf)
    {
        if (y > 0x7f)
            id += 2;
        else
            id += 1;
    }
    else if (y > 0x7f)
    {
        id += 3;
    }

    return id;
}
