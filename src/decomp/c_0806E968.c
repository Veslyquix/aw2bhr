#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806E968.
 * sub_0806E968 @ 0x0806E968
 */

#include "hardware.h"
#include "proc.h"
/* Alpha-blend fade step; 0x20-frame ramp counted at +0x58. Unlike its
 * sibling sub_0806EA28 the two coefficients straddle 8 rather than
 * summing to 0x10, so EVA must be computed before EVB clobbers r0. */
struct Unk0806E968
{
    /* 0x00 */ u8 filler_00[0x58];
    /* 0x58 */ int unk58;
};

void sub_0806E968(struct Unk0806E968 *proc)
{
    int v;

    v = Interpolate(0, 0, 8, proc->unk58, 0x20);
    gUnknown_030030E0.bits.effect = 1;
    gUnknown_03002020 = 8 - v;
    gUnknown_03002B28 = v + 8;
    gUnknown_03001FFC = 0;

    if (proc->unk58 > 0x1f)
        Proc_Break(proc);
    else
        proc->unk58++;
}
