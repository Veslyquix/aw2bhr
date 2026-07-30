#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08065668.
 * sub_08065668 @ 0x08065668
 */

struct Unk65668Proc
{
    /* 00 */ u8 filler_00[0x34];
    /* 34 */ int unk34;
    /* 38 */ int unk38;
};

/* MATCHED, and the first of a byte-identical pair with sub_0806D77C. Seeds a
 * two-word scroll state from a global flag.
 *
 * Written as two full arms rather than `proc->unk38 = flag ? 2 : -2;` -- the
 * ROM stores 0 into unk34 SEPARATELY on each side of the branch, reusing the
 * already-zero compare register on one of them, which the ternary hoists into
 * one store ahead of the branch. */
void sub_08065668(struct Unk65668Proc *proc)
{
    if (gUnknown_08580934->unk30 == 0)
    {
        proc->unk34 = 0;
        proc->unk38 = -2;
    }
    else
    {
        proc->unk34 = 0;
        proc->unk38 = 2;
    }
}
