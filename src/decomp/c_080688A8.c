#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080688A8.
 * sub_080688A8 @ 0x080688A8, sub_080688C8 @ 0x080688C8
 */

/* The opening line of src/decomp/c_080688E4.c on its own:
 * proc->unk2c = sub_080674F4(gUnknown_0202F204++). The post-increment is on a
 * u8 global, so the lsls #0x18; lsrs #0x18 after the strb is the argument's
 * own truncation and not a cast at the call. */
struct Unk688A8Proc
{
    /* 00 */ u8 filler_00[0x2c];
    /* 2C */ int unk2c;
};
#include "proc.h"
/* The countdown half of the pair sub_080688A8 arms: tick unk2c down and break
 * once it reaches 0. int from the ldr/str, matching sub_080688A8's own store
 * of sub_080674F4's int result.
 *
 * The unconditional b over the Proc_Break arm is the if/else -- the ROM tests
 * != 0 and falls into the decrement, so the break is the else. */
struct Unk688C8Proc
{
    /* 00 */ u8 filler_00[0x2c];
    /* 2C */ int unk2c;
};

void sub_080688A8(struct Unk688A8Proc *proc)
{
    proc->unk2c = sub_080674F4(gUnknown_0202F204++);
}

void sub_080688C8(struct Unk688C8Proc *proc)
{
    if (proc->unk2c != 0)
        proc->unk2c--;
    else
        Proc_Break(proc);
}
