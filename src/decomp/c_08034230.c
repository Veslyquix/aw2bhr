#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034230.
 * sub_08034230 @ 0x08034230
 */

#include "proc.h"
struct Unk34230Child
{
    /* 0x00 */ u8 filler_00[0x36];
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 unk37;
    /* 0x38 */ u8 filler_38[0x08];
    /* 0x40 */ int unk40;
    /* 0x44 */ int unk44;
    /* 0x48 */ int unk48;
    /* 0x4c */ int unk4c;
};
struct Unk34230Proc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ struct Unk34230Child *unk2c;
};

void sub_08034230(struct Unk34230Proc *proc)
{
    struct Unk34230Child *child;

    if (sub_0803BD6C() == 0)
    {
        if (Proc_Find(gUnknown_0849BB80) != NULL)
        {
            child = Proc_Start(gUnknown_0849BC50, proc);

            child->unk4c = 0;
            child->unk48 = -1;
            child->unk44 = -1;
            child->unk40 = -1;
            child->unk36 = 1;
            child->unk37 = 1;

            proc->unk2c = child;
            Proc_Goto(proc, 0);
        }
        else
        {
            Proc_Goto(proc, 4);
        }
    }
}
