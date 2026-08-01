#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063430.
 * sub_08063430 @ 0x08063430
 */

/* The other half of sub_08062FB8's link-hardware reset, on the same record.
 * The `strb r0, [r2]` pair stores a literal 0 -- r0 is the value the
 * `cmp r0, #0; beq` just proved zero and gcc reuses the register rather than
 * reloading, so the source is `= 0` and not a copy of the tested field. */
void sub_08063430(struct Unk08062FB8 *p)
{
    if (p->unk18 != 0)
        sub_08062FB8(p);
    else
    {
        p->unk4a = 0;
        p->unk1e = 0;
        p->unk18 = 1;
    }
}
