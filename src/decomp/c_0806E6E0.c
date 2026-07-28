#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806E6E0.
 * sub_0806E6E0 @ 0x0806E6E0
 */

#include "proc.h"

/* Byte-identical to sub_0806E6B4, which starts the same script. */
void sub_0806E6E0(ProcPtr parent)
{
    Proc_StartBlocking(gUnknown_08582B94, parent);
}
