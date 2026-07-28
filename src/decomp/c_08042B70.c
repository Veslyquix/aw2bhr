#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042B70.
 * sub_08042B70 @ 0x08042B70, sub_08042B84 @ 0x08042B84
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042B70.
 * sub_08042B70 @ 0x08042B70
 */

void sub_08042B70(void)
{
    sub_080152EC(gUnknown_0849A0F0, 0);
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042B84.
 * sub_08042B84 @ 0x08042B84
 */

void sub_08042B84(void)
{
    struct Unk03001470 *p = sub_080152EC(gUnknown_0849A0F0, 0);

    p->unk20 = 1;
}
