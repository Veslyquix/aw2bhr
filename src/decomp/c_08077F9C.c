#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08077F9C.
 * sub_08077F9C @ 0x08077F9C
 */

#include "proc.h"
/* A near-copy of sub_08077F30 (src/decomp/c_08077F30.c): the same
 * gUnknown_08615194 record lookup and the same sub_0803866C()-selected
 * unk28/unk24 ternary, published to gUnknown_030046B4. That file's comment
 * works out why the differing 0x24 / 0x28 constant folds into the base pointer
 * rather than staying an `ldr [.., #0x24]` displacement -- the two arms share
 * a tail, so only the base differs.
 *
 * What is new here is the proc tail: a straight branch on +0x3c between
 * calling the proc's own +0x38 hook and going to label 8 after sub_0803BD54.
 * `bl _call_via_r0` is nullary. The index is re-read from
 * gUnknown_0202FDFC.unk0c after the `bl` because sub_0803866C may write it,
 * while the three pool bases stay in r4/r5/r6 across the call as
 * callee-saved. */
struct Unk8077F9C
{
    /* 0x00 */ u8 filler_00[0x38];
    /* 0x38 */ void (*unk38)(void);
    /* 0x3c */ int unk3c;
};

void sub_08077F9C(struct Unk8077F9C *proc)
{
    sub_080638D0(0);

    gUnknown_03003FC0.unk02 = gUnknown_08615194[gUnknown_0202FDFC.unk0c].unk00;

    gUnknown_030046B4 = sub_0803866C()
        ? gUnknown_08615194[gUnknown_0202FDFC.unk0c].unk28
        : gUnknown_08615194[gUnknown_0202FDFC.unk0c].unk24;

    if (proc->unk3c == 0)
        proc->unk38();
    else
    {
        sub_0803BD54();
        Proc_Goto(proc, 8);
    }
}
