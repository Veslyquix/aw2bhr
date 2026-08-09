#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080555F0.
 * sub_080555F0 @ 0x080555F0
 */

/* The 24-byte gUnknown_085D6A48 row, viewed from this function only. The
 * shared declaration stays `u16 [][12]`: as an array subscript agbcc
 * reassociates the +0x10 out of the load (`add rBase,#0x10; add; ldrh [r0]`)
 * where the ROM keeps it in the `ldrh` displacement, which is the
 * "column-offset fold" split recorded on gUnknown_03004580 in
 * include/unknown-globals.h. gUnknown_03004580 in the same statement wants the
 * array form and gets it. */
struct Unk555F0Row
{
    /* 0x00 */ u8 filler_00[0x10];
    /* 0x10 */ u16 unk10;
    /* 0x12 */ u8 filler_12[0x06];
};

void sub_080555F0(u16 a, u16 b)
{
    struct Unk555F0Row *rows;

    gUnknown_030045A0[a] = 0;
    rows = (struct Unk555F0Row *)gUnknown_085D6A48;
    if (rows[gUnknown_03004580[a][1]].unk10 == 1)
        gUnknown_030045A0[a] = 3;
    if (gUnknown_02029BE8[a] == 1)
        gUnknown_030045A0[a] = 1;
    if (gUnknown_02029BE8[a] == 2 && b == a)
        gUnknown_030045A0[a] = 2;
}
