#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080733B8.
 * sub_080733B8 @ 0x080733B8
 */

#include "proc.h"


void sub_080733B8(void)
{
    Proc_EndEach(gUnknown_086140D4);
}
