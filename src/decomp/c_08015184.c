#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015184.
 * sub_08015184 @ 0x08015184
 */

/* Marks all 30 gUnknown_03001470 slots free and resets the count.
 * The 30 is the same bound sub_08015BD0 scans to.
 */
void sub_08015184(void)
{
    u8 i;

    for (i = 0; i < 30; i++)
        gUnknown_03001470[i].unk00 = 0;

    gUnknown_03002F1C = 0;
}
