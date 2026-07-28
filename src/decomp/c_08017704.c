#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017704.
 * sub_08017704 @ 0x08017704
 */

/* No return on the fall-through path: the original leaves the argument in r0.
 * UB in C, correct here -- adding `return a;` flips both the block layout and
 * the register allocation. */
u32 sub_08017704(u32 a)
{
    if (gUnknown_0200C420.unk00 < a)
        return 0;
    gUnknown_0200C420.unk00 -= a;
}
