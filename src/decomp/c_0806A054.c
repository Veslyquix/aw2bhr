#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806A054.
 * sub_0806A054 @ 0x0806A054
 */

#include "hardware.h"
/* The screen-setup half of a 0x0806A054 proc: takes a ticket from
 * sub_080674F4, installs a script, rebuilds the display state, loads the
 * palette and two graphics blobs, resets the four scroll channels and starts
 * the follow-up proc under itself.
 *
 * The four BG-control shadows are four `priority = N` bitfield stores, not a
 * mixture: gUnknown_03001FE8 gets a bare `orrs #3` with no preceding mask only
 * because `(x & ~3) | 3` folds to `x | 3` -- the other three all carry the
 * `movs #4; rsbs` clear that is the two-bit-field tell. Reading the missing
 * AND as "this one is |= 3 and the others are = N" is the trap.
 *
 * `SetDispEnable(0, 1, 1, 1, 1)` is one macro and not five statements: only
 * bg0's zero emits its `& ~1`, and the four ones fold into consecutive `orrs`
 * against the same loaded byte. */
struct Unk0806A054
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ u32 unk2c;
};

void sub_0806A054(struct Unk0806A054 *proc)
{
    proc->unk2c = sub_080674F4(gUnknown_0202F204++);
    sub_080670F8(gUnknown_085814A8);
    gDispIo.disp_ct.mode = 0;
    SetDispEnable(0, 1, 1, 1, 1);
    gUnknown_03002B6C.bits.priority = 0;
    gUnknown_0300251C.bits.priority = 1;
    gUnknown_030030B4.bits.priority = 2;
    gUnknown_03001FE8.bits.priority = 3;
    sub_08012358();
    ApplyPalettes(gUnknown_0822FE50, 1, 5);
    Decompress(gUnknown_0822FEF0, (void *)0x06000000);
    Decompress(gUnknown_0822F9AC, gUnknown_0849957C);
    sub_08013AFC();
    sub_08069FD0();
    sub_08072C40(0, 0, 0);
    sub_08072C40(1, 0, 0);
    sub_08072C40(2, 0, 0);
    sub_08072C40(3, 0, 0);
    sub_080677BC(1, 2, 1, proc);
}
