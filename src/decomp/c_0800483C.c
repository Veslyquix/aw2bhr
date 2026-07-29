#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800483C.
 * sub_0800483C @ 0x0800483C
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file .text as one
 * contiguous block at 0x0800483C.
 * sub_0800483C @ 0x0800483C
 */

/* Family F056 (data/families.json): `push {lr}; bl A; movs r0,#K; bl B;
 * pop {r0}; bx r0` -- 16 bytes, three members, and the three agree on nothing
 * but the shape: `varies` gives three distinct first callees, two distinct
 * immediates and three distinct second callees. Callee A's result (if it has
 * one) is discarded, because B's r0 is loaded by the `movs`.
 * `pop {r0}` is the void epilogue.
 */


/* sub_0801A168 is `int(void)` and its result is discarded -- the ROM does not
 * settle its return width (see include/unknown-functions.h), and it does not
 * matter here because nothing narrows after the `bl`. src/decomp/c_0800484C.c
 * and eight other promoted files spell the same discarded call.
 *
 * The second callee is shared with family F056's other side of the batch:
 * sub_0800056C is called with `movs r0, #1` here and in sub_08004824 (F055).
 * Verified per member rather than assumed -- the other two F056 members call
 * sub_08034308 and sub_0806CC00 instead.
 */

void sub_0800483C(void)
{
    sub_0801A168();
    sub_0800056C(1);
}
