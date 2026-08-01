#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08081334.
 * sub_08081334 @ 0x08081334
 */

#include "proc.h"

/* Start one script unless a different one is already running. The two blobs are
 * NOT the same object -- Proc_Find looks for gUnknown_08616A40 and Proc_Start
 * launches gUnknown_08616A08 -- so this is a mutual exclusion between two
 * trees, not the usual "start it once" idiom. */
void sub_08081334(ProcPtr parent)
{
    if (Proc_Find(gUnknown_08616A40) == 0)
        Proc_Start(gUnknown_08616A08, parent);
}
