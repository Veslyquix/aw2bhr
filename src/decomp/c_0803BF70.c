#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803BF70.
 * sub_0803BF70 @ 0x0803BF70
 */

void sub_0803BF70(void)
{
    if (gUnknown_0849ECDC->unk01 != gUnknown_0849ECDC->unk00)
        gUnknown_03002F1C = 1;
}
