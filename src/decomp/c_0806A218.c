#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806A218.
 * sub_0806A218 @ 0x0806A218
 */

#include "proc.h"
#include "hardware.h"
struct Unk806A218
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ int unk2c;
};

void sub_0806A218(struct Unk806A218 *proc)
{
    u32 zero;

    switch (0x128 - proc->unk2c)
    {
    case 0:
        sub_08069FAC(0, 1, 0x61, proc);
        break;

    case 0x62:
        sub_08069FAC(1, 4, 0x61, proc);
        break;

    case 0xc4:
        sub_08069FAC(0, 2, 0x61, proc);
        break;

    case 0x11c:
        zero = 0;
        CpuFastSet(&zero, (void *)0x0600D000, 0x01000400);
        ApplyPaletteExt(gUnknown_0817C3E8, 0, 0x20);
        Decompress(gUnknown_081866F8, (void *)0x06000000);
        Decompress(gUnknown_08186D4C, gUnknown_08499578);
        sub_08013AEC();
        break;

    case 0x11d:
        gDispIo.disp_ct.bg0_enable = 1;
        gDispIo.disp_ct.bg1_enable = 1;
        gDispIo.disp_ct.bg2_enable = 1;
        gDispIo.disp_ct.bg3_enable = 1;
        gDispIo.disp_ct.obj_enable = 1;
        Proc_Start(gUnknown_085814E8, proc);
        break;
    }

    if (proc->unk2c != 0)
    {
        proc->unk2c--;
    }
    else
    {
        Proc_Break(proc);
        sub_08067820();
    }
}
