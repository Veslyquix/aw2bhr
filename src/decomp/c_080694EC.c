#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080694EC.
 * sub_080694EC @ 0x080694EC
 */

#include "proc.h"
#include "hardware.h"
struct Unk694ECProc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ int unk2c;
};

void sub_080694EC(struct Unk694ECProc *proc)
{
    int i;

    switch (0xbe - proc->unk2c)
    {
    case 2:
        SetDispEnable(1, 1, 1, 0, 1);
        Decompress(gUnknown_081837A0, (void *)0x06008000);
        break;

    case 0xb:
        sub_08067BD0(2, 1, 0x1e, proc);
        break;

    case 0x1e:
        sub_08067A24();
        break;

    case 0x2a:
        for (i = 1; i < 16; i++)
            gPal[i] = 0x7fff;
        sub_080135A4();
        sub_08067820();
        break;

    case 0x2e:
        ApplyPaletteExt((u16 *)gUnknown_0823BDE0, 0, 0x20);
        sub_08067D04(2, 0, 0xc, proc);
        sub_080679D8(2, 1, 0x120, 0x80, 0, -0x4000, 0x100, 0xc0, 0xc, proc);
        break;

    case 0x5c:
        for (i = 1; i < 16; i++)
            gPal[i] = 0x7fff;
        sub_080135A4();
        break;

    case 0x5e:
        sub_08012C48((struct Unk8012C30 *)&gUnknown_03002B6C, 2);
        sub_08012C1C((struct Unk8012C30 *)&gUnknown_03002B6C, 0x0600D000);
        Decompress(gUnknown_08183CA8, (void *)0x06004800);
        Decompress(gUnknown_08184A74, gUnknown_08499578);
        for (i = 0; i < 0x400; i++)
            gUnknown_08499578[i] += 0x140;
        sub_08013AEC();
        break;

    case 0x60:
        ApplyPaletteExt((u16 *)gUnknown_0823BDE0, 0, 0x20);
        sub_08067C7C(0x32);
        sub_08067A24();
        sub_08067DD4(proc);
        sub_08067D4C();
        break;
    }

    if (proc->unk2c != 0)
        proc->unk2c--;
    else
        Proc_Break(proc);
}
