#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08060110.
 * sub_08060110 @ 0x08060110
 */

/* NOT MATCHED -- 96 bytes, same size, register naming only. See parked.json. */
void sub_08060110(void)
{
    u8 *p;
    u8 *rows;
    u8 *cells;
    struct Unk08499594 **tbl;
    struct Unk08499594 *u;
    int t;
    int off;

    sub_08025E08(gUnknown_030046C0.unk02, gUnknown_030046C0.unk03,
                 gUnknown_030046C0.unk01);

    tbl = &gUnknown_08499594;
    p = gUnknown_08499590;
    t = gUnknown_030046C0.unk03 * 2;
    rows = p + 0x417A;
    off = *(u16 *)(rows + t) + gUnknown_030046C0.unk02;
    cells = p + 0x12;
    u = *tbl + cells[off];

    u->unk09 = 0;
    u->unk0a = 0;
    u->unk0b = gUnknown_030046C0.unk06;

    gUnknown_030045D4 = 0xb;
}
