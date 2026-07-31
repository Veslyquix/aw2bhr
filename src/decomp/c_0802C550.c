#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802C550.
 * sub_0802C550 @ 0x0802C550
 */

#include "proc.h"

/* The two-script variant of the bare existence predicate that gUnknown_0849D3BC
 * and gUnknown_0849E750 carry: is either proc running.
 *
 * The spelling matters and three forms are distinguishable here. `return
 * Proc_Find(a) || Proc_Find(b);` goes through do_store_flag, which presets a
 * result register and costs a `push {r4}` this function does not have.
 * `if (Proc_Find(a)) return TRUE; if (Proc_Find(b)) return TRUE; return FALSE;`
 * merges the two TRUE arms and moves the merged block PAST the fallthrough
 * FALSE, so the pool ends up between `movs #0` and `movs #1` -- the mirror of
 * the ROM. Only the `||` inside an `if` gives the ROM's order: first test
 * branches TRUE, second branches FALSE, `movs #1` before the pool and `movs #0`
 * after it.
 */

bool8 sub_0802C550(void)
{
    if (Proc_Find(gUnknown_0849FEF8) || Proc_Find(gUnknown_0849FFB0))
        return TRUE;

    return FALSE;
}
