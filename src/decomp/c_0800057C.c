#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800057C.
 * sub_0800057C @ 0x0800057C
 */

/* Wave 37 (W37-E). Matched first attempt.
 * A ten-entry jump table (`cmp #9; bhi`) over gUnknown_0200B0B0->unk04 with only
 * seven arms. Cases 4 and 8 fall to the join because nothing is written for
 * them, but `case 9:` HAS to be spelled out even though its body is empty --
 * the table's extent is the largest case label, and without it agbcc emits
 * `cmp #7; bhi` and an eight-entry table. */

void sub_0800057C(void)
{
    switch (gUnknown_0200B0B0->unk04)
    {
    case 0:
        sub_080005FC();
        break;
    case 1:
        sub_0800081C();
        break;
    case 2:
        sub_08005F4C();
        break;
    case 3:
        sub_08004CA0();
        break;
    case 5:
        sub_08000694();
        break;
    case 6:
        sub_08000650();
        break;
    case 7:
        sub_08000664();
        break;
    case 9:
        break;
    }
}
