#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080366A4.
 * sub_080366A4 @ 0x080366A4
 */

/* Installs the block's two frame hooks. The order is the ROM's: sub_080366D0
 * (gUnknown_030040D0) first, then sub_080366C4 (gUnknown_030040EC). */
void sub_080366A4(void)
{
    sub_08011B18();
    sub_080366D0(sub_08036884);
    sub_080366C4(sub_080368E8);
}
