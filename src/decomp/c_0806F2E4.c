#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806F2E4.
 * sub_0806F2E4 @ 0x0806F2E4
 */

#include "proc.h"
/* A two-phase blink: unk58 counts frames, unk5c is the "hidden" flag. Hidden
 * for 0x1e frames, then shown until frame 0x3c, and the sprite is drawn only
 * while shown.
 *
 * The nesting is a readout, not a guess: the FIRST test's false branch skips
 * the second unk5c reload entirely (`beq` past _0806F300) while the 0x1e test's
 * false branch lands ON it, so the second `if (proc->unk5c != 0) return;` is
 * INSIDE the first block. An `&&` would send both to the same label. */
struct Unk0806F2E4Proc
{
    /* 0x00 */ u8 filler_00[0x58];
    /* 0x58 */ s32 unk58;
    /* 0x5c */ s32 unk5c;
};

void sub_0806F2E4(struct Unk0806F2E4Proc *proc)
{
    proc->unk58++;

    if (proc->unk5c != 0)
    {
        if (proc->unk58 > 0x1e)
        {
            proc->unk5c = 0;
            proc->unk58 = 0;
        }

        if (proc->unk5c != 0)
            return;
    }

    if (proc->unk58 > 0x3c)
    {
        proc->unk5c = 1;
        proc->unk58 = 0;
    }

    if (proc->unk5c == 0)
        PutSprite(0, 0x48, 0x38, gUnknown_08582C8C, 0);
}
