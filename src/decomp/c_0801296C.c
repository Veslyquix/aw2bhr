#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801296C.
 * sub_0801296C @ 0x0801296C, sub_0801297C @ 0x0801297C
 */

#include "hardware.h"


void sub_0801296C(void)
{
    gDispIo.disp_ct.forced_blank = 1;
}

void sub_0801297C(void)
{
    gDispIo.disp_ct.forced_blank = 0;
}
