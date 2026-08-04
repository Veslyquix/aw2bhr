#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08035850.
 * sub_08035850 @ 0x08035850
 */

#include "proc.h"
/* Scans the three gUnknown_03003124 slots for a free one and, if there is one,
 * starts the gUnknown_0849BDB8 proc and seeds it. `i == 3` is the "all busy"
 * exit, and the loop is the ordinary rotated form -- the peeled `ldrb [r2]`
 * ahead of the backward branch is the first iteration's test, not a guard.
 *
 * All three parameters are `int`: each reaches its use with no narrowing in
 * front of it (`lsls #4` straight off the incoming register for the first two,
 * a bare `strb` for the third), and an s16 parameter would have needed a
 * sign-extension before the shift. `pop {r0}` makes the function void. */
struct Unk35850Proc
{
    /* 0x00 */ PROC_HEADER;
    /* 0x29 */ STRUCT_PAD(0x29, 0x35);
    /* 0x35 */ u8 unk35;
    /* 0x36 */ u8 unk36;
    /* 0x37 */ STRUCT_PAD(0x37, 0x42);
    /* 0x42 */ s16 unk42;
    /* 0x44 */ s16 unk44;
};

void sub_08035850(int a1, int a2, int a3)
{
    struct Unk35850Proc *proc;
    int i;

    for (i = 0; i < 3; i++)
        if (gUnknown_03003124[i] == 0)
            break;

    if (i != 3)
    {
        proc = Proc_Start(gUnknown_0849BDB8, PROC_TREE_5);
        proc->unk42 = a1 * 16;
        proc->unk44 = a2 * 16;
        proc->unk35 = 2;
        proc->unk36 = a3;
    }
}
