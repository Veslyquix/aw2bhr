#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08059E3C.
 * sub_08059E3C @ 0x08059E3C
 */

/* WAVE 84 (W84-C) PROMOTION: work/sub_08059E3C/best.c measured by shell
 * trymatch.py at 232/232 with TWO differing bytes (99.1%, first diff +0x3e)
 * and superseded the wave-59..83 4-byte draft; canonical MCP verdict confirms.
 * Source of the gain (permuter normalised, semantics-checked):
 *  - LIVE `q = gUnknown_03003340[y];` row-pointer local feeding
 *    `new_var2 = q[x]; if ((s8)new_var2 < 0)` -- all earlier probes of a row
 *    copy were DEAD statements and byte-neutral; a live one re-anchors picks;
 *  - the `== 0` guard constant routes through a live int local `new_var`.
 * REMAINING RESIDUAL was 2 bytes = one halfword pair at +0x3e:
 *     ROM  ldr r0, [r1, #0] ; adds r0, r0, r5
 *     cand ldr r2, [r1, #0] ; adds r0, r2, r5
 * Then chained permute --current from this anchor FOUND THE MATCH; the winning
 * candidate's only further delta is splitting the row-pointer local:
 *     u8 *new_var3 = gUnknown_03003340[y]; q = new_var3;
 * Both former pairs (+0x3c ldr[sp], +0x4c mov ip) already MATCHED.
 */

struct Unk5A514Cell
{
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ s16 v;
};

void sub_08059E3C(void *a1)
{
    struct Unk5A514Cell *out;
    u8 *q;
    u8 new_var2;
    u8 *rows;
    int t;
    u8 *cells;
    int new_var;
    u8 *plane;
    int x;
    int y;
    int off;
    u8 *new_var3;

    out = a1;

    for (y = 0; y < (*(u16 *)(gUnknown_08499590 + 2)); y++)
    {
        for (x = 0; x < (*(u16 *)gUnknown_08499590); x++)
        {
            new_var3 = gUnknown_03003340[y];
            q = new_var3;

            gUnknown_03003340[y][x] = gUnknown_03003340[y][x] + 0;
            new_var2 = q[x];
            if (((s8)new_var2) < 0)
                continue;

            q = gUnknown_08499590;
            new_var = 0;
            t = y * 2;
            rows = q + 0x417a;
            off = (*(u16 *)(rows + t)) + x;
            cells = q + 0x1432;

            if (gUnknown_085767D5[cells[off] & 0x1f] == new_var)
                continue;
            if ((cells[off] & 0xe0) != gUnknown_03004084)
                continue;

            plane = q + 0x376a;

            do
            {
                if (plane[off] == 0)
                    continue;

                out->x = x;
                out->y = y;
                out->v = (s8)gUnknown_03003340[y][x];
                out++;
            } while (0);
        }
    }

    out->v = 0xFFFF;
}
