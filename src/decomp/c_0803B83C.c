#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803B83C.
 * sub_0803B83C @ 0x0803B83C, sub_0803B858 @ 0x0803B858
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803B83C.
 * sub_0803B83C @ 0x0803B83C
 */

#include "proc.h"

/* Two statements: stop the gUnknown_0849B048 blob through sub_0801537C, then
 * start the gUnknown_0849E7F8 proc on tree 3. sub_0801537C returns `int` and
 * the result is dropped -- the value is never re-narrowed and `pop {r0}` makes
 * this void, so the two `bl`s are sequential statements and not a nesting.
 * Proc_Start's result is discarded too. */

void sub_0803B83C(void)
{
    sub_0801537C(gUnknown_0849B048);
    Proc_Start(gUnknown_0849E7F8, PROC_TREE_3);
}

/* Three statements, all results discarded: sub_0803BCA0, then sub_08085AF4,
 * then start the gUnknown_0849EC8C proc on tree 3. The first two are both
 * declared void(void) already and neither reads r0, so the run of `bl`s is
 * three statements rather than any nesting.
 * `pop {r0}; bx r0` -> void. */

void sub_0803B858(void)
{
    sub_0803BCA0();
    sub_08085AF4();
    Proc_Start(gUnknown_0849EC8C, PROC_TREE_3);
}
