#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08060110.
 * sub_08060110 @ 0x08060110
 */

/* MATCHED. */
void sub_08060110(void)
{
    struct Unk08499594 **tbl;
    struct Unk08499594 *u;
    int off;

    BuyUnit(gUnknown_030046C0.unk02, gUnknown_030046C0.unk03,
                 gUnknown_030046C0.unk01);

    tbl = &gUnits;
    off = gMap->rowOffset[gUnknown_030046C0.unk03] + gUnknown_030046C0.unk02;
    u = *tbl + gMap->unit[off];

    u->unk09 = 0;
    u->unk0a = 0;
    u->unk0b = gUnknown_030046C0.unk06;

    gUnknown_030045D4 = 0xb;
}
