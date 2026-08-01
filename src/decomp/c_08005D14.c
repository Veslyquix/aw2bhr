#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08005D14.
 * sub_08005D14 @ 0x08005D14
 */

/* The deref is bound to a LOCAL: both `strh`s come off one `ldr` of
 * gUnknown_0200B0B0, the same idiom src/decomp/c_08005D50.c records for its
 * three stores. +0x46 and +0x48 are past `strh`'s imm5*2 range, which is why
 * each needs its own `adds`. */
void sub_08005D14(void)
{
    struct Unk0200B0B0 *p;

    sub_0800056C(8);

    p = gUnknown_0200B0B0;
    p->unk46 = 0x15;
    p->unk48 = 0x10;

    sub_0801A614();
    sub_0801A168();
    sub_080152EC(gUnknown_0848867C, 0);
    sub_0800056C(8);
}
