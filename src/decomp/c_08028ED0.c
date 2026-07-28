#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08028ED0.
 * sub_08028ED0 @ 0x08028ED0
 */

#include "proc.h"

void sub_08028ED0(ProcPtr parent)
{
    Proc_StartBlocking(gUnknown_08499FEC, parent);
}
