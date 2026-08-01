#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806D820.
 * sub_0806D820 @ 0x0806D820
 */

/* The other half of the sub_080656E0 pair -- only the script blob differs. */

void sub_0806D820(void)
{
    struct Unk03001470 *p = sub_080152EC(gUnknown_08581F40, 3);

    p->unk28 = 30;
    p->unk2c = -1;
    p->unk44 = 14;
}
