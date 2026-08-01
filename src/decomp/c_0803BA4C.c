#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803BA4C.
 * sub_0803BA4C @ 0x0803BA4C
 */

#include "proc.h"

/* The tree-3 starter for gUnknown_0849EB34, mode 1 -- the fourth member of the
 * sub_0803B8C4 / sub_0803BA00 / sub_0803BADC family.
 *
 * The two sub_08038690 calls are an if/else and NOT a ternary: a ternary
 * computes one constant and falls into a shared tail, whereas this has two
 * separate `bl`s. sub_080846F4's u8 return is tested with a bare `lsls #24`
 * and no `lsrs`, which is all a zero test needs. */
void sub_0803BA4C(void)
{
    sub_0803BA1C();
    if (sub_080846F4() != 0)
        sub_08038690(1);
    else
        sub_08038690(0);
    sub_08016E74();
    gUnknown_03003FC0.unk01 = 1;
    Proc_Start(gUnknown_0849EB34, PROC_TREE_3);
}
