#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014BD4.
 * sub_08014BD4 @ 0x08014BD4
 */

#include "proc.h"

void sub_08014BD4(ProcPtr parent)
{
    Proc_Start(gUnknown_0848A150, parent);
}
