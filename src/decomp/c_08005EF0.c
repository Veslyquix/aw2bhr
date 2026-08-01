#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08005EF0.
 * sub_08005EF0 @ 0x08005EF0
 */

/* One statement: a `?:` picking the script blob, then the s8 slot id
 * sub_080152C0 returns parked in gUnknown_0200B0B0->unk6b. */
void sub_08005EF0(int a1)
{
    gUnknown_0200B0B0->unk6b =
        sub_080152C0((s32)(a1 != 0 ? gUnknown_084886CC : gUnknown_084886BC), 0);
}
