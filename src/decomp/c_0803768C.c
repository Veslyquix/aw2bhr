#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803768C.
 * sub_0803768C @ 0x0803768C, sub_080376DC @ 0x080376DC
 */

void sub_0803768C(int a, int b, int c, int d)
{
    gUnknown_0300057C = d;
    ApplyPaletteExt(gUnknown_081253F0, (u16)(d * 0x20), 0x20);
    sub_080377C4((void *)(a + (c & 0x3ff) * 32));
    sub_08037A20((u16 *)b, (d << 12) | c);
}

void sub_080376DC(void *a, int b, int c, int d, int e, int f)
{
    int tile;
    u8 *p;

    tile = (u16)b;

    gUnknown_0300057C = f;
    ApplyPaletteExt(gUnknown_081253F0, (u16)(f * 0x20), 0x20);

    p = (u8 *)a + (tile & 0x3ff) * 32;
    sub_0801B6EC(p);
    sub_0801B6FC(p);

    sub_08037A20(sub_08013D00(c, d, e), (f << 12) | tile);
    sub_08013AD4(c);
}
