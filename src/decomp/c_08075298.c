#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08075298.
 * sub_08075298 @ 0x08075298
 */

#include "proc.h"
struct Unk08075298
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ int unk2c;
    /* 0x30 */ u8 filler_30[0x04];
    /* 0x34 */ u16 unk34;
    /* 0x36 */ u16 unk36;
    /* 0x38 */ u16 unk38;
};

void sub_08075298(ProcPtr parent, int a2, u16 a3, u16 a4, u16 a5)
{
    struct Unk08075298 *proc = Proc_Start(gUnknown_08614390, parent);

    proc->unk34 = a3;
    proc->unk36 = a4;
    proc->unk2c = a2;
    proc->unk38 = a5;
}
