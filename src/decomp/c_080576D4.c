#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080576D4.
 * sub_080576D4 @ 0x080576D4
 */

struct Unk8057Pos
{
    /* 0x00 */ u16 x;
    /* 0x02 */ u16 y;
};

void sub_080576D4(u16 *dst, int i, struct Unk8057Pos *pos)
{
    sub_080718F8(dst + ((gUnknown_08553A1C + i)->unk00 + pos->x
                        + (((gUnknown_08553A1C + i)->unk01 + pos->y) << 5)),
                 gUnknown_08553AC0[i],
                 (u16)(gUnknown_08562124[i & 1] * 0x1000));
}
