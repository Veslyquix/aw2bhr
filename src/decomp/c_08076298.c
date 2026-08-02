#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08076298.
 * sub_08076298 @ 0x08076298
 */

#include "proc.h"
struct Unk8076298
{
    /* 0x00 */ u8 filler_00[0x3a];
    /* 0x3a */ s8 unk3a;
    /* 0x3b */ u8 filler_3b[0x5];
    /* 0x40 */ int unk40;
};

void sub_08076298(ProcPtr procv)
{
    struct Unk8076298 *proc = procv;
    int n;
    u32 a;
    u32 b;

    a = 0;
    CpuFastSet(&a, gUnknown_08499578 + 0x200, 0x01000040);
    b = 0;
    CpuFastSet(&b, gUnknown_08499580 + 0x200, 0x01000040);

    sub_08013AEC();
    sub_08013B0C();

    n = gUnknown_0861445C[proc->unk40];

    if (proc->unk3a < 0)
    {
        sub_08071900(gUnknown_08551A00 + (0x14D - n), gUnknown_08499578 + 0x200,
                     n, 4);
        sub_08071900(gUnknown_08551A04 + (0x14D - n), gUnknown_08499580 + 0x200,
                     n, 4);
    }
    else
    {
        sub_08071900(gUnknown_08551A00 + 0x140, gUnknown_08499578 + (0x21E - n),
                     n, 4);
        sub_08071900(gUnknown_08551A04 + 0x140, gUnknown_08499580 + (0x21E - n),
                     n, 4);
    }

    proc->unk40++;

    if (proc->unk40 == 4)
    {
        proc->unk40 = 0;
        Proc_Break(proc);
    }
}
