#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08069154.
 * sub_08069154 @ 0x08069154
 */

#include "proc.h"
/* Takes a ticket and hands it to the same sub_080674F4 slot sub_08068AC4 and
 * sub_08069864 use (+0x2c), loads one blob, then starts a ten-argument
 * sub_080679D8 under itself. The `adds r0, #0x40` in the stack-argument setup
 * is 0xc0 being reused to build 0x100 -- one CSEd constant chain, not two
 * different values. */
struct Unk69154Proc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ int unk2c;
};

void sub_08069154(struct Unk69154Proc *proc)
{
    proc->unk2c = sub_080674F4(gUnknown_0202F204++);
    Decompress(gUnknown_08183A00, gUnknown_08499580);
    sub_08013B0C();
    sub_08013B1C();
    sub_080679D8(1, -1, 0x170, 0x88, -0x3800, 0, 0xc0, 0x100, 0xc, proc);
}
