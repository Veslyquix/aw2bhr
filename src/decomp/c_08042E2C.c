#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042E2C.
 * sub_08042E2C @ 0x08042E2C, sub_08042E64 @ 0x08042E64, sub_08042E84 @ 0x08042E84, sub_08042EBC @ 0x08042EBC, sub_08042EDC @ 0x08042EDC, sub_08042F14 @ 0x08042F14, sub_08042F34 @ 0x08042F34, sub_08042F5C @ 0x08042F5C, sub_08042F7C @ 0x08042F7C, sub_08042FA4 @ 0x08042FA4, sub_08042FC4 @ 0x08042FC4, sub_08042FFC @ 0x08042FFC, sub_0804301C @ 0x0804301C, sub_08043050 @ 0x08043050
 */

int sub_08042E2C(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 10;

    return gUnknown_085D3DD0[a].unk40[b].unk06;
}

int sub_08042E64(int a1)
{
    return sub_08042E2C(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

int sub_08042E84(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk40[b].unk08;
}

int sub_08042EBC(int a1)
{
    return sub_08042E84(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

int sub_08042EDC(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 100;

    return gUnknown_085D3DD0[a].unk40[b].unk0e + 100;
}

int sub_08042F14(int a1)
{
    return sub_08042EDC(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

int sub_08042F34(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk08;
}

int sub_08042F5C(int a1)
{
    return sub_08042F34(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

int sub_08042F7C(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk06;
}

int sub_08042FA4(int a1)
{
    return sub_08042F7C(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

int sub_08042FC4(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk40[b].unk0a;
}

int sub_08042FFC(int a1)
{
    return sub_08042FC4(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

u32 sub_0804301C(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk40[b].unk00;
}

u32 sub_08043050(int a1)
{
    return sub_0804301C(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}
