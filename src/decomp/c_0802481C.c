#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802481C.
 * sub_0802481C @ 0x0802481C
 */

/* Family F031: `callee(gPointerGlobal)`. The DOUBLE load -- `ldr r0,=g` then
 * `ldr r0,[r0]` -- is the global being a pointer VARIABLE and being
 * dereferenced, not a pool word holding an address; `pop {r0}` makes the
 * wrapper void. Exemplar src/decomp/c_0804B14C.c. */

void sub_0802481C(void)
{
    sub_08014ED4(gUnknown_03003F68);
}
