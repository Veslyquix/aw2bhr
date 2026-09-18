#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080110EC.
 * sub_080110EC @ 0x080110EC
 *
 * Named per src/aw2e-names.s (proc-table labels auto-generated from
 * AW2E.lua). The old sub_XXXXXXXX symbols are kept as linker aliases
 * below so every other unit keeps resolving them unchanged.
 */

#include "hardware.h"
#include "proc.h"
struct Unk80110ECProc
{
    /* 0x00 */ u8 filler_00[0x64];
    /* 0x64 */ s16 unk64;
    /* 0x66 */ s16 unk66;
};

/* sub_08011054's fade-down twin: same body with the flag sense inverted and
 * the two seeds 0x10 / 0x1000 instead of 0 / 0. */
void DesignRoomFadeIn_080110ED(struct Unk80110ECProc *proc)
{
    if (gUnknown_03002B5C == 0)
    {
        Proc_End(proc);
        return;
    }

    gUnknown_03002B5C = 0;
    sub_08010FA0();
    gUnknown_030030E0.bits.effect = 3;
    gUnknown_03001FFC = 0x10;
    proc->unk64 = 0x100;
    proc->unk66 = 0x1000;
}

asm(".global sub_080110EC\n.thumb_set sub_080110EC, DesignRoomFadeIn_080110ED\n");
