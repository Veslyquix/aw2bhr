#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08078198.
 * sub_08078198 @ 0x08078198, sub_080781F0 @ 0x080781F0
 */

#include "proc.h"

bool8 sub_08078198(void)
{
    return (Proc_Find(gUnknown_086147FC) != NULL)
         | (Proc_Find(gUnknown_0861485C) != NULL)
         | (Proc_Find(gUnknown_08614894) != NULL)
         | (Proc_Find(gUnknown_08614614) != NULL);
}

/* "Does any of the 42 bytes of gUnknown_0202FDFC.unk12 have bit 1 set?" --
 * the any-of version of sub_080782C0's count. 0x2a is exactly unk12's length,
 * which is the corroboration that the array bound in that struct is right.
 *
 * The early `return 1` is a real return, not a flag: `movs r0, #1; b` jumps
 * straight to the epilogue from inside the loop. `gUnknown_0202FE0E` is
 * `&gUnknown_0202FDFC.unk12`; the candidate spells the same address as
 * `gUnknown_0202FDFC+0x12`. */

s32 sub_080781F0(void)
{
    s32 i;

    for (i = 0; i < 0x2a; i++)
    {
        if (gUnknown_0202FDFC.unk12[i] & 2)
            return 1;
    }

    return 0;
}
