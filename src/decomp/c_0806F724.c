#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806F724.
 * sub_0806F724 @ 0x0806F724
 */

/* proc->unk3c[i]->unk48 = 1 -- a word-stride pointer table living INSIDE the
 * proc at +0x3c, and a byte flag at +0x48 of whatever it points at. The
 * adds r0, #0x3c lands on the BASE before the scaled index, which is the
 * member-array form; p[X + C] would have added the constant to the index.
 *
 * Neither +0x48 nor the table's length is pinned down by this function: the
 * store is a bare strb of 1 and no bound is checked. */
struct Unk6F724Entry
{
    /* 00 */ u8 filler_00[0x48];
    /* 48 */ u8 unk48;
};
struct Unk6F724Proc
{
    /* 00 */ u8 filler_00[0x3c];
    /* 3C */ struct Unk6F724Entry *unk3c[8];
};

void sub_0806F724(struct Unk6F724Proc *proc, int i)
{
    proc->unk3c[i]->unk48 = 1;
}
