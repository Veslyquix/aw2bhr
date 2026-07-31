#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804483C.
 * sub_0804483C @ 0x0804483C
 */

#include "proc.h"

void sub_0804483C(ProcPtr parent)
{
    sub_0803B4DC(502);
    sub_080443C4(parent);
}
