#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806A2F8.
 * sub_0806A2F8 @ 0x0806A2F8
 */

struct Unk806A2F8
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ u32 unk2c;
};

/* The same ticket-taking opening as sub_0806A054, without the screen setup:
 * post-increment the counter, pass the OLD value, stash the result. */
void sub_0806A2F8(struct Unk806A2F8 *proc)
{
    proc->unk2c = sub_080674F4(gUnknown_0202F204++);
    sub_0801237C();
}
