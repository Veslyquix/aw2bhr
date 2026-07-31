#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080447EC.
 * sub_080447EC @ 0x080447EC
 */

#include "proc.h"

void sub_080447EC(ProcPtr parent)
{
    sub_0803B4DC(0xc4);
    sub_080443C4(parent);
}
