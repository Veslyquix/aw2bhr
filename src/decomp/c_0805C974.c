#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805C974.
 * sub_0805C974 @ 0x0805C974
 */

/* Two explicit returns, not `return g == 1;` -- the latter materialises a zero
 * up front and merges the arms into an `adds r0, r1, #0` tail.
 */
int sub_0805C974(void)
{
    if (gUnknown_030040DC == 1)
        return 1;

    return 0;
}
