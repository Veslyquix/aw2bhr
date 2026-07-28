#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08056E28.
 * sub_08056E28 @ 0x08056E28
 */

/* A five-field request record: two indices then four values, all u16. */
struct Unk56E28
{
    /* 00 */ u16 unk00;
    /* 02 */ u16 unk02;
    /* 04 */ u16 unk04;
    /* 06 */ u16 unk06;
    /* 08 */ u16 unk08;
    /* 0a */ u16 unk0a;
    /* 0c */ u16 unk0c;
};

/* Copies a motion request into gUnknown_02029A10[group].entries[slot]. The
 * 0xb4 and 0x24 strides in the address arithmetic are exactly the declared
 * sizes of struct Unk02029A10Group and struct Unk02029A10, which is what fixes
 * the two indices as group-then-entry. The address is rebuilt from scratch for
 * all five stores, so the source repeated the whole subscript rather than
 * binding a pointer.
 *
 * The last statement needs the local. Without it the fifth value is loaded
 * AFTER its destination address (destination-before-value being the normal
 * expansion order) and r0 stays free, so the function comes out with
 * `push {r4, lr}` and no r5. Naming the value in a statement of its own is
 * what makes it live across the address computation and buys the second
 * callee-saved register the ROM pushes. `int` for the local is byte-identical.
 */
void sub_08056E28(struct Unk56E28 *p)
{
    u16 v;

    gUnknown_02029A10[p->unk00].entries[p->unk02].xSub = p->unk04;
    gUnknown_02029A10[p->unk00].entries[p->unk02].xStep = p->unk06;
    gUnknown_02029A10[p->unk00].entries[p->unk02].ySub = p->unk08;
    gUnknown_02029A10[p->unk00].entries[p->unk02].yStep = p->unk0a;
    v = p->unk0c;
    gUnknown_02029A10[p->unk00].entries[p->unk02].frameCount = v;
}
