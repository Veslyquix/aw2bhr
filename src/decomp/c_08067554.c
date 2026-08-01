#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08067554.
 * sub_08067554 @ 0x08067554, sub_08067564 @ 0x08067564
 */

#include "proc.h"
struct Unk67554Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ int unk58;
    /* 5c */ int unk5c;
    /* 60 */ int unk60;
    /* 64 */ u16 unk64;
};
#include "hardware.h"
struct Unk67564Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x60);
    /* 60 */ int unk60;
    /* 64 */ u16 unk64;
};

/* The init half of the sub_08067564 "wait 0x14 frames, then A/START" proc:
 * +0x60 is the countdown sub_08067564 decrements and +0x64 the result flag it
 * sets. Zero is computed once into r2 and reused for all three of its stores,
 * which is ordinary constant CSE and not a memset. +0x64 needs its own `adds`
 * because `strh`'s immediate form tops out at 62. */
void sub_08067554(struct Unk67554Proc *proc)
{
    proc->unk58 = 0;
    proc->unk5c = 0;
    proc->unk60 = 0x14;
    proc->unk64 = 0;
}

/* "Hold the message up for +0x60 more frames, then let A or START dismiss it."
 * sub_08067554 is the matching init and 0x14 the frame count it arms.
 *
 * Key mask 9 is A|START, read off `gpKeySt->held` (+0x04) and not `pressed`
 * (+0x08) -- the offset in the ROM is unambiguous even though a dismiss
 * usually reads the edge. gpKeySt is upstream's own symbol from hardware.h;
 * there is no gUnknown_ at 0x03002EE0 and one cannot be created.
 *
 * The unconditional `b` after the decrement is the if/else, not a `return`:
 * the else arm is the whole key test. */
void sub_08067564(struct Unk67564Proc *proc)
{
    if (proc->unk60 != 0)
    {
        proc->unk60--;
    }
    else if (gpKeySt->held & 9)
    {
        sub_0803B5E8();
        proc->unk64 = 1;
        Proc_Break(proc);
    }
}
