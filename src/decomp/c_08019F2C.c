#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019F2C.
 * sub_08019F2C @ 0x08019F2C, sub_08019F50 @ 0x08019F50
 */

/* Returns a value, and the epilogue is the proof: `pop {r1}; bx r1` rather than
 * `pop {r0}; bx r0`. Probed directly -- this exact body written
 * `void f(...) { g(...); }` pops r0 and written `int f(...) { return g(...); }`
 * pops r1 -- which corrects the `void sub_08019F2C(...)` this had been declared
 * with since wave 21. The four `lsls #0x10; lsrs #0x10` pairs are PROMOTE_MODE
 * on the four u16 parameters, the fifth arriving on the stack. */
int sub_08019F2C(const void *a, u16 b, u16 c, u16 d, u16 e)
{
    return sub_08019F90(a, b, c, d, e);
}

/* sub_08019F2C with a `sub_0801A604()` in front of it; same five parameters and
 * the same `pop {r1}` returns-a-value epilogue. */
int sub_08019F50(const void *a, u16 b, u16 c, u16 d, u16 e)
{
    sub_0801A604();
    return sub_08019F90(a, b, c, d, e);
}
