#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080110A4.
 * sub_080110A4 @ 0x080110A4
 */

#include "hardware.h"
#include "proc.h"
/* sub_08071D70's 0x08011 twin: the same fade-up stepper one binary point
 * further left -- clamp 0x1000 instead of 0x100, publish `>> 8` instead of
 * `>> 4`.
 *
 * The comparison LOOKS different and is not. 0xFFF does not fit an imm8, so
 * agbcc cannot sign-extend and compare; it leaves the value in the `lsls #0x10`
 * domain and compares against a pooled 0x0FFF0000 instead. sub_08071D70's
 * 0xFF does fit, so that one gets `asrs #0x10; cmp #0xff`. Same C, two
 * comparison idioms, picked by whether the constant is an imm8. */
struct Unk80110A4
{
    /* 0x00 */ u8 filler_00[0x64];
    /* 0x64 */ s16 unk64;
    /* 0x66 */ s16 unk66;
};

void sub_080110A4(struct Unk80110A4 *proc)
{
    if (gUnknown_03001FFC == 0x10)
    {
        Proc_End(proc);
        return;
    }

    proc->unk66 += proc->unk64;

    if (proc->unk66 > 0xFFF)
        proc->unk66 = 0x1000;

    gUnknown_03001FFC = proc->unk66 >> 8;
}
