#include "global.h"
#include "proc.h"

struct PalFade
{
    /* 0x00 */ u16 unk00[16];
    /* 0x20 */ u16 *unk20;
    /* 0x24 */ u16 *unk24;
    /* 0x28 */ u16 unk28;
    /* 0x2A */ u16 unk2A;
    /* 0x2C */ u16 unk2C;
};

struct PalFadeProc
{
    /* 0x00 */ u8 unk00[0x2c];
    /* 0x2C */ struct PalFade *unk2C;
};

void sub_08071B9C(struct PalFadeProc *proc)
{
    int i;
    struct PalFade *data;
    u16 *src;
    u16 *dst;
    int a, b;
    int ar, ag, ab;
    int br, bg, bb;
    int cr, cg, cb;

    data = proc->unk2C;
    src = data->unk20;
    dst = data->unk24;

    if (data->unk28 == data->unk2C || data->unk28 > data->unk2A)
    {
        Proc_End(proc);
        return;
    }

    i = 0;
_loop:
    a = data->unk00[i];
    ar = a & 0x1f;
    ag = a & 0x3e0;
    ab = a & 0x7c00;
    b = src[i];
    br = b & 0x1f;
    bg = b & 0x3e0;
    bb = b & 0x7c00;
    do {
        cr = Interpolate(0, ar, br, proc->unk2C->unk28, proc->unk2C->unk2A);
        cg = Interpolate(0, ag, bg, proc->unk2C->unk28, proc->unk2C->unk2A);
        cb = Interpolate(0, ab, bb, proc->unk2C->unk28, proc->unk2C->unk2A);
    } while (0);
    *dst++ = (cb & 0x7c00) | (cg & 0x3e0) | (cr & 0x1f);
    i++;
    if (i < 16)
        goto _loop;

    sub_080135A4();
    proc->unk2C->unk28++;
}
