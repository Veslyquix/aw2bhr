#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803BA88.
 * sub_0803BA88 @ 0x0803BA88
 */

#include "proc.h"

/* Picks link-slot 1, refreshes the two caches, and either hands the slot to
 * sub_08017688 or falls back to mode 1 and the gUnknown_0849EB7C script.
 *
 * The slot is `u8` -- sub_08016D04's `s8` return is re-narrowed
 * `lsls #0x18; lsrs #0x18` at the call site, which is the UNSIGNED half of the
 * pair -- and it is cast back to `s8` for sub_08016CD8 and passed as-is
 * everywhere else. The two predicates are one `&&`: both failures land on the
 * same else block.
 *
 * `movs r1,#3` is PROC_TREE_3, not a bare integer. */
void sub_0803BA88(void)
{
    u8 v;

    v = sub_08016D04(1);

    sub_08016EA4();
    sub_08016E74();

    if (sub_08016CD8(v) && sub_08016E04(v))
    {
        sub_08017688(v);
    }
    else
    {
        gUnknown_03003FC0.unk01 = 1;
        Proc_Start(gUnknown_0849EB7C, PROC_TREE_3);
    }
}
