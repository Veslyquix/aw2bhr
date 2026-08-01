#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08005598.
 * sub_08005598 @ 0x08005598
 */

/* The other half of the sub_08005560 pair -- only the script blob differs. */

void sub_08005598(void)
{
    gUnknown_0200B0B0->unk02 = 0;
    sub_080152EC(gUnknown_0848846C, 0);
}
