#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08074F2C.
 * sub_08074F2C @ 0x08074F2C
 *
 * Named per src/aw2e-names.s (proc-table labels auto-generated from
 * AW2E.lua). The old sub_XXXXXXXX symbols are kept as linker aliases
 * below so every other unit keeps resolving them unchanged.
 */

#include "hardware.h"
#include "proc.h"
struct Unk08074F2C
{
    /* 0x00 */ u8 filler_00[0x2a];
    /* 0x2a */ u16 unk2a;
    /* 0x2c */ s16 unk2c;
    /* 0x2e */ u16 unk2e;
    /* 0x30 */ u16 unk30;
    /* 0x32 */ u8 filler_32[0x34 - 0x32];
    /* 0x34 */ int unk34;
};

void WM_DrawDifficultyStars_IDLE_08074F2D(struct Unk08074F2C *proc)
{
    int scale = 0x100;
    int t = Interpolate(0, 8, scale, proc->unk34, 6);

    SetObjAffine(proc->unk2a,
                 Div(COS_Q12(0) * 16, scale),
                 Div(-SIN_Q12(0) * 16, t),
                 Div(SIN_Q12(0) * 16, scale),
                 Div(COS_Q12(0) * 16, t));

    PutSpriteExt(1, proc->unk2c | (proc->unk2a << 9),
                 (s16)(scale | proc->unk2e),
                 gUnknown_081CC4E8, gUnknown_0861433C[proc->unk30]);

    if (t == scale)
    {
        proc->unk34 = 0;
        Proc_Break(proc);
    }

    proc->unk34++;
}

asm(".global sub_08074F2C\n.thumb_set sub_08074F2C, WM_DrawDifficultyStars_IDLE_08074F2D\n");
