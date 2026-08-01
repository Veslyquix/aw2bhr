#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806A158.
 * sub_0806A158 @ 0x0806A158, sub_0806A180 @ 0x0806A180, sub_0806A1A8 @ 0x0806A1A8, sub_0806A1D0 @ 0x0806A1D0
 */

#include "hardware.h"
struct Unk806A1A8
{
    /* 0x00 */ u8 filler_00[0x58];
    /* 0x58 */ int unk58;
};
#include "proc.h"
struct Unk806A1D0
{
    /* 0x00 */ u8 filler_00[0x58];
    /* 0x58 */ int unk58;
};

/* One half of a BG0 scroll ping-pong. The pool word for the partner is a
 * relocation, not a literal, so the address has to be named -- `(int)` is
 * only there because sub_080638D0's declared parameter is `int`. */
void sub_0806A158(void)
{
    REG_BG0HOFS = -gUnknown_0202F20C;
    sub_08063980(0x50);
    sub_080638D0((int)sub_0806A180);
}

/* The other half of the sub_0806A158 ping-pong: same shape, no negate, and
 * scanline 0 instead of 0x50. */
void sub_0806A180(void)
{
    REG_BG0HOFS = gUnknown_0202F20C;
    sub_08063980(0);
    sub_080638D0((int)sub_0806A158);
}

/* Arms the sub_0806A158/sub_0806A180 ping-pong: parks the scroll offset off
 * the left edge and resets the proc's frame counter. */
void sub_0806A1A8(struct Unk806A1A8 *proc)
{
    proc->unk58 = 0;
    gUnknown_0202F20C = -0xF0;
    sub_08063980(0);
    sub_080638D0((int)sub_0806A158);
}

/* The per-frame body of the sub_0806A1A8 slide: eases the scroll offset from
 * -0xF0 back to 0 over ten frames, then tears the H-blank handler down. The
 * `cmp r0, #0xa` tests the value already written back, so the increment is
 * before the test and not a post-increment inside it. */
void sub_0806A1D0(struct Unk806A1D0 *proc)
{
    gUnknown_0202F20C = Interpolate(0, -0xF0, 0, proc->unk58, 10);
    proc->unk58++;
    if (proc->unk58 == 10)
    {
        sub_080638D0(0);
        sub_08072C40(0, 0, 0);
        Proc_Break(proc);
    }
}
