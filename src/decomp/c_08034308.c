#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034308.
 * sub_08034308 @ 0x08034308
 */

#include "proc.h"

void sub_08034308(ProcPtr parent)
{
    Proc_StartBlocking(gUnknown_0849B8B8, parent);
}
