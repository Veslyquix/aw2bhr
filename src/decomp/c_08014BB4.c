#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014BB4.
 * sub_08014BB4 @ 0x08014BB4, sub_08014BC0 @ 0x08014BC0
 */

#include "proc.h"


void sub_08014BB4(void)
{
    gUnknown_03002514 = 0;
}

void sub_08014BC0(ProcPtr parent)
{
    Proc_Start(gUnknown_0848A140, parent);
}
