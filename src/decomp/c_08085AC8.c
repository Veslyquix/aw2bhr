#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08085AC8.
 * sub_08085AC8 @ 0x08085AC8, sub_08085ADC @ 0x08085ADC
 */

#include "proc.h"

void sub_08085AC8(void)
{
    Proc_Start(gUnknown_08616B74, PROC_TREE_3);
}

int sub_08085ADC(void)
{
    return Proc_Find(gUnknown_08616B74) != 0;
}
