#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017688.
 * sub_08017688 @ 0x08017688
 */

/* `u16` and not `int`: the prologue's `adds r4, r0, #0; lsls r4, r4, #0x10;
 * lsrs r4, r4, #0x10` is PROMOTE_MODE's copy-then-narrow of a sub-word
 * parameter. An `int` parameter with a `(u16)` cast at the use folds the shift
 * pair away entirely, because the `strh` into the s16 field truncates for free
 * (measured with compile_probe, wave 26). */
void sub_08017688(u16 a)
{
    sub_080152EC(gUnknown_0848A1EC, 0)->unk1e = a;
}
