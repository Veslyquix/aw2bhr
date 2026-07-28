#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080342DC.
 * sub_080342DC @ 0x080342DC
 */

#include "proc.h"

void sub_080342DC(ProcPtr parent)
{
    Proc_StartBlocking(gUnknown_0849B3CC, parent);
}
