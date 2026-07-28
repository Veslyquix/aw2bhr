#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080251AC.
 * sub_080251AC @ 0x080251AC
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080251AC.
 * sub_080251AC @ 0x080251AC
 */

/* Family F000 (tools/families.py): `push {lr}; ldr r0,=X; bl S;
 * pop {r0}; bx r0` -- a one-line forwarder. `pop {r0}` is the void epilogue
 * per docs/agbcc-codegen.md, so the callee's result is discarded and this
 * returns nothing. The exemplar is src/decomp/c_080733B8.c.
 */


/* The odd one out of this batch: the pool word is a RAM address
 * (0x030013D0), so the global is NOT const -- sub_0802505C writes through it.
 * It is declared `u8 []` rather than a struct: only the ADDRESS is used here,
 * and `gArray` and `&gScalar` both give the clean pool word, so nothing in
 * this function discriminates. The offsets that are known are recorded on the
 * declaration in include/unknown-globals.h.
 */

void sub_080251AC(void)
{
    sub_0802505C(gUnknown_030013D0);
}
