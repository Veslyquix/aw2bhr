#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806A454.
 * sub_0806A454 @ 0x0806A454
 */

#include "proc.h"

/* Resets the sub_0806A054 ticket counter and starts the screen's proc on
 * tree 3. The Proc_Start result is discarded (`pop {r0}; bx r0`). */
void sub_0806A454(void)
{
    sub_0803B588();
    gUnknown_0202F204 = 0;
    Proc_Start(gUnknown_08581500, PROC_TREE_3);
}
