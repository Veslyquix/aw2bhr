#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08049170.
 * sub_08049170 @ 0x08049170
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08049170.
 * sub_08049170 @ 0x08049170
 */

struct Unk8049170
{
    /* 0x00 */ u8 filler_00[0x64];
    /* 0x64 */ u16 unk64;
};

void sub_08049170(struct Unk8049170 *s)
{
    s->unk64 = 0;
}
