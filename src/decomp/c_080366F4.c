#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080366F4.
 * sub_080366F4 @ 0x080366F4
 */

/* The guarded call of the hook sub_080366D0 installs. `bl _call_via_r0` is the
 * nullary indirect trampoline and the pointer stays in r0 across the NULL test,
 * so naming the global directly is enough -- no binding local is wanted. */
void sub_080366F4(void)
{
    if (gUnknown_030040D0 != NULL)
        gUnknown_030040D0();
}
