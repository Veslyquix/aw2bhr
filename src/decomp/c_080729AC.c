#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080729AC.
 * sub_080729AC @ 0x080729AC, sub_080729CC @ 0x080729CC
 */

#include "proc.h"
struct Unk729ACProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};
struct Unk729CCProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};

/* Starts a blocking proc and snapshots sub_08034F6C()'s current value into it;
 * sub_080729CC is the matching wait that breaks when the value comes back
 * round to the snapshot. +0x64 is s16 because sub_080729CC reads it with
 * `ldrsh` off a zero index register. sub_08034F6C returns a full `int` (its
 * result is compared unnarrowed), so the store is the only conversion. */
void sub_080729AC(ProcPtr parent)
{
    struct Unk729ACProc *proc = Proc_StartBlocking(gUnknown_08614014, parent);

    proc->unk64 = sub_08034F6C();
}

/* The wait half of sub_080729AC: block until sub_08034F6C() matches the
 * snapshot taken at start. See sub_080729AC for the +0x64 typing. */
void sub_080729CC(struct Unk729CCProc *proc)
{
    if (sub_08034F6C() == proc->unk64)
        Proc_Break(proc);
}
