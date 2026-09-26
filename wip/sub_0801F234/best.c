#include "global.h"
void sub_0801F234(int a)
{
    struct Unk0200F920 *e;
    int i;
    u16 tile;
    u32 n;
    i = sub_0801F3D4(a);
    e = &gUnknown_0200F920[i];
    tile = e->unk08[e->unk05].unk00;
    do {
        n = gUnknown_0848B780[a].unk00 * gUnknown_0848B780[a].unk01;
    } while (0);
    CpuFastSet(sub_0801F444(a, i),
               (u8 *)e->unk00 + (tile & 0x3FF) * 32,
               (n & 0x3FF) * 32 / 4);
    e->unk08[e->unk05].unk02 = a;
    e->unk05++;
    e->unk08[e->unk05].unk00 = tile + n;
}