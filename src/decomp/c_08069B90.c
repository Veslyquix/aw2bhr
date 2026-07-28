#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08069B90.
 * sub_08069B90 @ 0x08069B90
 */

#include "hardware.h"
#include "proc.h"
/* A 50-frame scripted intro: the switch fires on the ELAPSED frame
 * (0x32 - the remaining count), which is why the jump table runs the opposite
 * way to the field it reads. Frames 14 and 28 fall through into frame 0's
 * body; frame 42 is a separate copy because it is the last case textually. */
struct Unk69B90Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2c);
    /* 2C */ int unk2c; /* frames remaining, counts down from 0x32 */
};

void sub_08069B90(struct Unk69B90Proc *proc)
{
    switch (0x32 - proc->unk2c)
    {
    case 6:
    case 20:
    case 34:
        Proc_EndEach(gUnknown_08581108);
        break;

    case 1:
    case 15:
    case 29:
    case 43:
        SetDispEnable(0, 0, 1, 0, 1);
        break;

    case 14:
    case 28:
        SetDispEnable(0, 0, 1, 0, 1);
        /* fall through */
    case 0:
        sub_080678BC(1);
        break;

    case 42:
        SetDispEnable(0, 0, 1, 0, 1);
        sub_080678BC(1);
        break;
    }

    if (proc->unk2c != 0)
    {
        proc->unk2c--;
    }
    else
    {
        Proc_Break(proc);
        Proc_EndEach(gUnknown_08581108);
        Proc_EndEach(gUnknown_08580FF4);
        SetDispEnable(0, 0, 0, 0, 0);
    }
}
