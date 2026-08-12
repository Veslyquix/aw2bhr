#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080258CC.
 * sub_080258CC @ 0x080258CC
 */

/* The gUnknown_08499590 map header seen through the members this function
 * touches: the pixel origin / tile camera pairs at +0x04..+0x0e and THREE byte
 * planes (+0x12, +0x51a, +0x1e42) addressed through the +0x417a row table.
 * Declared LOCALLY and cast onto the `u8 *` symbol, per the rule in
 * include/unknown-globals.h -- only a COMPONENT_REF keeps agbcc from folding
 * the plane constant into a load displacement.  Wave 56, W56-H. */
struct Unk080258CCMap
{
    /* 0x0000 */ u16 unk0000;
    /* 0x0002 */ u16 unk0002;
    /* 0x0004 */ s16 unk0004;
    /* 0x0006 */ s16 unk0006;
    /* 0x0008 */ u16 unk0008;
    /* 0x000a */ u16 unk000a;
    /* 0x000c */ u16 unk000c;
    /* 0x000e */ u16 unk000e;
    /* 0x0010 */ u8 filler_0010[0x02];
    /* 0x0012 */ u8 unk0012[0x508];
    /* 0x051a */ u8 unk051a[0x1928];
    /* 0x1e42 */ u8 unk1e42[0x2338];
    /* 0x417a */ u16 unk417a[0x40];
};
#define MAP ((struct Unk080258CCMap *)gUnknown_08499590)

void sub_080258CC(void)
{
    int i;
    int j;
    int id;
    u8 c;

    MAP->unk000c = MAP->unk0004 / 16;
    MAP->unk000e = MAP->unk0006 / 16;
    MAP->unk0008 = MAP->unk0004;
    MAP->unk000a = MAP->unk0006;
    sub_08023860();
    sub_080213AC();

    for (i = 0; i < MAP->unk0002; i++)
    {
        for (j = 0; j < MAP->unk0000; j++)
        {
            MAP->unk0012[MAP->unk417a[i] + j] = 0;
            MAP->unk051a[MAP->unk417a[i] + j] = 0;
        }
    }

    for (id = 1; id <= 0xFF; id++)
    {
        if (gUnknown_08499594[id].unk00 == 0)
            continue;
        if ((gUnknown_08499594[id].unk01 & 6) == 2)
            continue;
        c = MAP->unk051a[MAP->unk417a[gUnknown_08499594[id].unk03]
                         + gUnknown_08499594[id].unk02];
        if (c != 0)
        {
            if ((gUnknown_08499594[c].unk01 & 4) == 0)
                continue;
        }
        MAP->unk051a[MAP->unk417a[gUnknown_08499594[id].unk03]
                     + gUnknown_08499594[id].unk02] = id;
        if (gUnknown_08499594[id].unk01 & 2)
            continue;
        if (gUnknown_08499598[gUnknown_030033EC].unk1b != 2)
        {
            if (MAP->unk1e42[MAP->unk417a[gUnknown_08499594[id].unk03]
                             + gUnknown_08499594[id].unk02] == 0)
                continue;
        }
        MAP->unk0012[MAP->unk417a[gUnknown_08499594[id].unk03]
                     + gUnknown_08499594[id].unk02] = id;
    }

    for (id = 1; id <= 0xFF; id++)
    {
        if (gUnknown_08499594[id].unk00 == 0)
            continue;
        if ((u8)(gUnknown_08499594[id].unk01 & 2) != 0)
            continue;
        if (gUnknown_08499598[gUnknown_030033EC].unk1b == 2)
            continue;
        if (sub_0802571C(id))
        {
            if (MAP->unk1e42[MAP->unk417a[gUnknown_08499594[id].unk03]
                             + gUnknown_08499594[id].unk02] != 0)
                continue;
        }
        MAP->unk0012[MAP->unk417a[gUnknown_08499594[id].unk03]
                     + gUnknown_08499594[id].unk02] = 0;
    }

    sub_08021D10();
    sub_08022580();
    sub_080227A8();
}
