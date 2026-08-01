#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08062FB8.
 * sub_08062FB8 @ 0x08062FB8
 */

#include "hardware.h"

/* struct Unk08062FB8 moved to include/unknown-globals.h in wave 30 (W30-C),
 * layout unchanged: sub_08063430 operates on the same record and passes it
 * here, so the type has to be visible in both units. */

void sub_08062FB8(struct Unk08062FB8 *p)
{
    p->unk1e = 0;
    p->unk18 = 0;
    p->unk1d = 0;
    p->unk4a = 15;
    p->unk48 = 0;
    p->unk16 = 0;

    REG_RCNT = 0;
    REG_SIOCNT = 0x2003;
    REG_SIODATA8 = 0;
}
