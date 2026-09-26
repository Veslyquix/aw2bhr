#include "global.h"
#include "hardware.h"

void sub_0808A3DC(void)
{
    u16 fill;
    int i;

    fill = 0;
    CpuSet(&fill, gUnknown_0849957C, 0x01000400);

    Decompress(gUnknown_0823E7A0,
               (void *)(0x06000400 + gUnknown_03001FE8.bits.chr_block * 0x4000));
    Decompress(gUnknown_0823E684, gUnknown_0849957C + 0x200);

    for (i = 0; i <= 0x3FF; i++)
        ((vu16 *)gUnknown_0849957C)[i] += 0x1020;

    sub_0802D5CC(3, 1);

    CpuFastSet(gUnknown_0849957C,
               (void *)(0x06000800 + gUnknown_03001FE8.bits.tm_block * 0x800),
               0x200);
}
