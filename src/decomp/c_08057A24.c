#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08057A24.
 * sub_08057A24 @ 0x08057A24
 */

struct Unk8057Pos
{
    /* 0x00 */ u16 x;
    /* 0x02 */ u16 y;
};

void sub_08057A24(u16 *dst, int i, struct Unk8057Pos *pos)
{
    int flip = i & 1;
    int off;

    off = (gUnknown_08553A24 + i)->unk00 + pos->x
        + (((gUnknown_08553A24 + i)->unk01 + pos->y) << 5);
    if (flip)
        sub_080718F8(dst + off, gUnknown_0816D91C, 0x8000);
    else
        sub_080718F8(dst + off, gUnknown_0816D900, 0x7000);
}
