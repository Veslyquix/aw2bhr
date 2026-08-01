#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063518.
 * sub_08063518 @ 0x08063518
 */

/* A state predicate on the same link record. The `movs #0` / `movs #1` split
 * across an unconditional `b` is the if/else spelling -- `return x == 0xE9;`
 * goes through do_store_flag instead and has no unconditional branch. */
int sub_08063518(struct Unk08062FB8 *p)
{
    if (p->unk18 == 0xE9)
        return 1;
    else
        return 0;
}
