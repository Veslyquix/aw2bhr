#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08073CA0.
 * sub_08073CA0 @ 0x08073CA0
 */

/* Existence predicate for gUnknown_086141DC; its starter is the immediately
 * preceding sub_08073C88. Identical to sub_08073918 but for the script. */

#include "proc.h"

int sub_08073CA0(void)
{
    return Proc_Find(gUnknown_086141DC) != 0;
}
