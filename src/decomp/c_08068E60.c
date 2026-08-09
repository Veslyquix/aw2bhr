#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08068E60.
 * sub_08068E60 @ 0x08068E60
 */

#include "hardware.h"
#include "proc.h"
struct Unk08068E60
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ u32 unk2c;
};

void sub_08068E60(struct Unk08068E60 *proc)
{
    int i;
    u32 zero0;
    u32 zero1;
    u32 zero2;
    u32 zero3;

    proc->unk2c = sub_080674F4(gUnknown_0202F204++);
    gDispIo.disp_ct.mode = 1;
    SetDispEnable(1, 1, 1, 0, 1);
    gUnknown_030030B4.bits.priority = 0;
    gUnknown_03001FE8.bits.priority = 1;
    gUnknown_03002B6C.bits.priority = 2;
    gUnknown_0300251C.bits.priority = 3;
    sub_08012358();
    sub_08063994();
    sub_08012C48((struct Unk8012C30 *)&gUnknown_03001FE8, 1);
    sub_08012C48((struct Unk8012C30 *)&gUnknown_030030B4, 2);
    gUnknown_030030B4.bits.wrap = 0;
    zero0 = 0;
    CpuFastSet(&zero0, (void *)0x0600E000, 0x01000400);
    zero1 = 0;
    CpuFastSet(&zero1, gUnknown_08499580, 0x01000400);
    ApplyPalettes(gUnknown_08183C28, 0, 4);
    ApplyPalette((u16 *)gUnknown_0823BDE0, 0);
    Decompress(gUnknown_081837A0, (void *)0x06008000);
    Decompress(gUnknown_081838EC, gUnknown_08499580);
    Decompress(gUnknown_0823A3D4, (void *)0x06002800);
    Decompress(gUnknown_08239FA4, gUnknown_08499578);

    for (i = 0; i < 0x400; i++)
        gUnknown_08499578[i] += 0x140;

    zero2 = 0;
    CpuFastSet(&zero2, (void *)0x06000000, 0x01000008);
    zero3 = 0;
    CpuFastSet(&zero3, (void *)0x06008000, 0x01000008);
    sub_08013AEC();
    sub_08013B0C();
    sub_08013B1C();
    sub_08072C40(0, 0, 0);
    sub_08072C40(1, 0, 0);
    sub_08072C40(2, 0, 0);
    sub_080677BC(0, 4, 4, proc);
    sub_080679D8(1, 1, 0, 0x88, 0x3800, 0, 0xc0, 0x100, 0xe, proc);
}
