#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080760B4.
 * sub_080760B4 @ 0x080760B4
 */

#include "hardware.h"
#include "proc.h"
/* The VRAM address handed to sub_0801F150 is built from the live BG control
 * shadow: `lsls #0x1c; lsrs #0x1e` is the 2-bit field at bit 2 -- chr_block --
 * read out of a 32-bit `ldr`, which is the width hardware.h records this shadow
 * being used at for bitfield access. `lsls #0xe` then scales it by the 0x4000
 * char-block stride and `movs #0xc0; lsls #0x13` is the 0x6000000 VRAM base.
 *
 * +0x3a is reached by materialising its address (`adds r2, r4, #0; adds r2,
 * #0x3a`) because THUMB's `strb` immediate form stops at 0x1f, not because it
 * is a separate object. The single `movs r1, #0` serves both word stores. */
struct Unk80760B4
{
    /* 0x00 */ u8 filler_00[0x3a];
    /* 0x3a */ s8 unk3a;
    /* 0x3b */ u8 filler_3b[0x1];
    /* 0x3c */ int unk3c;
    /* 0x40 */ int unk40;
};

void sub_080760B4(struct Unk80760B4 *proc)
{
    sub_0801F114();
    sub_0801F150(1,
                 (void *)(0x6000000 + gUnknown_03002B6C.bits.chr_block * 0x4000),
                 0x29, 1);
    sub_0801F234(0x3E);
    sub_0801F234(0x3F);
    sub_0801F234(0x40);
    sub_0801F234(0x41);
    sub_0801F234(0x42);

    proc->unk40 = 0;
    proc->unk3a = 1;
    proc->unk3c = 0;
}
