#include "global.h"

void sub_0801F19C(int a1, void *a2, int a3)
{
    int i;
    u32 n;

    i = sub_0801F3D4(a1);
    n = gUnknown_0848B780[a1].unk00 * gUnknown_0848B780[a1].unk01;

    CpuFastSet(sub_0801F444(a1, i),
               (u8 *)a2 + ((a3 & 0x3FF) << 5),
               ((n & 0x3FF) << 5) >> 2);
}
