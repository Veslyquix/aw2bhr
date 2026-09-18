#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08007DD0.
 * sub_08007DD0 @ 0x08007DD0
 */

struct MapScreen
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0A22 - 4];
    /* 0x0A22 */ u16 cells[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 terrain[0x417A - 0x1432];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct MapScreen *)gUnknown_08499590)

s16 sub_08007DD0(int x, int y)
{
    int mask = 0;
    int t;

    if (y > 0)
    {
        int ny = y - 1;
        if (x > 0)
            mask |= sub_080015E4(x - 1, ny) << 8;
        mask |= sub_080015E4(x, ny) << 7;
        if (x < MAP->width - 1)
            mask |= sub_080015E4(x + 1, ny) << 6;
    }
    if (x > 0)
        mask |= sub_080015E4(x - 1, y) << 5;
    mask |= sub_080015E4(x, y) << 4;
    if (x < MAP->width - 1)
        mask |= sub_080015E4(x + 1, y) << 3;
    if (y < MAP->height - 1)
    {
        int ny = y + 1;
        if (x > 0)
            mask |= sub_080015E4(x - 1, ny) << 2;
        mask |= sub_080015E4(x, ny) << 1;
        if (x < MAP->width - 1)
            mask |= sub_080015E4(x + 1, ny);
    }

    t = MAP->terrain[MAP->rowOffset[y] + x];
    if (t == 0xd)
        return sub_0800B61C(x, y);
    if (t == 2)
        return -1;
    if (t == 0xc)
    {
        if (sub_08008C34(x, y) == 0)
        {
            register s16 *table asm("r1");
            table = gUnknown_08485DC4;
            return table[mask];
        }
        return -1;
    }
    {
        register s16 *table asm("r1");
        table = gUnknown_08485DC4;
        return table[mask];
    }
}

/* MATCHED, wave 75, 324/324 configured bytes. The two block-local table
 * pointers are fixed to r1 so agbcc emits the ROM's pool-load/index-shift order
 * in both return arms. The .rodata relocation at 0x0808D7F0 is the unit's
 * force-address word and is placed by the promotion metadata. */
